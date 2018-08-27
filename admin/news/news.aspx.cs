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

public partial class admin_news_news : System.Web.UI.Page
{

    string connectionAddress = WebConfigurationManager.ConnectionStrings["all"].ConnectionString;


    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void add_news(object sender, EventArgs e)
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

        HttpPostedFile file = Request.Files["news_pic"];

        if (file != null)
        {
            fileExt = Path.GetExtension(file.FileName);

            if (fileExt == ".jpg" || fileExt == ".jpeg" || fileExt == ".png")
            {
                fileName = Path.GetFileName(file.FileName);

                Random r = new Random();

                fileName = r.Next(10000, 99999) + "_" + fileName;

                file.SaveAs(Server.MapPath("~/images/uploads/news/full/") + fileName);
            }
        }

        SqlConnection connection = new SqlConnection(connectionAddress);

        SqlCommand command = new SqlCommand("insert into news values (@p1,@p2,@p3,@p4,@p5,@p6,@p7,@p8,@p9,@p10)", connection);

        command.Parameters.AddWithValue("@p1", news_title.Value);
        command.Parameters.AddWithValue("@p2", news_author.Value);
        command.Parameters.AddWithValue("@p3", news_source.Value);
        command.Parameters.AddWithValue("@p4", news_order.Value);
        command.Parameters.AddWithValue("@p5", news_category.Value);
        command.Parameters.AddWithValue("@p6", fileName);
        command.Parameters.AddWithValue("@p7", show.Checked);
        command.Parameters.AddWithValue("@p8", news_short.Value);
        command.Parameters.AddWithValue("@p9", news_detail.Value);
        command.Parameters.AddWithValue("@p10", sha);

        try
        {
            connection.Open();
            command.ExecuteNonQuery();
            error.InnerHtml = "با موفقیت ثبت شد";
        }
        //catch { }
        finally
        {
            connection.Close();
        }

    }

    protected void reset_form(object sender, EventArgs e)
    {
        news_title.Value = "";
        news_author.Value = "";
        news_source.Value = "";
        news_order.Value = "";
        news_category.SelectedIndex = 0;
        hide.Checked = false;
        show.Checked = true;
        news_short.Value = "";
        news_detail.Value = "";
    }
}