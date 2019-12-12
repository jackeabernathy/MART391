using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RegistrationPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //Inserts a new user into the Users table
    protected void btnRegisterNewUser_Click(object sender, EventArgs e)
    {
        string firstName = txtFirstName.Text;
        string lastName = txtLastName.Text;
        string profileName = txtProfileName.Text;
        string userName = txtUserName.Text;
        string email = txtEmail.Text;
        string password = txtPWD.Text;

        User myUser = new User();
        int rows = myUser.insertUser(firstName, lastName, profileName, email, userName, password);

        Server.Transfer("LoginPage.aspx");
    }
}