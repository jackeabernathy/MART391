<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegistrationPage.aspx.cs" Inherits="RegistrationPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>New User Registration</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            New User Registration<br />
            Enter the following information: 
            <br />
            <br />
            <asp:TextBox ID="txtFirstName" runat="server" placeholder="First Name"></asp:TextBox>
            <br />
            <asp:TextBox ID="txtLastName" runat="server" placeholder="Last Name"></asp:TextBox>
            <br />
            <asp:TextBox ID="txtProfileName" runat="server" placeholder="Profile Name"></asp:TextBox>
            <br />
            <asp:TextBox ID="txtEmail" runat="server" placeholder="Email Address"></asp:TextBox>
            <br />
            <asp:TextBox ID="txtUserName" runat="server" placeholder ="Username"></asp:TextBox>
            <br />
            <asp:TextBox ID="txtPWD" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnRegisterNewUser" runat="server" Text="Register" OnClick="btnRegisterNewUser_Click" />
            <br />
            <br />
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
