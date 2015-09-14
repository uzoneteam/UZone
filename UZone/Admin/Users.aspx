<%@ Page Title="Manage Users" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="UZone.Admin.UsersRoles" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-main">
        <h2><%: Title %></h2>
        <br />
        <telerik:RadGrid runat="server" ID="UsersGrid" AllowPaging="True" AllowSorting="true" Skin="Black"
            OnNeedDataSource="UsersGrid_NeedDataSource">
             <MasterTableView  AutoGenerateColumns="False" DataKeyNames="UserID" CommandItemDisplay="Top">
                <Columns>
                    <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditCommandColumn">
                    </telerik:GridEditCommandColumn>
                    <telerik:GridBoundColumn DataField="UserID" UniqueName="UserID" Visible="false" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UserName" HeaderText="User Name" SortExpression="UserName"
                        UniqueName="UserName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Email" HeaderText="Email" SortExpression="Email"
                        UniqueName="Email">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="IsActive" HeaderText="Active" SortExpression="IsActive"
                        UniqueName="IsActive">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="IsLocked" HeaderText="Locked" SortExpression="IsLocked"
                        UniqueName="IsLocked">
                    </telerik:GridBoundColumn>
                    <telerik:GridButtonColumn Text="Delete" CommandName="Delete" ButtonType="ImageButton" />
                </Columns>
                <EditFormSettings>
                    <EditColumn ButtonType="ImageButton" />
                </EditFormSettings>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
</asp:Content>
