using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

public class User
{
    public User()
    {
        
    }

    public String GetUserData(int UserID)
    {
        DBManager myDBManager = new DBManager();

        string myQuery = "spGetSpecificUser";
        SqlParameter[] myParameters = new SqlParameter[1];
        myParameters[0] = new SqlParameter("userID", UserID);

        DataSet myDataSet = myDBManager.createDataSet(myQuery, myParameters);

        string finalResult = "";

        for (int i = 0; i < myDataSet.Tables[0].Rows.Count; i++)
        {
            finalResult += myDataSet.Tables[0].Rows[i]["firstName"] + " " + myDataSet.Tables[0].Rows[i]["lastName"] + "<br>";
        }

        return finalResult;

    }

    public int updateUser(int UserID, string firstName, string lastName)
    {
        DBManager myDBManager = new DBManager();
        string myQuery = "spUpdateUser";

        SqlParameter[] myParameters = new SqlParameter[3];
        myParameters[0] = new SqlParameter("firstName", firstName);
        myParameters[1] = new SqlParameter("lastName", lastName);
        myParameters[2] = new SqlParameter("userID", UserID);

        int rows = myDBManager.executeNonQuery(myQuery, myParameters);
        return rows;
    }

    public int insertUser(string firstName, string lastName, string profileName, string email, string userName, string pwd)
    {
        DBManager myDBManager = new DBManager();
        string myQuery = "spAddNewPlayer";

        SqlParameter[] myParameters = new SqlParameter[6];
        myParameters[0] = new SqlParameter("firstName", firstName);
        myParameters[1] = new SqlParameter("lastName", lastName);
        myParameters[2] = new SqlParameter("profileName", profileName);
        myParameters[3] = new SqlParameter("email", email);
        myParameters[4] = new SqlParameter("userName", userName);
        myParameters[5] = new SqlParameter("password", pwd);

        int rows = myDBManager.executeNonQuery(myQuery, myParameters);
        return rows;
    }

    public string getAllCharacters(string type)
    {
        DBManager myDBManager = new DBManager();
        string myQuery = "";
        if(type == "name")
        {
            myQuery = "spGetAllCharactersByName";
        }
        else if(type == "class")
        {
            myQuery = "spGetAllCharactersByClass";
        }
        else if(type == "race")
        {
            myQuery = "spGetAllCharactersByRace";
        }
        
        SqlParameter[] myParameters = new SqlParameter[0];
        

        DataSet myDataSet = myDBManager.createDataSet(myQuery, myParameters);
        SqlCommand sqlCommand = new SqlCommand(myQuery);

        string users = "";

         for(int i = 0; i < myDataSet.Tables[0].Rows.Count; i++)
         {
            users += myDataSet.Tables[0].Rows[i]["characterName"] + " " + myDataSet.Tables[0].Rows[i]["Realm"] +
               " " + myDataSet.Tables[0].Rows[i]["Race"] + " " + myDataSet.Tables[0].Rows[i]["Class"] + "<br>";
         }

        return users;
    }

    /*************************************************************************************************
     * I cannot remember how I ended up calculating the different population comparison per
     * class and race. Initially, when the list of all characters populated, at the top or bottom 
     * (I hadn't decided yet) there was to be a list of each race and its percent of the total
     * population of classes and/or races. 
     * There was to be a query accessing the DB for the total number of that specific race or class 
     * divided by the total number of characters. Thus, producing a string across the top or bottom
     * of the populations of each. This could then be used when creating the visual (bar or pie chart)
     * However, I cannot remember the specifics of how it was implemented. 
     *************************************************************************************************
    public int getNumberOfRace(string race){

        DBManager myDBManager = new DBManager();
        int numberOfRace = 0;
        string myQuery = "";

        if (race == "Orc")
        {
            myQuery = "spNumberOfRace";
        }
        else if (race == "Undead")
        {
            myQuery = "spNumberOfRace";
        }
        else if (race == "Tauren")
        {
            myQuery = "spNumberOfRace";
        }
        else if (race == "Troll")
        {
            myQuery = "spNumberOfRace";
        }
        else if (race == "Blood Elf")
        {
            myQuery = "spNumberOfRace";
        }
        else if (race == "Goblin")
        {
            myQuery = "spNumberOfRace";
        }
        else if (race == "Horde Pandaren")
        {
            myQuery = "spNumberOfRace";
        }
        else if (race == "High Mountain Tauren")
        {
            myQuery = "spNumberOfRace";
        }
        else if (race == "Mag'har Orc")
        {
            myQuery = "spNumberOfRace";
        }
        else if (race == "Nightborne")
        {
            myQuery = "spNumberOfRace";
        }
        else if (race == "Zandalari Troll")
        {
            myQuery = "spNumberOfRace";
        }
        if (race == "Human")
        {
            myQuery = "spNumberOfRace";
        }
        else if (race == "Dwarf")
        {
            myQuery = "spNumberOfRace";
        }
        else if (race == "Night Elf")
        {
            myQuery = "spNumberOfRace";
        }
        else if (race == "Gnome")
        {
            myQuery = "spNumberOfRace";
        }
        else if (race == "Draenei")
        {
            myQuery = "spNumberOfRace";
        }
        else if (race == "Worgen")
        {
            myQuery = "spNumberOfRace";
        }
        else if (race == "Alliance Pandaren")
        {
            myQuery = "spNumberOfRace";
        }
        else if (race == "Dark Iron Dwarf")
        {
            myQuery = "spNumberOfRace";
        }
        else if (race == "Kul Tiran")
        {
            myQuery = "spNumberOfRace";
        }
        else if (race == "Lightforged Draenei")
        {
            myQuery = "spNumberOfRace";
        }
        else if (race == "Void Elf")
        {
            myQuery = "spNumberOfRace";        }

        SqlParameter[] myParameters = new SqlParameter[0];
        DataSet myDataSet = myDBManager.createDataSet(myQuery, myParameters);
        SqlCommand sqlCommand = new SqlCommand(myQuery);

        return numberOfRace;
    }

    */

    public int DeleteUser(int UserID)
    {

        DBManager myDBManager = new DBManager();

        string myQuery = "spDeleteUser";
        SqlParameter[] myParameters = new SqlParameter[1];
        myParameters[0] = new SqlParameter("userID", UserID);

        int rows = myDBManager.executeNonQuery(myQuery, myParameters);

        return rows;
    }

    /*Varifies username and password combinations
     *Returns the number of users with the same username/password combo
     *If there are no users with that combination, return resulting in login failure
     */
    public int LoginVarification(string userName, string password)
    {
        DBManager myDBManager = new DBManager();

        string myQuery = "spLoginVarification";
        SqlParameter[] myParameters = new SqlParameter[2];
        myParameters[0] = new SqlParameter("userName", userName);
        myParameters[1] = new SqlParameter("password", password);
        DataSet myDataSet = myDBManager.createDataSet(myQuery, myParameters);


        /* Change below code b/c spLoginVarification needs to SELECT the userID based on
         * a matching userName and password combination. 
         * Use that returned userID to populate the Profile Page for the specific user.
         * (Perhaps use the spGetSpecificUser to retrieve the user info from that userID)
         */
        int users = 0;
        int login = -1;

        for (int i = 0; i < myDataSet.Tables[0].Rows.Count; i++)
        {
            users++;
        }

       if(users > 0)
        {
            login++;
        }
        return login;

    }
   
}