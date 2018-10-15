using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;

public class myFile
{
    public myFile()
    {
        
    }

    public static string upload_image(string inp,string folder)
    {
        string fileName = "avatari.png";
        string fileExt = "";

        HttpPostedFile file = HttpContext.Current.Request.Files[inp];

        if (file != null)
        {
            fileExt = Path.GetExtension(file.FileName);

            if (fileExt == ".jpg" || fileExt == ".jpeg" || fileExt == ".png")
            {
                fileName = Path.GetFileName(file.FileName);

                Random r = new Random();

                fileName = r.Next(10000, 99999) + "_" + fileName;

                file.SaveAs(HttpContext.Current.Server.MapPath("~/images/uploads/" + folder + "/full/") + fileName);
            }
        }

        return fileName;

    }
}