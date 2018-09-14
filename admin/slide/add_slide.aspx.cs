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

using System.Globalization;
using System.IO;


public partial class admin_slide_add_slide : System.Web.UI.Page
{

    string connectionAddress = WebConfigurationManager.ConnectionStrings["all"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void add_click(object sender, EventArgs e)
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

        HttpPostedFile file = Request.Files["sli_pic"];

        if (file!= null)
        {
            fileExt = Path.GetExtension(file.FileName);

            if (fileExt==".jpg" || fileExt == ".jpeg" || fileExt == ".png" )
            {
                fileName = Path.GetFileName(file.FileName);

                Random r = new Random();

                fileName = r.Next(10000, 99999) + "_" + fileName;

                file.SaveAs(Server.MapPath("~/images/uploads/slides/full/") + fileName);
            }
        }



        SqlConnection connection = new SqlConnection(connectionAddress);

        SqlCommand command = new SqlCommand("insert into slide values (@p1,@p2,@p3,@p4,@p5,@p6,@p7,@p8,@p9)", connection);

        command.Parameters.AddWithValue("@p1", sli_title.Value);
        command.Parameters.AddWithValue("@p2", sli_start.Value);
        command.Parameters.AddWithValue("@p3", sli_end.Value);
        command.Parameters.AddWithValue("@p4", sli_order.Value);
        command.Parameters.AddWithValue("@p5", sli_page.Value);
        command.Parameters.AddWithValue("@p6", show.Checked);
        command.Parameters.AddWithValue("@p7", fileName);
        command.Parameters.AddWithValue("@p8", sli_des.Value);
        command.Parameters.AddWithValue("@p9", sha);

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



    protected void reset_click(object sender, EventArgs e)
    {
        sli_title.Value = "";
        sli_start.Value = "";
        sli_end.Value = "";
        sli_order.Value = "";
        show.Checked = true;
        sli_des.Value = "";
        sli_page.SelectedIndex = 0;
    }


}