<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Profile Page.aspx.cs" Inherits="Profile_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profile Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Welcome! Below is a list of the characters on the server.<br />
            <br />
            Sort the list by:<br />
            <asp:Button ID="btnViewAllCharacters" runat="server" Text="Character Name" OnClick="btnViewAllCharacters_Click" Width="115px" />
            <asp:Button ID="btnViewAllCharactersByClass" runat="server" Text="Class" OnClick="btnViewAllCharactersByClass_Click" Width="79px" />
            <asp:Button ID="btnViewAllcharactersByRace" runat="server" Text="Race" OnClick="btnViewAllcharactersByRace_Click" />
            <br />
            <asp:Label ID="lblAllCharacters" runat="server"></asp:Label>
            <br />
            <br />
            <br />
            <asp:Label ID="lblCharacterStats" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Button ID="btnReturnToLogin" runat="server" Text="Return to Login" OnClick="btnReturnToLogin_Click" />
            <br />
        </div>
    </form>
</body>
</html>
