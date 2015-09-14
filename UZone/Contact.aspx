<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="UZone.Contact" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server" ID="pnContact">
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
                <br />
                <asp:ValidationSummary runat="server" ID="contactSummary" CssClass="errorbox" />
                <div class="row">
                    <div class="form-group col-sm-3 col-md-3 col-lg-3">
                        <label class="control-label">Name</label>
                        <input class="form-control" id="txtName" runat="server" required="required" placeholder="Enter your Full Name" type="text" />
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
                        <input class="form-control" id="txtEmail" runat="server" required="required" placeholder="Enter valid Email Address" type="email" />
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
                        <textarea class="form-control" rows="5" id="txtMess" runat="server" required="required" placeholder="Enter your Message"></textarea>
                    </div>
                    <div class="form-group col-sm-3 col-md-3 col-lg-3"></div>
                    <div class="form-group col-sm-3 col-md-3 col-lg-3">
                        <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                        <label class="control-label">Company Email</label>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-sm-3 col-md-3 col-lg-3">
                        <telerik:RadButton ID="SendEmail" runat="server" Skin="Black" Width="200px" Text="Send Message" OnClick="SendEmail_Click" SingleClickText="Sending..."></telerik:RadButton>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
