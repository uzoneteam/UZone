<%@ Page Title="Register School" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="UZone.Admin.Register" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-main">
        <h2><%: Title %></h2>
        <div class="wizardHeader">
            <asp:ValidationSummary runat="server" ID="registrationSummary" CssClass="errorbox" HeaderText="Please correct the following errors:" />
        </div>
        <telerik:RadWizard ID="schoolWizard" runat="server" Height="420px" Skin="Black"
            OnClientLoad="OnClientLoad" OnClientButtonClicking="OnClientButtonClicking" OnFinishButtonClick="schoolWizard_FinishButtonClick">
            <WizardSteps>
                <telerik:RadWizardStep ID="stepName" Title="School Information" runat="server" StepType="Start" ValidationGroup="schoolInformation" CausesValidation="true" SpriteCssClass="schoolInformation">
                    <table cellpadding="5" style="width: 100%">
                        <tr>
                            <td>
                                <label class="control-label">Full Name</label>
                                <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="validation" ID="RequiredFieldValidator1" ControlToValidate="comboState"
                                    ErrorMessage="! Please select a State" SetFocusOnError="true" ValidationGroup="schoolInformation" />
                            </td>
                            <td>
                                <label class="control-label">Alias</label>
                                <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="validation" ID="RequiredFieldValidator2" ControlToValidate="txtAlias"
                                    ErrorMessage="! Please enter alias" SetFocusOnError="true" ValidationGroup="schoolInformation" />
                            </td>
                            <td>
                                <label class="control-label">Mascot Name</label>
                                <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="validation" ID="RequiredFieldValidator3" ControlToValidate="txtMascot"
                                    ErrorMessage="! Please enter mascot name" SetFocusOnError="true" ValidationGroup="schoolInformation" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadTextBox runat="server" ID="txtFullName" ToolTip="Enter the Full Name of the University" Width="300" EmptyMessage="Enter School Name"></telerik:RadTextBox></td>
                            <td>
                                <telerik:RadTextBox runat="server" ID="txtAlias" Width="300" EmptyMessage="Enter Alias"></telerik:RadTextBox></td>
                            <td>
                                <telerik:RadTextBox runat="server" ID="txtMascot" Width="300" EmptyMessage="Enter Mascot Name"></telerik:RadTextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">Address</label>
                                <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="validation" ID="RequiredFieldValidator4" ControlToValidate="txtAddress"
                                    ErrorMessage="! Please enter school address" SetFocusOnError="true" ValidationGroup="schoolInformation" />
                            </td>
                            <td>
                                <label class="control-label">City</label>
                                <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="validation" ID="RequiredFieldValidator5" ControlToValidate="txtCity"
                                    ErrorMessage="! Please enter school city" SetFocusOnError="true" ValidationGroup="schoolInformation" />
                            <td>
                                <label class="control-label">Zip Code</label>
                                <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="validation" ID="RequiredFieldValidator6" ControlToValidate="txtZip"
                                    ErrorMessage="! Please enter school zip code" SetFocusOnError="true" ValidationGroup="schoolInformation" /></td>
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadTextBox runat="server" ID="txtAddress" Width="300" EmptyMessage="Enter Address"></telerik:RadTextBox></td>
                            <td>
                                <telerik:RadTextBox runat="server" ID="txtCity" Width="300" EmptyMessage="Enter City"></telerik:RadTextBox></td>
                            <td>
                                <telerik:RadNumericTextBox runat="server" ID="txtZip" Width="300" EmptyMessage="Enter Zip Code" NumberFormat-DecimalDigits="0" NumberFormat-GroupSeparator="" Type="Number"></telerik:RadNumericTextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">State</label>
                                <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="validation" ID="comboStateValidator" ControlToValidate="comboState"
                                    ErrorMessage="! Please select a State" SetFocusOnError="true" ValidationGroup="schoolInformation" />
                            </td>
                            <td>
                                <label class="control-label">Contact Email</label>
                                <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="validation" ID="RequiredFieldValidator7" ControlToValidate="txtContactEmail"
                                    ErrorMessage="! Please enter contact email" SetFocusOnError="true" ValidationGroup="schoolInformation" />
                            <td>
                                <label class="control-label">Contact Phone</label>
                                <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="validation" ID="RequiredFieldValidator8" ControlToValidate="txtContactPhone"
                                    ErrorMessage="! Please enter contact phone" SetFocusOnError="true" ValidationGroup="schoolInformation" />
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadComboBox ID="comboState" runat="server" Width="280px" EmptyMessage="Select a State">
                                    <Items>
                                        <telerik:RadComboBoxItem Text="North Carolina" Value="NC" />
                                    </Items>
                                </telerik:RadComboBox>
                            </td>
                            <td>
                                <telerik:RadTextBox runat="server" ID="txtContactEmail" Width="300" EmptyMessage="Enter Email Address"></telerik:RadTextBox></td>
                            <td>
                                <telerik:RadNumericTextBox runat="server" ID="txtContactPhone" Width="300" EmptyMessage="Enter Phone Number" NumberFormat-DecimalDigits="0" NumberFormat-GroupSeparator="" Type="Number"></telerik:RadNumericTextBox></td>
                        </tr>
                    </table>
                </telerik:RadWizardStep>

                <telerik:RadWizardStep Title="Resource Locations" runat="server" StepType="Step" ValidationGroup="resourceLocation" SpriteCssClass="resourceLocation">
                    <asp:UpdatePanel runat="server" ID="updatePanel">
                        <ContentTemplate>
                            <div class="row">
                                <div class="form-group col-sm-12 col-md-12 col-lg-12">
                                    <label class="control-label">Setup Locations for Scheduler</label>
                                    <telerik:RadGrid runat="server" ID="LocationGrid" AllowPaging="True" AllowSorting="true" Skin="Black"
                                        OnNeedDataSource="LocationGrid_NeedDataSource" OnInsertCommand="LocationGrid_InsertCommand" OnDeleteCommand="LocationGrid_DeleteCommand" OnUpdateCommand="LocationGrid_UpdateCommand">
                                        <MasterTableView AutoGenerateColumns="False" DataKeyNames="EventLocationID" CommandItemDisplay="Top">
                                            <Columns>
                                                <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditCommandColumn">
                                                </telerik:GridEditCommandColumn>
                                                <telerik:GridBoundColumn DataField="EventLocationID" UniqueName="EventLocationID" Visible="false" ReadOnly="true">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="EventLocationName" HeaderText="Location Name" SortExpression="EventLocationName"
                                                    UniqueName="EventLocationName">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="Active" HeaderText="Is Enabled" UniqueName="Active" ReadOnly="true">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridButtonColumn Text="Delete" CommandName="Delete" ButtonType="ImageButton" />
                                            </Columns>
                                            <EditFormSettings>
                                                <EditColumn ButtonType="ImageButton" />
                                            </EditFormSettings>
                                        </MasterTableView>
                                    </telerik:RadGrid>
                                    <br />
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </telerik:RadWizardStep>

                <telerik:RadWizardStep Title="School Branding" runat="server" StepType="Finish" ValidationGroup="schoolBranding" SpriteCssClass="schoolBranding">
                    <table cellpadding="5" style="width: 100%">
                        <tr>
                            <td>
                                <label class="control-label">Primary Button Color</label>
                                <a class="icon-question-sign icon-gray" href="#" data-original-title="Terms" tabindex="-1" data-content="" rel="popover"></a>
                            </td>
                            <td>
                                <label class="control-label">Banner Background Color</label></td>
                            <td>
                                <label class="control-label">Upload School Logo</label></td>
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadColorPicker ID="rdColorPrimary" runat="server" Skin="Black" PaletteModes="WebPalette"></telerik:RadColorPicker>
                            </td>
                            <td>
                                <telerik:RadColorPicker ID="rdColorBackground" runat="server" Skin="Black" PaletteModes="WebPalette"></telerik:RadColorPicker>
                            </td>
                            <td>
                                <%--<telerik:RadCloudUpload ID="rdCloudUpload" runat="server" Skin="Black" ProviderType="Azure"></telerik:RadCloudUpload>--%></td>
                        </tr>
                    </table>
                </telerik:RadWizardStep>

                <telerik:RadWizardStep runat="server" StepType="Complete" CssClass="complete">
                    <p>Congratulations, you have registered successfully!</p>
                </telerik:RadWizardStep>

            </WizardSteps>
        </telerik:RadWizard>
    </div>
</asp:Content>
