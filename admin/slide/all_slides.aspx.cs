using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Collections;

using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Web.UI.HtmlControls;



public partial class admin_slide_all_slides : System.Web.UI.Page
{

    public class slide
    {
        public int id;
        public string title;
        public int start;
        public int end;
        public int order;
        public string target;
        public bool show;
        public string pic;
        public string des;

    }

    public static List<slide> slides = new List<slide>();


    [WebMethod]
    public static int getSize()
    {
        return slides.Count;
    }


    [WebMethod]
    public static List<slide> getAll(string st, string cu)
    {
        int s = Convert.ToInt32(st);
        int c = Convert.ToInt32(cu);

        if (s + c > slides.Count)
        {
            c = slides.Count - s;
        }

        return slides.GetRange(s, slides.Count);
    }







    string connectionAddress = WebConfigurationManager.ConnectionStrings["all"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        slides.Clear();
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

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {

            slide s1 = new slide();

            s1.id = Convert.ToInt32(ds.Tables[0].Rows[i][0]);
            s1.title = ds.Tables[0].Rows[i][1].ToString();
            s1.start = Convert.ToInt32(ds.Tables[0].Rows[i][2]);
            s1.end = Convert.ToInt32(ds.Tables[0].Rows[i][3]);
            s1.order = Convert.ToInt32(ds.Tables[0].Rows[i][4]);
            s1.target = ds.Tables[0].Rows[i][5].ToString();
            s1.show = Convert.ToBoolean(ds.Tables[0].Rows[i][6]);
            s1.pic = ds.Tables[0].Rows[i][7].ToString();
            s1.des = ds.Tables[0].Rows[i][8].ToString();

            slides.Add(s1);
        }


            //HtmlGenericControl ul = new HtmlGenericControl("ul");
            //ul.Attributes["class"] = "items slidegrid";

            //// pic
            //HtmlGenericControl li_pic = new HtmlGenericControl("li");
            //li_pic.Attributes["class"] = "pic";

            //HtmlImage im = new HtmlImage();
            //im.Src = "~/images/uploads/slides/full/" + ds.Tables[0].Rows[i][7];
            //li_pic.Controls.Add(im);

            ////title
            //HtmlGenericControl li_title = new HtmlGenericControl("li");
            //li_title.InnerHtml = ds.Tables[0].Rows[i][1].ToString();

            ////start
            //HtmlGenericControl li_start = new HtmlGenericControl("li");
            //li_start.Attributes["class"] = "date";
            //li_start.InnerHtml = ds.Tables[0].Rows[i][2].ToString();

            ////end
            //HtmlGenericControl li_end = new HtmlGenericControl("li");
            //li_end.Attributes["class"] = "date";
            //li_end.InnerHtml = ds.Tables[0].Rows[i][3].ToString();

            ////page
            //HtmlGenericControl li_page = new HtmlGenericControl("li");
            //li_page.InnerHtml = ds.Tables[0].Rows[i][5].ToString();

            ////order
            //HtmlGenericControl li_order = new HtmlGenericControl("li");
            //li_order.InnerHtml = ds.Tables[0].Rows[i][4].ToString();

            ////show
            //HtmlGenericControl li_show = new HtmlGenericControl("li");
            //li_show.InnerHtml = ds.Tables[0].Rows[i][6].ToString();

            ////edit
            //HtmlGenericControl li_edit = new HtmlGenericControl("li");
            //li_edit.Attributes["class"] = "edit";

            //HtmlAnchor anc = new HtmlAnchor();
            //anc.HRef = "alter_slide.aspx?id=" + ds.Tables[0].Rows[i][0];
            //anc.Attributes["target"] = "_blank";

            //li_edit.Controls.Add(anc);

            ////delete
            //HtmlGenericControl li_del = new HtmlGenericControl("li");
            //li_del.Attributes["class"] = "del";

            //ul.Controls.Add(li_pic);
            //ul.Controls.Add(li_title);
            //ul.Controls.Add(li_start);
            //ul.Controls.Add(li_end);
            //ul.Controls.Add(li_page);
            //ul.Controls.Add(li_order);
            //ul.Controls.Add(li_show);
            //ul.Controls.Add(li_edit);
            //ul.Controls.Add(li_del);

            //grid.Controls.Add(ul);
        

    }

}