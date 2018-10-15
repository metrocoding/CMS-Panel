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


public partial class admin_slide_add_slide : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {

    }


    myData md = new myData();


    protected void add_click(object sender, EventArgs e)
    {


        string cmdText = "insert into slide values (@p1,@p2,@p3,@p4,@p5,@p6,@p7,@p8,@p9)";
        Dictionary<string, object> dic = new Dictionary<string, object>();

        dic.Add("@p1", sli_title.Value);
        dic.Add("@p2", sli_start.Value.Replace("/",""));
        dic.Add("@p3", sli_end.Value.Replace("/", ""));
        dic.Add("@p4", sli_order.Value);
        dic.Add("@p5", sli_page.Value);
        dic.Add("@p6", show.Checked);
        dic.Add("@p7", myFile.upload_image("sli_pic","slides"));
        dic.Add("@p8", sli_des.Value);
        dic.Add("@p9", myDate.get_date());

        md.myExecuteNonQuery(cmdText, "text", dic);

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