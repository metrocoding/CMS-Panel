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

public partial class user_message_form : System.Web.UI.Page
{

    string connectionAddress = WebConfigurationManager.ConnectionStrings["all"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void send_mes(object sender, EventArgs e)
    {
        //persian date========

        DateTime miladi = DateTime.Today;
        PersianCalendar shamsi = new PersianCalendar();
        int y = shamsi.GetYear(miladi);
        int m = shamsi.GetMonth(miladi);
        int d = shamsi.GetDayOfMonth(miladi);
        int sha = y * 10000 + m * 100 + d;

        //get file============

        string fileName = "";
        string fileExt = "";

        HttpPostedFile file = Request.Files["mes_attach"];

        if (file != null)
        {
            fileExt = Path.GetExtension(file.FileName);

            if (fileExt == ".doc" || fileExt == ".zip" || fileExt == ".pdf" || fileExt == ".docx")
            {
                fileName = Path.GetFileName(file.FileName);

                Random r = new Random();

                fileName = r.Next(10000, 99999) + "_" + fileName;

                file.SaveAs(Server.MapPath("~/messagefiles/") + fileName);
            }
        }
    

    SqlConnection connection = new SqlConnection(connectionAddress);

    SqlCommand command = new SqlCommand("insert into messaging values (@p1,@p2,@p3,@p4,@p5,@p6)", connection);

        command.Parameters.AddWithValue("@p1", mes_contact.Value);
        command.Parameters.AddWithValue("@p2", mes_title.Value);
        command.Parameters.AddWithValue("@p3", mes_prio.Value);
        command.Parameters.AddWithValue("@p4", fileName);
        command.Parameters.AddWithValue("@p5", mes_body.Value);
        command.Parameters.AddWithValue("@p6", sha);

        try
        {
            connection.Open();
            command.ExecuteNonQuery();
            error.InnerHtml = "با موفقیت ارسال شد";
        }
        //catch { }
        finally
        {
            connection.Close();
        }
    }




    protected void clear_form(object sender, EventArgs e)
    {
        mes_contact.Value = "";
        mes_title.Value = "";
        mes_prio.SelectedIndex = 0;
        mes_body.Value = "";
    }
}