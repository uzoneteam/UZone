<%@ Page Title="Scheduler" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Scheduler.aspx.cs" Inherits="UZone.Admin.Calendar" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-main">
        <h2><%: Title %></h2>
        <h5 runat="server" id="headerDetail"></h5>
        <br />
        <div class="demo-container no-bg">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <telerik:RadScheduler runat="server" ID="RadScheduler1" Height="450" OverflowBehavior="Auto"
                        SelectedView="WeekView" ShowFooter="false" SelectedDate="2015-01-01"
                        DayStartTime="08:00:00" DayEndTime="22:00:00" FirstDayOfWeek="Monday" LastDayOfWeek="Friday"
                        EnableDescriptionField="true" AppointmentStyleMode="Default" Skin="Black" DataDescriptionField="EventDescription"
                        DataKeyField="SchedulerID" DataSubjectField="EventSubject"  DataStartField="EventStart" DataEndField="EventEnd" OnAppointmentInsert="RadScheduler1_AppointmentInsert" OnAppointmentUpdate="RadScheduler1_AppointmentUpdate" OnAppointmentDelete="RadScheduler1_AppointmentDelete">
                        <AdvancedForm Modal="true"></AdvancedForm>
                        <TimelineView UserSelectable="false"></TimelineView>
                        <AgendaView UserSelectable="false" />
                        <TimeSlotContextMenuSettings EnableDefault="true" />
                        <AppointmentContextMenuSettings EnableDefault="true" />
                        <Localization HeaderWeek="Work Week" />                        
                        <AppointmentTemplate>
                                <h5>
                                    <%# Eval("Subject") %>
                                </h5>
                                <div>
                                    <%# Eval("Description") %>
                                </div>
                        </AppointmentTemplate>
                    </telerik:RadScheduler>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
