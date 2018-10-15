using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Globalization;

public class myDate
{
    public myDate()
    {
       
    }

    public static int get_date()
    {
        //persian date========

        DateTime miladi = DateTime.Today;
        PersianCalendar shamsi = new PersianCalendar();
        int y = shamsi.GetYear(miladi);
        int m = shamsi.GetMonth(miladi);
        int d = shamsi.GetDayOfMonth(miladi);
        int sha = y * 10000 + m * 100 + d;
        return sha;
    }
}