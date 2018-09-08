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
using System.Web.UI.HtmlControls;



public partial class admin_slide_all_slides : System.Web.UI.Page
{

    string connectionAddress = WebConfigurationManager.ConnectionStrings["all"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

        fill_grid();

    }

    void fill_grid()
    {

        //خواندن داده های جدول
        SqlConnection con = new SqlConnection(connectionAddress);
        SqlCommand command_sql = new SqlCommand("select * from slide",con);

        SqlDataAdapter da = new SqlDataAdapter(command_sql);
        DataSet ds = new DataSet();

        try
        {
            con.Open();
            da.Fill(ds);
        }
        // catch{}
        finally
        {
            con.Close();
        }


        //ساخت سطرهای گرید
        if (ds.Tables[0].Rows.Count == 0)
        {
            grid.InnerHtml = "داده ای موجود نمیباشد";
            grid.Style["padding"] = "100px 0";
            grid.Style["text-align"] = "center";
            grid.Style["color"] = "red";
            return;
        }

        for (int i=0; i< ds.Tables[0].Rows.Count;i++)
        {
            HtmlGenericControl ul = new HtmlGenericControl("ul");
            ul.Attributes["class"] = "items slidegrid";

            // pic
            HtmlGenericControl li_pic = new HtmlGenericControl("li");
            li_pic.Attributes["class"] = "pic";

            HtmlImage im = new HtmlImage();
            im.Src = "~/images/uploads/slides/full/" + ds.Tables[0].Rows[i][7];
            li_pic.Controls.Add(im);

            //title
            HtmlGenericControl li_title = new HtmlGenericControl("li");
            li_title.InnerHtml = ds.Tables[0].Rows[i][1].ToString();

            //start
            HtmlGenericControl li_start = new HtmlGenericControl("li");
            li_start.Attributes["class"] = "date";
            li_start.InnerHtml = ds.Tables[0].Rows[i][2].ToString();

            //end
            HtmlGenericControl li_end = new HtmlGenericControl("li");
            li_end.Attributes["class"] = "date";
            li_end.InnerHtml = ds.Tables[0].Rows[i][3].ToString();

            //page
            HtmlGenericControl li_page = new HtmlGenericControl("li");
            li_page.InnerHtml = ds.Tables[0].Rows[i][5].ToString();

            //order
            HtmlGenericControl li_order = new HtmlGenericControl("li");
            li_order.InnerHtml = ds.Tables[0].Rows[i][4].ToString();

            //show
            HtmlGenericControl li_show = new HtmlGenericControl("li");
            li_show.InnerHtml = ds.Tables[0].Rows[i][6].ToString();

            //edit
            HtmlGenericControl li_edit = new HtmlGenericControl("li");
            li_edit.Attributes["class"] = "edit";

            HtmlAnchor anc = new HtmlAnchor();
            anc.HRef = "alter_slide.aspx?id=" + ds.Tables[0].Rows[i][0];
            anc.Attributes["target"] = "_blank";

            li_edit.Controls.Add(anc);

            //delete
            HtmlGenericControl li_del = new HtmlGenericControl("li");
            li_del.Attributes["class"] = "del";

            ul.Controls.Add(li_pic);
            ul.Controls.Add(li_title);
            ul.Controls.Add(li_start);
            ul.Controls.Add(li_end);
            ul.Controls.Add(li_page);
            ul.Controls.Add(li_order);
            ul.Controls.Add(li_show);
            ul.Controls.Add(li_edit);
            ul.Controls.Add(li_del);

            grid.Controls.Add(ul);
        }

    }

}