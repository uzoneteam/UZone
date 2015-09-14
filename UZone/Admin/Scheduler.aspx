<%@ Page Title="Scheduler" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Scheduler.aspx.cs" Inherits="UZone.Admin.Calendar" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server" ID="pnLogin">
        <ContentTemplate>
            <asp:UpdateProgress ID="updateProgress" runat="server">
                <ProgressTemplate>
                    <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
                        <span style="border-width: 0px; position: fixed; padding: 50px; background-color: black; color: white; font-size: 36px; left: 40%; top: 40%;"><i class="fa fa-spinner fa-pulse"></i>&nbsp;Loading<br />
                            <img src="../Images/UZONE_Logo_Transparent_Small.png" />
                        </span>
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>
            <div class="content-main">
                <h2><%: Title %></h2>
                <h5 runat="server" id="headerDetail"></h5>
                <br />
                <div class="demo-container no-bg">              
                    <telerik:RadScheduler runat="server" ID="RadScheduler1" Height="450" OverflowBehavior="Auto"
                        SelectedView="WeekView" ShowFooter="true" SelectedDate="2015-01-01"
                        DayStartTime="08:00:00" DayEndTime="22:00:00" FirstDayOfWeek="Sunday" LastDayOfWeek="Saturday"
                        EnableDescriptionField="true" AppointmentStyleMode="Default" Skin="Black" DataDescriptionField="EventDescription"
                        DataKeyField="SchedulerID" DataSubjectField="EventSubject" DataStartField="EventStart" DataEndField="EventEnd"
                        OnAppointmentInsert="RadScheduler1_AppointmentInsert" OnAppointmentUpdate="RadScheduler1_AppointmentUpdate"
                        OnAppointmentDelete="RadScheduler1_AppointmentDelete">
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
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
