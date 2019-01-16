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
        if (!this.IsPostBack) {
            fill_form();
        }
    }

    void fill_form()
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
        sli_start.Value = dt.Rows[0][2].ToString().Insert(4, "/").Insert(7, "/");
        sli_end.Value = dt.Rows[0][3].ToString().Insert(4, "/").Insert(7, "/");
        ListItem li = sli_page.Items.FindByValue(dt.Rows[0][5].ToString());
        li.Selected = true;
        sli_order.Value = dt.Rows[0][4].ToString();
        sli_des.Value = dt.Rows[0][8].ToString();
    }


    protected void update_click(object sender, EventArgs e)
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

        if (file != null)
        {
            fileExt = Path.GetExtension(file.FileName);

            if (fileExt == ".jpg" || fileExt == ".jpeg" || fileExt == ".png")
            {
                fileName = Path.GetFileName(file.FileName);

                Random r = new Random();

                fileName = r.Next(10000, 99999) + "_" + fileName;

                file.SaveAs(Server.MapPath("~/images/uploads/slides/full/") + fileName);
            }
        }

        int sid = Int32.Parse( Request.QueryString["id"]);

        SqlConnection connection = new SqlConnection(connectionAddress);

        SqlCommand command = new SqlCommand("update slide set title=@p1,startDate=@p2,endDate=@p3,slideOrder=@p4,targetPage=@p5,show=@p6,pic = case when @p7='' then pic else @p7 end ,describe=@p8 where id=@id", connection);

        command.Parameters.AddWithValue("@p1", sli_title.Value);
        command.Parameters.AddWithValue("@p2", sli_start.Value.Replace("/", ""));
        command.Parameters.AddWithValue("@p3", sli_end.Value.Replace("/", ""));
        command.Parameters.AddWithValue("@p4", sli_order.Value);
        command.Parameters.AddWithValue("@p5", sli_page.Value);
        command.Parameters.AddWithValue("@p6", show.Checked);
        command.Parameters.AddWithValue("@p7", fileName);
        command.Parameters.AddWithValue("@p8", sli_des.Value);
        command.Parameters.AddWithValue("@id", sid);

        try
        {
            connection.Open();
            command.ExecuteNonQuery();
            error.InnerHtml = "تغییر موفقیت آمیز";

            Response.Redirect("alter_slide.aspx?id=" + sid);
        }
        //catch { }
        finally
        {
            connection.Close();
        }
    }


    protected void del_click(object sender, EventArgs e)
    {
        int sid = Int32.Parse(Request.QueryString["id"]);
        SqlConnection con = new SqlConnection(connectionAddress);
        SqlCommand cmd = new SqlCommand("delete from slide where id=@id",con);

        cmd.Parameters.AddWithValue("@id",sid);

        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            form.InnerHtml = "حذف موفقیت آمیز";



        }
        //catch { }

        finally
        {
            con.Close();
        }
    }

}

