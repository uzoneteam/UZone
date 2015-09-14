<%@ Page Title="Register School" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="UZone.Admin.Register" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-main">
        <h2><%: Title %></h2>
        <br />
        <div class="row">
            <div class="form-group col-sm-4 col-md-4 col-lg-4">
                <label class="control-label">Full Name</label>
                <input class="form-control" id="txtFullName" required="required" placeholder="Enter School Name" type="text" />
            </div>
            <div class="form-group col-sm-4 col-md-4 col-lg-4">
                <label class="control-label">Alias</label>
                <input class="form-control" id="txtAlias" placeholder="Enter Alias" type="text" />
            </div>
            <div class="form-group col-sm-4 col-md-4 col-lg-4">
                <label class="control-label">Mascot Name</label>
                <input class="form-control" id="txtMascot" required="required" placeholder="Enter Mascot Name" type="text" />
            </div>
            <div class="form-group col-sm-4 col-md-4 col-lg-4">
                <label class="control-label">Address</label>
                <input class="form-control" id="txtAddress" required="required" placeholder="Enter Address" type="text" />
            </div>
            <div class="form-group col-sm-4 col-md-4 col-lg-4">
                <label class="control-label">City</label>
                <input class="form-control" id="txtCity" required="required" placeholder="Enter City" type="text" />
            </div>
                        <div class="form-group col-sm-4 col-md-4 col-lg-4">
                <label class="control-label">Zip Code</label>
                <input class="form-control" id="txtZip" required="required" placeholder="Enter Zip Code" type="text" />
            </div>
            <div class="form-group col-sm-4 col-md-4 col-lg-4">
                <label class="control-label">State</label><br />
                <telerik:RadComboBox ID="rdComboState" runat="server" Width="280px" ></telerik:RadComboBox>            
            </div>
            <div class="form-group col-sm-4 col-md-4 col-lg-4">
                <label class="control-label">Contact Email</label>
                <input class="form-control" id="txtContactEmail" required="required" placeholder="Enter Email Address" type="email" />
            </div>
            <div class="form-group col-sm-3 col-md-3 col-lg-3">
                <label class="control-label">Contact Phone</label>
                <input class="form-control" id="txtContactPhone" required="required" type="number" />
            </div>
        </div>
        <div class="row">
            <div class="form-group col-sm-4 col-md-4 col-lg-4">
                <label class="control-label">Primary Button Color</label>
                <telerik:RadColorPicker ID="rdColorPrimary" runat="server" Skin="Black" PaletteModes="All"></telerik:RadColorPicker>
            </div>
            <div class="form-group col-sm-4 col-md-4 col-lg-4">
                <label class="control-label">Banner Background Color</label>
                <telerik:RadColorPicker ID="rdColorBackground" runat="server" Skin="Black" PaletteModes="All"></telerik:RadColorPicker>
            </div>
            <div class="form-group col-sm-4 col-md-4 col-lg-4">
                <label class="control-label">Upload School Logo</label>
                <%--<telerik:RadCloudUpload ID="rdCloudUpload" runat="server" Skin="Black" ProviderType="Azure"></telerik:RadCloudUpload>--%>
            </div>
        </div>
    </div>
</asp:Content>
