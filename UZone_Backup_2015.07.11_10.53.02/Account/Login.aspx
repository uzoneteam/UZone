<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="UZone.Account.Login" Async="true" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="content-main">    
        <asp:ValidationSummary runat="server" ID="loginSummary" CssClass="errorbox" HeaderText="Please correct the following errors:" />  
        <div class="row">
            <div class="form-group col-sm-3 col-md-3 col-lg-3">
                <img src="../Images/Man-with-Key-and-Lock.png" class="img-responsive" alt="Login Pic" width="304" height="236">
            </div>
            <div class="form-group col-sm-9 col-md-9 col-lg-9">
                <div class="row">
                    <div class="form-group col-sm-3 col-md-3 col-lg-3">
                        <h2><%: Title %></h2>
                        <label class="control-label">Username</label>
                        <input class="form-control" id="txtUser" runat="server" required="required" placeholder="Enter your User Name" type="text" />
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-sm-3 col-md-3 col-lg-3">
                        <label class="control-label">Password</label>
                        <input class="form-control" id="txtPassword" runat="server" required="required" placeholder="Enter your Password" type="password" />
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-sm-3 col-md-3 col-lg-3">
                        <div class="checkbox">
                            <asp:CheckBox runat="server" ID="RememberMe" />
                            <asp:Label runat="server" AssociatedControlID="RememberMe">Remember me?</asp:Label>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-sm-3 col-md-3 col-lg-3">
                        <telerik:RadButton ID="btnLogin" runat="server" Skin="Black" Text="Login" SingleClickText="Logging In..." Width="180px" OnClick="btnLogin_Click"></telerik:RadButton>
                    </div>
                </div>
                <p>
                    <asp:HyperLink runat="server" ID="registerLink" NavigateUrl="~/Account/Register.aspx">Need an account?  Signup</asp:HyperLink>
                </p>
            </div>
        </div>
    </div>
</asp:Content>
