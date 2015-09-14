<%@ Page Title="Modules" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Modules.aspx.cs" Inherits="UZone.Admin.Modules" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-main">
        <div class="row">
            <div class="form-group col-sm-3 col-md-3 col-lg-3">
                <div class="plan">
                    <a href="UsersRoles.aspx">
                        <div class="module_picker shadowbox">
                            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                            <br />
                            <br />
                            <span class="module_picker_header">Users and Roles</span>
                            <span class="module_picker_details">Click to blah....</span>
                            <div class="module_picker_footer" ></div>
                        </div>
                    </a>
                    <br />
                </div>
            </div>
            <div class="form-group col-sm-3 col-md-3 col-lg-3">
                <div class="plan">
                    <a href="Calendar.aspx">
                        <div class="module_picker shadowbox">
                            <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
                            <br />
                            <br />
                            <span class="module_picker_header">Calendar</span>
                            <span class="module_picker_details">Click to blah....</span>
                            <div class="module_picker_footer" ></div>
                        </div>
                    </a>
                    <br />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
