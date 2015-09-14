<%@ Page Title="School Selection" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SchoolSelection.aspx.cs" Inherits="UZone.Admin.SchoolSelection" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-main">
        <div class="row">
            <div class="form-group col-sm-3 col-md-3 col-lg-3">
                <h3>Select School for Setup</h3>
                <div class="dropdown">
                    <button class="btn btn-default dropdown-toggle" type="button" id="drpSchoolSelect" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                        -- Select One --
    <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                        <li><a href="Register">New Setup</a></li>
                        <li><a href="#">NC A& T</a></li>
                        <li><a href="#">Winston Salem State University</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-sm-3 col-md-3 col-lg-3">
                <telerik:RadButton ID="SchoolSelect" runat="server" Skin="Black"  Text="Submit" ></telerik:RadButton>
            </div>
        </div>
        </div>
</asp:Content>
