using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Profile_Page : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //Need to add the profile page. Return to Login For now.
    protected void btnReturnToLogin_Click(object sender, EventArgs e)
    {
        Server.Transfer("LoginPage.aspx");
    }

    protected void btnViewAllCharacters_Click(object sender, EventArgs e)
    {
        string[] characterRaces;
        characterRaces = new string[22]{"Human","Dwarf","Night Elf","Gnome","Draenei","Worgen","Alliance Pandaren",
                                        "Dark Iron Dwarf","Kul Tiran","Lightforged Draenei","Void Elf",
                                        "Orc","Undead","Tauren","Troll","Blood Elf","Goblin","Horde Pandaren",
                                        "Highmountain Tauren","Mag'har Orc","Nightborne","Zandalari Troll"};

        User myUser = new User();
        string users = myUser.getAllCharacters("name");

        /**************************************************************************************
         * This is just the portion that was meant to provide the string across the top/bottom
         * that provided a population comparison fo the races and classes. Iterate through the 
         * array of races and append the number provided by the stored procdure pertaining to
         * the particular race
         **************************************************************************************
        User myUser2 = new User();
        string characterStats ="";

        for (int i = 0; i < 21; i++)
        {
            characterStats += characterRaces[i] + ": " + myUser2.getNumberOfRace(characterRaces[i]) ;
        }
        lblCharacterStats.Text = characterStats;

        */

        lblAllCharacters.Text = users;
    }

    protected void btnViewAllCharactersByClass_Click(object sender, EventArgs e)
    {
        User myUser = new User();
        string users = myUser.getAllCharacters("class");
        lblAllCharacters.Text = users;
    }

    protected void btnViewAllcharactersByRace_Click(object sender, EventArgs e)
    {
        User myUser = new User();
        string users = myUser.getAllCharacters("race");
        lblAllCharacters.Text = users;
    }
}
 