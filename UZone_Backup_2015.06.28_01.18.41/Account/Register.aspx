<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="UZone.Account.Register" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="content-main">
        <h2><%: Title %></h2>
        <h4>Create a new account</h4>
        <br />
        <div class="row-fluid">
            <div class="form-group col-sm-6 col-md-6 col-lg-6">
                <div class="form-group span3">
                    <label class="control-label">Email</label>
                    <input class="form-control" id="txtEmail" required="required" placeholder="Enter your Email Address" type="email" />
                </div>
                <div class="form-group span3">
                    <label class="control-label">Username</label>
                    <input class="form-control" id="txtUsername" required="required" placeholder="Enter your User Name" type="text" />
                </div>
                <div class="form-group span3">
                    <label class="control-label">Password</label>
                    <input class="form-control" id="txtPassword" required="required" placeholder="Enter your Password" type="password" />
                </div>
                <div class="form-group span3">
                    <label class="control-label">Confirm Password</label>
                    <input class="form-control" id="txtConfirmPass" required="required" placeholder="Confirm your Password" type="password" />
                </div>
                <div class="form-group span3">
                    <telerik:RadButton ID="AccountCreation" runat="server" Skin="Black" Text="Create My Account"></telerik:RadButton>
                </div>
            </div>
            <div class="form-group col-sm-6 col-md-6 col-lg-6">
                <div class="form-group span3">
                    <textarea class="form-control" rows="10" id="termsConditions" readonly="true">Terms of Use</textarea>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" id="chkTerms" required="required" value="">By clicking the checkbox, you agree to U Zone's Terms of Use</label>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
