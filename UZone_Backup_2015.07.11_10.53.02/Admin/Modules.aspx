<%@ Page Title="Modules" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Modules.aspx.cs" Inherits="UZone.Admin.Modules" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-main">
        <div class="row">
            <div class="form-group col-sm-4 col-md-4 col-lg-4">
                <div class="plan">
                    <a href="Users.aspx">
                        <div class="module_picker shadowbox">
                            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                            <br />
                            <br />
                            <span class="module_picker_header">Manage Users</span>
                            <span class="module_picker_details">Use this module to see the users associated with your associated school.  Here you can disable, lock, unlock or edit 
                                email information of a specific user.  You also can select to create a 
                                new user.
                            </span>
                            <div class="module_picker_footer" ></div>
                        </div>
                    </a>
                    <br />
                </div>
            </div>
            <div class="form-group col-sm-4 col-md-4 col-lg-4">
                <div class="plan">
                    <a href="Scheduler.aspx">
                        <div class="module_picker shadowbox">
                            <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
                            <br />
                            <br />
                            <span class="module_picker_header">Scheduler</span>
                            <span class="module_picker_details">Use this module to create, edit and delete events that will be occuring that are sponsored by the school.</span>
                            <div class="module_picker_footer" ></div>
                        </div>
                    </a>
                    <br />
                </div>
            </div>
            <div class="form-group col-sm-4 col-md-4 col-lg-4">
                <div class="plan">
                    <a runat="server" id="editSchool">
                        <div class="module_picker shadowbox">
                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                            <br />
                            <br />
                            <span class="module_picker_header">Edit School</span>
                            <span class="module_picker_details">Use this module to edit school branding setting.
                            </span>
                            <div class="module_picker_footer" ></div>
                        </div>
                    </a>
                    <br />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
