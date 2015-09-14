<%@ Page Title="Calendar" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="UZone.Admin.Calendar" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-main">
        <telerik:RadScheduler ID="rdScheduler" runat="server" Skin="Black"></telerik:RadScheduler>
    </div>
</asp:Content>
