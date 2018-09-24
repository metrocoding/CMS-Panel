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

public partial class log : System.Web.UI.Page
{

    string cs = WebConfigurationManager.ConnectionStrings["all"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void log_click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(cs);
        SqlCommand cmd = new SqlCommand("account_verify", con);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@uname", log_user.Value);
        cmd.Parameters.AddWithValue("@pass", log_pass.Value);

        cmd.Parameters.Add("@retvalue", SqlDbType.Int).Direction = ParameterDirection.Output;
        cmd.Parameters.Add("@utype", SqlDbType.NVarChar, 50).Direction = ParameterDirection.Output;
        cmd.Parameters.Add("@id", SqlDbType.Int).Direction = ParameterDirection.Output;


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
            error.InnerHtml = "نام کاربری یا رمز ورود اشتباه";
            error.Style.Add("color", "red");
        }
        else if (result == 1)
        {
            string ut = cmd.Parameters["@utype"].Value.ToString();
            int uid = (int)cmd.Parameters["@id"].Value;

            Session["uid"] = uid;

            if (ut == "user")
            {
                Response.Redirect("~/user/user.aspx");
            }
            else if (ut == "admin")
            {
                Response.Redirect("~/admin/admin.aspx");
            }
        }
    }


}