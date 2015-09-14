<%@ Page Title="Forgot Information" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Forgot.aspx.cs" Inherits="UZone.Account.ForgotPassword" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel runat="server" ID="pnforgotInfo">
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
                <p id="headerText" runat="server"></p>
                <asp:ValidationSummary runat="server" ID="forgotSummary" CssClass="errorbox" />
                <div class="row">
                    <div class="form-group col-sm-4 col-md-4 col-lg-4">
                        <label class="control-label">Email</label>
                        <input class="form-control" id="txtEmailAddress" runat="server" required="required" placeholder="Enter your Email Address" type="email" />
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-sm-3 col-md-3 col-lg-3">
                        <telerik:RadButton ID="checkEmail" runat="server" Skin="Black" Width="200px" Text="Email Vaildation" OnClick="checkEmail_Click" SingleClickText="Checking..." Visible="true"></telerik:RadButton>
                    </div>
                </div>
                <div class="row" id="rwSecurity" runat="server" style="visibility: hidden">
                    <div class="form-group col-sm-4 col-md-4 col-lg-4">
                        <label class="control-label">Security Question</label>
                        <label class="control-label" id="lbSecurityQuestion" runat="server" />
                    </div>
                    <div class="form-group col-sm-4 col-md-4 col-lg-4">
                        <label class="control-label">Security Answer</label>
                        <input class="form-control" id="txtSecurityAnswer" runat="server" type="text" />
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-sm-3 col-md-3 col-lg-3">
                        <telerik:RadButton ID="SendEmail" runat="server" Skin="Black" Width="200px" Text="Send Credentials" OnClick="SendEmail_Click" SingleClickText="Sending..." Visible="false"></telerik:RadButton>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
