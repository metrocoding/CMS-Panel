using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.Configuration;

using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;

public partial class admin_admin : System.Web.UI.Page
{

    string cs = WebConfigurationManager.ConnectionStrings["all"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        welcome();
    }

    void welcome()
    {
        int user_id = (int)Session["uid"];
        SqlConnection con = new SqlConnection(cs);
        SqlCommand cmd = new SqlCommand("select fname,lname,uname,sex,pic from account where id=@id", con);
        cmd.Parameters.AddWithValue("@id", user_id);

        SqlDataReader reader;

        try
        {
            con.Open();
            reader = cmd.ExecuteReader();
            reader.Read();
            string user_sex = (bool)reader["sex"] == true ? "آقای " : "خانوم ";
            string full_name = reader["fname"] + " " + reader["lname"] + "(" + reader["uname"] + ")";

            welcom.InnerHtml = user_sex + " " + full_name;
        }

        //catch { }

        finally
        {
            con.Close();
        }
    }
}