<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            Delete a User:<br />
            <asp:TextBox ID="txtUserID" runat="server" placeholder="User ID"></asp:TextBox>
            <br />
            <asp:Button ID="btnDeleteUser" runat="server" OnClick="btnDeleteUser_Click" Text="Delete User" />
            <br />
            <br />
            <br />
            Find a Specific User:<br />
            <asp:TextBox ID="txtDisplayUserID" runat="server" placeholder="User ID"></asp:TextBox>
            <br />
            <asp:Button ID="btnDisplaySpecificUser" runat="server" Text="Display Specific User" OnClick="btnDisplaySpecificUser_Click" />
            <br />
            <br />
            Update a Specific User:<br />
            <asp:TextBox ID="txtUpdateUserID" runat="server" placeholder="User ID"></asp:TextBox>
            <br />
            <asp:TextBox ID="txtUpdateFirstName" runat="server" placeholder="First Name"></asp:TextBox>
            <br />
            <asp:TextBox ID="txtUpdateLastName" runat="server" placeholder="Last Name"></asp:TextBox>
            <br />
            <asp:Button ID="btnUpdateUser" runat="server" OnClick="btnUpdateUser_Click" Text="Update User" />

            <br />
            <br />
            View All Users<br />
            <asp:Button ID="btnDisplayAllUsers" runat="server" Height="26px" OnClick="btnDisplayAllUsers_Click" Text="Display Users" />

            <br />
            <br />
            <asp:Button ID="btnReturnToLogin" runat="server" Text="Return to Login" OnClick="btnReturnToLogin_Click" />
            <asp:Button ID="btnRegisterNewUser" runat="server" Text="Register a New User" OnClick="btnRegisterNewUser_Click" />
            <br />



         <%-- 
            Check Login<br />
            Username<asp:TextBox ID="loginUserName" runat="server"></asp:TextBox>
            <br />
            Password<asp:TextBox ID="loginPassword" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btnLogin" runat="server" Text="Login" />
            <br />

            <br />
            <br />

         --%>
            
            
            <asp:Label ID="lblMessage" runat="server"></asp:Label>



            <br />



        </div>
    </form>
</body>
</html>
