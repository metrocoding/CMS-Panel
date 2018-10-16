using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;

using System.Text;
using System.Security.Cryptography;

using System.Drawing;

public class myFile
{
    public myFile()
    {

    }

    public static string upload_image(string inp, string folder)
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

                Image im = Image.FromStream(file.InputStream);
                int nWidth = 200;
                float asp = (float)im.Size.Width / (float)im.Size.Height;
                int nHeight = Convert.ToInt32(nWidth / asp);

                Bitmap b = resize_image(im,nWidth,nHeight);
                b.Save(HttpContext.Current.Server.MapPath("~/images/uploads/" + folder + "/thumbs/") + fileName);
            }
        }
        return fileName;
    }


    public static Bitmap resize_image(Image im, int newWidth, int newHeight)
    {
        var bm = new Bitmap(newWidth, newHeight);
        var g = Graphics.FromImage(bm);

        g.DrawImage(im, 0, 0, newWidth, newHeight);
        return bm;
    }


    public static string hash(string pass)
    {
        var x = new MD5CryptoServiceProvider();
        byte[] s = Encoding.ASCII.GetBytes(pass);
        s = x.ComputeHash(s);

        string h = Encoding.ASCII.GetString(s);
        return h;
    }

}