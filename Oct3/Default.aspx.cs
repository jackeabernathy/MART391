using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //Deletes a user from the Users tabled based on provided userID
    protected void btnDeleteUser_Click(object sender, EventArgs e)
    {
        int userID = Int32.Parse(txtUserID.Text);

        User myUser = new User();
        int rows = myUser.DeleteUser(userID);
        lblMessage.Text = "User Deleted";
    }

    //Displays a specific user based on provided userID
    protected void btnDisplaySpecificUser_Click(object sender, EventArgs e)
    {
        int userID = Int32.Parse(txtDisplayUserID.Text);
        User myUser = new User();

        String finalResult = myUser.GetUserData(userID);
        lblMessage.Text = finalResult;
    }

    //Update specific user information based on provided userID
    protected void btnUpdateUser_Click(object sender, EventArgs e)
    {
        int userID = Int32.Parse(txtUpdateUserID.Text);
        string firstName = txtUpdateFirstName.Text;
        string lastName = txtUpdateLastName.Text;

        User myUser = new User();
        int rows = myUser.updateUser(userID, firstName, lastName);

        lblMessage.Text = "User Profile Updated";
    }

    //Displays all users
    protected void btnDisplayAllUsers_Click(object sender, EventArgs e)
    {
        User myUser = new User();

        string users = myUser.getAllCharacters("name");

        lblMessage.Text = users;
    }

    protected void btnReturnToLogin_Click(object sender, EventArgs e)
    {
        Server.Transfer("LoginPage.aspx");
    }

    protected void btnRegisterNewUser_Click(object sender, EventArgs e)
    {
        Server.Transfer("RegistrationPage.aspx");
    }
}