<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UZone.Default" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>U Zone</title>
    <webopt:BundleReference runat="server" Path="~/Content/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link href="CSS/Backend.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
  <asp:ScriptManager runat="server">
            <Scripts>
                <%--To learn more about bundling scripts in ScriptManager see http://go.microsoft.com/fwlink/?LinkID=301884 --%>
                <%--Framework Scripts--%>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="bootstrap" />
                <asp:ScriptReference Name="respond" />
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <asp:ScriptReference Name="WebFormsBundle" />
                <%--Site Scripts--%>
            </Scripts>
        </asp:ScriptManager>
        <div class="navbar navbar-inverse navbar-fixed-top header">
            <div class="container">
                <div class="navbar-header">
                    
                    <a class="logo" runat="server" href="~/">
                        <asp:Image CssClass="image-logo" runat="server" ImageUrl="~/Images/UZONE_Logo_Transparent_Small.png" />
                    </a>
                </div>
                <div class="navbar-collapse collapse">                    
                </div>
            </div>
        </div>
        <div>
            <telerik:RadAjaxPanel runat="server" ID="RadAjaxPanel1" >
        <telerik:RadImageGallery runat="server" ID="RadImageGallery1" Width="100%"   DisplayAreaMode="Image">
            <Items>
                <telerik:ImageGalleryItem Description="International University is dedicated to provide its students with an education that combines rigorous academic
                    study and the excitement of discovery with the support and intellectual stimulation of a diverse campus community."
                    ImageUrl="Images/prospective-student-campus-tour-phone_stretch.jpg" Title="International University" Width="100%"  NavigateUrl="/Home"/>
                <telerik:ImageGalleryItem Description="The library welcomes students from all subject areas. It’s facilities offer wonderful gathering places to pursue scholarly
                    research, to learn about and use information technology, to write or to study."
                    ImageUrl="Images/male-student-using-phone-009_stretch.jpg" Title="University Library" NavigateUrl="/Home" />        
            </Items>
            <ThumbnailsAreaSettings Mode="ImageSliderPreview" />
            <ToolbarSettings ShowSlideshowButton="false" />
            <ClientSettings>
                <AnimationSettings SlideshowSlideDuration="3000">
                    <NextImagesAnimation Type="Blocks" Easing="EaseOutSine" Speed="2500" />
                    <PrevImagesAnimation Type="HorizontalStripes" Easing="EaseOutSine" Speed="2500" />
                </AnimationSettings>
            </ClientSettings>
        </telerik:RadImageGallery>
    </telerik:RadAjaxPanel>
        <img src="Images/prospective-student-campus-tour-phone_stretch.jpg" width="100%" class="img-responsive" alt="Responsive image"/>    
            </div>
        <div>
        <img src="Images/male-student-using-phone-009_stretch.jpg" width="100%" class="img-responsive" alt="Responsive image"/>    
            </div>
    </form>
    <script>
        $(document).ready(function () {
            var desiredHeight = $(window).height() - $(".header").height() - $(".footer").height();
            $(".main").css("min-height", desiredHeight);
        });
    </script>
</body>
</html>
