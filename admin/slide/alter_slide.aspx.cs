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

using System.Globalization;
using System.IO;

public partial class admin_slide_alter_slide : System.Web.UI.Page
{


    string connectionAddress = WebConfigurationManager.ConnectionStrings["all"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        int sid = Convert.ToInt32(Request.QueryString["id"]);

        SqlConnection con = new SqlConnection(connectionAddress);
        SqlCommand cmd = new SqlCommand("select * from slide where id = @id", con);

        cmd.Parameters.AddWithValue("@id", sid);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();

        try
        {
            con.Open();
            da.Fill(dt);
        }

        //catch{}
        finally
        {
            con.Close();
        }

        //fill form
        slide_img.Src = "~/images/uploads/slides/full/" + dt.Rows[0][7];
        sli_title.Value = dt.Rows[0][1].ToString();
        sli_start.Value = dt.Rows[0][2].ToString();
        sli_end.Value = dt.Rows[0][3].ToString();
        sli_order.Value = dt.Rows[0][4].ToString();
        sli_des.Value = dt.Rows[0][8].ToString();
    }
}