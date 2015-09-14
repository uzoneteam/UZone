using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.Entity;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using UZone.Models;

namespace UZone.Admin
{
    public partial class Register : System.Web.UI.Page
    {
        Boolean isUpdate = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userRole"].ToString() != "1")
            {
                LoadSchools(Convert.ToInt64(Request.QueryString["schoolid"]));
                isUpdate = true;
            }
        }

        private Boolean CreateSchool(School school)
        {
            try
            {
                using (var context = new UzoneEntities())
                {
                    context.Schools.Add(school);
                    context.SaveChanges();
                }
                return true;
            }
            catch (Exception ex)
            { return false; }
        }

        private Boolean UpdateSchool(School school)
        {
            try
            {
                using (var context = new UzoneEntities())
                {
                    context.Schools.Attach(school);
                    context.Entry(school).State = EntityState.Modified;
                    context.SaveChanges();
                }
                return true;
            }
            catch (Exception ex)
            { return false; }
        }

        private void CreateErrorMsg(string message)
        {
            CustomValidator err = new CustomValidator();
            err.IsValid = false;
            err.ErrorMessage = message;
            Page.Validators.Add(err);
            return;
        }

        private void LoadSchools(long id)
        {
            using (var context = new UzoneEntities())
            {
                School _schools;
                _schools = (from sc in context.Schools
                            where sc.SchoolID == id
                            select sc).FirstOrDefault();

                if (_schools != null)
                {
                    txtFullName.Text = _schools.Name;
                    txtAlias.Text = _schools.Alias;
                    txtMascot.Text = _schools.Mascot;
                    txtAddress.Text = _schools.Address;
                    txtCity.Text = _schools.City;
                    txtZip.Text = _schools.Zip;
                    txtContactEmail.Text = _schools.Email;
                    txtContactPhone.Text = _schools.Phone;
                    comboState.SelectedValue = _schools.State;
                    rdColorBackground.SelectedColor = ColorTranslator.FromHtml(_schools.BannerColor);
                    rdColorPrimary.SelectedColor = ColorTranslator.FromHtml(_schools.ButtonColor);
                }
            }
        }

        protected void LocationGrid_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            LoadLocations();
        }

        private void LoadLocations()
        {
            using (var context = new UzoneEntities())
            {
                if (Session["currentSchoolID"] != null)
                {
                    var currentSchool = (long)Session["currentSchoolID"];
                    List<EventLocation> _locations;
                    _locations = context.Set<EventLocation>().Where(l => l.SchoolID == currentSchool && l.Active == true).ToList();
                    LocationGrid.DataSource = _locations;
                }
                else
                {
                    List<EventLocation> _locations = new List<EventLocation>();
                    LocationGrid.DataSource = _locations;
                }
            }
        }

        protected void LocationGrid_InsertCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            var editableItem = ((GridEditableItem)e.Item);
            Hashtable values = new Hashtable();
            editableItem.ExtractValues(values);

            EventLocation _location = new EventLocation();
            _location.EventLocationName = values["EventLocationName"].ToString();
            _location.Active = true;

            using (var context = new UzoneEntities())
            {
                if (Session["currentSchoolID"] != null)
                {
                    var currentSchool = (long)Session["currentSchoolID"];
                    _location.SchoolID = currentSchool;
                    context.EventLocations.Add(_location);
                    context.SaveChanges();
                }
            }
        }

        protected void LocationGrid_DeleteCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            var locationID = (int)((GridDataItem)e.Item).GetDataKeyValue("EventLocationID");

            using (var context = new UzoneEntities())
            {
                EventLocation _location;
                _location = context.EventLocations.Find(locationID);
                if (_location != null)
                {
                    _location.Active = false;
                    context.EventLocations.Attach(_location);
                    context.Entry(_location).State = EntityState.Modified;
                    context.SaveChanges();
                }

            }
        }

        protected void LocationGrid_UpdateCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            var editableItem = ((GridEditableItem)e.Item);
            var locationID = (int)editableItem.GetDataKeyValue("EventLocationID");

            using (var context = new UzoneEntities())
            {
                EventLocation _location;
                _location = context.EventLocations.Find(locationID);
                if (_location != null && Session["currentSchoolID"] != null)
                {
                    editableItem.UpdateValues(_location);
                    context.EventLocations.Attach(_location);
                    context.Entry(_location).State = EntityState.Modified;
                    context.SaveChanges();
                }
            }
        }

        protected void schoolWizard_FinishButtonClick(object sender, WizardEventArgs e)
        {
            School _school = new School();
            _school.Name = txtFullName.Text;
            _school.Alias = txtAlias.Text;
            _school.Mascot = txtMascot.Text;
            _school.Address = txtAddress.Text;
            _school.City = txtCity.Text;
            _school.Zip = txtZip.Text;
            _school.State = comboState.SelectedValue;
            _school.Email = txtContactEmail.Text;
            _school.Phone = txtContactPhone.Text;
            _school.ButtonColor = ColorTranslator.ToHtml(rdColorPrimary.SelectedColor) == string.Empty ? "NULL" : ColorTranslator.ToHtml(rdColorPrimary.SelectedColor);
            _school.BannerColor = ColorTranslator.ToHtml(rdColorBackground.SelectedColor) == string.Empty ? "NULL" : ColorTranslator.ToHtml(rdColorBackground.SelectedColor);

            if (isUpdate)
            {
                _school.SchoolID = Convert.ToInt64(Request.QueryString["schoolid"]);
                if (UpdateSchool(_school))
                    Response.Redirect("Modules");
                else
                    CreateErrorMsg("There was an issue saving your data.  Please try again.");
            }
            else
            {
                if (CreateSchool(_school))
                    Response.Redirect("Modules");
                else
                    CreateErrorMsg("There was an issue saving your data.  Please try again.");
            }
        }

    }
}