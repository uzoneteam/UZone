<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="UZone.Account.Register" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="content-main">
        <h2><%: Title %></h2>
        <h4>Create a new account</h4>
        <br />
        <asp:ValidationSummary runat="server" ID="registrationSummary" CssClass="errorbox" HeaderText="Please correct the following errors:" />
        <telerik:RadWizard ID="accountWizard" runat="server" Height="420px" Skin="Black" OnFinishButtonClick="acountWizard_FinishButtonClick"
            OnClientLoad="OnClientLoad" OnClientButtonClicking="OnClientButtonClicking">
            <WizardSteps>
                <telerik:RadWizardStep ID="stepName" Title="User Information" runat="server" StepType="Start" ValidationGroup="userInformation" CausesValidation="true" SpriteCssClass="userInformation">
                    <table cellpadding="5" style="width: 100%">
                        <tr>
                            <td>
                                <label class="control-label">Name</label>
                                <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="validation" ID="RequiredFieldValidator6" ControlToValidate="txtName"
                                    ErrorMessage="! Please enter your name" SetFocusOnError="true" ValidationGroup="userInformation" />
                            </td>
                            <td>
                                <label class="control-label">User Name</label>
                                <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="validation" ID="RequiredFieldValidator1" ControlToValidate="txtUsername"
                                    ErrorMessage="! Please enter user name" SetFocusOnError="true" ValidationGroup="userInformation" />
                            </td>
                            <td>
                                <label class="control-label">Password</label>
                                <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="validation" ID="RequiredFieldValidator2" ControlToValidate="txtPassword"
                                    ErrorMessage="! Please enter password" SetFocusOnError="true" ValidationGroup="userInformation" />
                            </td>
                            
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadTextBox runat="server" ID="txtName" Width="300" EmptyMessage="Enter your Name"></telerik:RadTextBox>
                            </td>
                            <td>
                                <telerik:RadTextBox runat="server" ID="txtUsername" Width="300" EmptyMessage="Enter your Username"></telerik:RadTextBox></td>
                            <td>
                                <telerik:RadTextBox runat="server" ID="txtPassword" TextMode="Password" Width="300" PasswordStrengthSettings-ShowIndicator="true" EmptyMessage="Enter you Password"></telerik:RadTextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">Confirm Password</label>
                                <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="validation" ID="RequiredFieldValidator3" ControlToValidate="txtConfirmPass"
                                    ErrorMessage="! Please enter confirm password" SetFocusOnError="true" ValidationGroup="userInformation" />
                                <asp:CompareValidator ID="comparePassword" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPass"
                                    Operator="Equal" Type="String" CssClass="validation" ErrorMessage="! Passwords must match" ValidationGroup="userInformation" SetFocusOnError="true" />
                            </td>
                            <td>
                                <label class="control-label">Email</label>
                                <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="validation" ID="RequiredFieldValidator4" ControlToValidate="txtEmail"
                                    ErrorMessage="! Please enter email address" SetFocusOnError="true" ValidationGroup="userInformation" />
                            </td>
                            <td>
                                <label class="control-label">Associated School</label>
                                <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="validation" ID="RequiredFieldValidator5" ControlToValidate="comboSchool"
                                    ErrorMessage="! Select associated school" SetFocusOnError="true" ValidationGroup="userInformation" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadTextBox runat="server" ID="txtConfirmPass" TextMode="Password" Width="300" EmptyMessage="Re-enter your Password"></telerik:RadTextBox></td>
                            <td>
                                <telerik:RadTextBox runat="server" ID="txtEmail" InputType="Email" Width="300" EmptyMessage="Enter your Email Address"></telerik:RadTextBox></td>
                            <td>
                                <telerik:RadComboBox ID="comboSchool" runat="server" Width="260" EmptyMessage="Select a School" DataTextField="Name" DataValueField="SchoolID">
                                </telerik:RadComboBox>
                            </td>
                        </tr>
                    </table>
                </telerik:RadWizardStep>

                <telerik:RadWizardStep Title="Security Information" runat="server" StepType="Step" ValidationGroup="securityInformation" SpriteCssClass="securityInformation">
                    <table cellpadding="5" style="width: 50%">
                        <tr>
                            <td>
                                <label class="control-label">Security Question</label>
                                <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="validation" ID="RequiredFieldValidator8" ControlToValidate="comboSecurityQues"
                                    ErrorMessage="! Select Security Question" SetFocusOnError="true" ValidationGroup="securityInformation" />
                            </td>
                            <td>
                                <label class="control-label">Security Answer</label>
                                <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="validation" ID="RequiredFieldValidator9" ControlToValidate="txtSecurityAns"
                                    ErrorMessage="! Please enter security answer" SetFocusOnError="true" ValidationGroup="securityInformation" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadComboBox ID="comboSecurityQues" runat="server" EmptyMessage="Select a Security Question" Width="260" DataTextField="Question" DataValueField="LockedQuestionID">
                                </telerik:RadComboBox>
                            </td>
                            <td>
                                <telerik:RadTextBox runat="server" ID="txtSecurityAns" Width="300" EmptyMessage="Enter your security answer"></telerik:RadTextBox></td>
                        </tr>
                    </table>
                </telerik:RadWizardStep>

                <telerik:RadWizardStep Title="Terms of Use" runat="server" StepType="Finish" ValidationGroup="termsOfUse" SpriteCssClass="termsOfUse">
                    <table cellpadding="5" style="width: 100%">
                        <tr>
                            <td>
                                <textarea class="form-control" rows="10" id="termsConditions" readonly="true">Terms of Use</textarea>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" id="chkTerms" runat="server" required="required" value="">By clicking the checkbox, you agree to U Zone's Terms of Use</label>
                                </div>
                            </td>
                        </tr>
                    </table>
                </telerik:RadWizardStep>

                <telerik:RadWizardStep runat="server" StepType="Complete" CssClass="complete">
                    <p>Congratulations, you have registered successfully!</p>
                    <p>Click here to <a href="Login.aspx">Login</a></p>
                </telerik:RadWizardStep>

            </WizardSteps>
        </telerik:RadWizard>
    </div>
</asp:Content>
