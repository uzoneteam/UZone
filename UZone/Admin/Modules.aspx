<%@ Page Title="Modules" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Modules.aspx.cs" Inherits="UZone.Admin.Modules" %>

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
                <div class="row">
                    <div class="form-group col-sm-4 col-md-4 col-lg-4">
                        <div class="plan">
                            <a href="/Account/Register.aspx">
                                <div class="module_picker shadowbox">
                                    <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                                    <br />
                                    <br />
                                    <span class="module_picker_header">Manage Profile</span>
                                    <span class="module_picker_details">Use this module to make changes to your profile.
                                    </span>
                                    <div class="module_picker_footer"></div>
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
                                    <div class="module_picker_footer"></div>
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
                                    <span id="mdSchool" runat="server" class="module_picker_header">Edit School</span>
                                    <span class="module_picker_details">Use this module to edit school branding setting.
                                    </span>
                                    <div class="module_picker_footer"></div>
                                </div>
                            </a>
                            <br />
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
