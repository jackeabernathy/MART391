using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LoginPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //Verify login
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string email = loginUserName.Text;
        string password = loginPassword.Text;
        User myUser = new User();

        int login = myUser.LoginVarification(email, password);
        if (login == -1)
        {
            lblMessage.Text = "Login Failed. Incompatible Username/Password.";
        }
        else
        {
            lblMessage.Text = "Login Successful";
            Server.Transfer("Profile Page.aspx");
        }

    }

    //Redirect to new-user registration page to add a new user to table
    protected void newUser_Click(object sender, EventArgs e)
    {
        Server.Transfer("RegistrationPage.aspx");
    }
}