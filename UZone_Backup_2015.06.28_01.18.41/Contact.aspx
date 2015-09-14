<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="UZone.Contact" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-main">
        <h2><%: Title %></h2>
        <br />
        <div class="row">
            <div class="form-group col-sm-3 col-md-3 col-lg-3">
                <label class="control-label">Name</label>
                <input class="form-control" id="txtName" required="required" placeholder="Enter your Full Name" type="text" />
            </div>
            <div class="form-group col-sm-3 col-md-3 col-lg-3"></div>
            <div class="form-group col-sm-3 col-md-3 col-lg-3">
                <span class="glyphicon glyphicon-home" aria-hidden="true"></span>
                <label class="control-label">Company Address</label>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-sm-3 col-md-3 col-lg-3">
                <label class="control-label">Email</label>
                <input class="form-control" id="txtEmail" required="required" placeholder="Enter valid Email Address" type="email" />
            </div>
            <div class="form-group col-sm-3 col-md-3 col-lg-3"></div>
            <div class="form-group col-sm-3 col-md-3 col-lg-3">
                <span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>
                <label class="control-label">Company Phone Number</label>
            </div>            
        </div>
        <div class="row">
            <div class="form-group col-sm-3 col-md-3 col-lg-3">
                <label class="control-label">Message</label>
                <textarea class="form-control" rows="5" id="txtMess" required="required" placeholder="Enter your Message"></textarea>
            </div>
            <div class="form-group col-sm-3 col-md-3 col-lg-3"></div>
            <div class="form-group col-sm-3 col-md-3 col-lg-3">
                <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                <label class="control-label">Company Email</label>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-sm-3 col-md-3 col-lg-3">
                <telerik:RadButton ID="SendEmail" runat="server" Skin="Black"  Text="Send Message" OnClick="SendEmail_Click" SingleClickText="Sending..." ></telerik:RadButton>
            </div>
        </div>
    </div>
</asp:Content>
