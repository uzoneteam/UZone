
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using UZone.Models;

namespace UZone.Admin
{
    public partial class Calendar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            headerDetail.InnerText = "Setup " + Session["currentSchool"] + " events...";
            if (!Page.IsPostBack)
            {
                LoadScheduler();
            }
            LoadResources();
        }

        protected void RadScheduler1_AppointmentDelete(object sender, SchedulerCancelEventArgs e)
        {
            using (var context = new UzoneEntities())
            {
                Scheduler _scheduler;
                _scheduler = context.Schedulers.Find(e.Appointment.ID);
                if (_scheduler != null)
                {
                    context.Schedulers.Remove(_scheduler);
                    context.SaveChanges();
                }
            }
        }

        protected void RadScheduler1_AppointmentUpdate(object sender, AppointmentUpdateEventArgs e)
        {
            using (var context = new UzoneEntities())
            {
                Scheduler _scheduler;
                _scheduler = context.Schedulers.Find(e.Appointment.ID);
                if (_scheduler != null)
                {
                    _scheduler.EventStart = e.ModifiedAppointment.Start;
                    _scheduler.EventEnd = e.ModifiedAppointment.End;
                    _scheduler.EventDescription = e.ModifiedAppointment.Description;
                    _scheduler.EventSubject = e.ModifiedAppointment.Subject;
                    _scheduler.SchoolID = (long)Session["currentSchoolID"];
                    if (e.Appointment.Resources.FirstOrDefault() != null)
                        _scheduler.EventLocationID = (int)e.Appointment.Resources.First().Key;
                    context.SaveChanges();

                    LoadScheduler();
                }
            }
        }

        protected void RadScheduler1_AppointmentInsert(object sender, SchedulerCancelEventArgs e)
        {
            Scheduler _scheduler = new Scheduler();
            _scheduler.EventStart = e.Appointment.Start;
            _scheduler.EventEnd = e.Appointment.End;
            _scheduler.EventDescription = e.Appointment.Description;
            _scheduler.EventSubject = e.Appointment.Subject;
            _scheduler.SchoolID = (long)Session["currentSchoolID"];
            if (e.Appointment.Resources.FirstOrDefault() != null)
                _scheduler.EventLocationID = (int)e.Appointment.Resources.First().Key;

            using (var context = new UzoneEntities())
            {                
                context.Schedulers.Add(_scheduler);
                context.SaveChanges();

                LoadScheduler();
            }
        }

        private void LoadScheduler()
        {
            using (var context = new UzoneEntities())
            {
                if (Session["currentSchoolID"] != null)
                {
                    var currentSchool = (long)Session["currentSchoolID"];
                    List<Scheduler> _schedulers;
                    _schedulers = context.Set<Scheduler>().Where(s => s.SchoolID == currentSchool).ToList();
                    RadScheduler1.DataSource = _schedulers;
                }
            }
        }

        private void LoadResources()
        {
            using (var context = new UzoneEntities())
            {
                if (Session["currentSchoolID"] != null)
                {
                    var currentSchool = (long)Session["currentSchoolID"];
                    if (RadScheduler1.ResourceTypes.FirstOrDefault() == null)
                    {
                        List<EventLocation> _locations;
                        _locations = context.Set<EventLocation>().Where(l => l.SchoolID == currentSchool && l.Active == true).ToList();
                        ResourceType _item = new ResourceType();
                        _item.DataSource = _locations;
                        _item.ForeignKeyField = "SchoolID";
                        _item.KeyField = "EventLocationID";
                        _item.TextField = "EventLocationName";
                        _item.Name = "Location";                        
                        RadScheduler1.ResourceTypes.Add(_item);
                    }
                }
            }
        }

    }
}