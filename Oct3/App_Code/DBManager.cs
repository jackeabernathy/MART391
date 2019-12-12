﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;


public class DBManager
{
    public DBManager()
    {
      
    }

    string myConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
    SqlConnection myConnection;
    

    private SqlConnection openDatabase()
    {
        myConnection = new SqlConnection(myConnectionString);
        myConnection.Open();
        return myConnection;

    }

    private void closeDatabase()
    {

        myConnection.Close();
    }

    public DataSet createDataSet(String query, SqlParameter[] parameters)
    {

        openDatabase();
        string myQuery = query;

        DataSet myDataSet = new DataSet();
        SqlCommand myCommand = new SqlCommand(myQuery);
        myCommand.Connection = myConnection;
        myCommand.CommandType = CommandType.StoredProcedure;
        myCommand.Parameters.AddRange(parameters);

        SqlDataAdapter myAdapter = new SqlDataAdapter(myCommand);
        myAdapter.Fill(myDataSet);
        closeDatabase();

        return myDataSet;

    }


    public int executeNonQuery(String query, SqlParameter[] parameters)
    {

        openDatabase();
        string myQuery = query;

        SqlCommand myCommand = new SqlCommand(myQuery);
        myCommand.Connection = myConnection;
        myCommand.CommandType = CommandType.StoredProcedure;

        myCommand.Parameters.AddRange(parameters);
        int rows = myCommand.ExecuteNonQuery();
        return rows;
    }
}