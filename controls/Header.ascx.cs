﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.Configuration;

using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;


public partial class controls_Header : System.Web.UI.UserControl
{

    string cs = WebConfigurationManager.ConnectionStrings["all"].ConnectionString;


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uid"] != null)
        {
            welcome();
        }
        else
        {
            Response.Redirect("~/log.aspx");
        }
    }

    void welcome()
    {
        int uid = (int)Session["uid"];

        SqlConnection con = new SqlConnection(cs);
        SqlCommand cmd = new SqlCommand("select fname,lname,uname,sex,pic from account where id = @id", con);

        cmd.Parameters.AddWithValue("@id", uid);

        SqlDataReader reader;

        try
        {
            con.Open();
            reader = cmd.ExecuteReader();

            reader.Read();

            user_avatar.Src = "~/images/uploads/slides/full/" + reader["pic"];

        }
        // catch { }
        finally
        {
            con.Close();
        }

    }

}