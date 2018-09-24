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

using System.IO;

public partial class sign : System.Web.UI.Page
{

    string cs = WebConfigurationManager.ConnectionStrings["all"].ConnectionString;


    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void sign_click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(cs);
        SqlCommand cmd = new SqlCommand("account_insert", con);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@uname",sign_user.Value);
        cmd.Parameters.AddWithValue("@pass", sign_pass.Value);
        cmd.Parameters.Add("@retvalue", SqlDbType.Int).Direction = ParameterDirection.Output;

        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
        }
        //catch{}
        finally
        {
            con.Close();
        }

        int result = (int)cmd.Parameters["@retvalue"].Value;

        if (result == 0)
        {
            error.InnerHtml = "نام کاربری تکراری است";
            error.Style.Add("color", "red");
        }
        else if (result == 1)
        {
            error.InnerHtml = "ثبت موفقیت آمیز";
        }
    }
}