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

public partial class admin_product_add_product : System.Web.UI.Page
{

    string connectionAddress = WebConfigurationManager.ConnectionStrings["all"].ConnectionString;


    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void adding(object sender, EventArgs e)
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

        HttpPostedFile file = Request.Files["album_art"];

        if (file != null)
        {
            fileExt = Path.GetExtension(file.FileName);

            if (fileExt == ".jpg" || fileExt == ".jpeg" || fileExt == ".png")
            {
                fileName = Path.GetFileName(file.FileName);

                Random r = new Random();

                fileName = r.Next(10000, 99999) + "_" + fileName;

                file.SaveAs(Server.MapPath("~/images/uploads/albumart/full/") + fileName);
            }
        }



        SqlConnection connection = new SqlConnection(connectionAddress);

        SqlCommand command = new SqlCommand("insert into addalbum values (@p1,@p2,@p3,@p4,@p5,@p6,@p7,@p8)", connection);

        command.Parameters.AddWithValue("@p1", album_title.Value);
        command.Parameters.AddWithValue("@p2", album_artist.Value);
        command.Parameters.AddWithValue("@p3", album_genre.Value);
        command.Parameters.AddWithValue("@p4", album_price.Value);
        command.Parameters.AddWithValue("@p5", fileName);
        command.Parameters.AddWithValue("@p6", show.Checked);
        command.Parameters.AddWithValue("@p7", album_des.Value);
        command.Parameters.AddWithValue("@p8", sha);

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


    protected void resetform(object sender, EventArgs e)
    {
        album_title.Value = "";
        album_artist.Value = "";
        album_genre.SelectedIndex = 0;
        album_price.Value = "";
        hide.Checked = false;
        show.Checked = true;
        album_des.Value = "";
    }
}