<%@ Page Language="C#" AutoEventWireup="true" CodeFile="news.aspx.cs" Inherits="admin_news_news" %>

<%@ Register Src="~/controls/admin_accar.ascx" TagPrefix="uc1" TagName="admin_accar" %>


<!DOCTYPE html>

<html>
<head>
    <title>افزودن خبر</title>
    <link href="../../style/fonts.css" rel="stylesheet" />
    <link href="../../style/base.css" rel="stylesheet" />
    <link href="../../style/2 panel.css" rel="stylesheet" />
    <link href="../../style/form.css" rel="stylesheet" />
    <link href="../../style/header.css" rel="stylesheet" />
    <script src="../../script/jquery.js"></script>
    <link href="../../style/accardion.css" rel="stylesheet" />

</head>
<body>

    <form runat="server">

        <div id="header"></div>

        <div id="content">

            <div class="holder">

                <div class="right">

                    <!-- accardion  -->
                    <uc1:admin_accar runat="server" ID="admin_accar" />
                </div>
                <div class="center">
                    <div class="form">
                        <h2>افزودن خبر</h2>

                        <div id="error" runat="server">ثبت خبر </div>

                        <div class="items item18">
                            <span class="title">عنوان </span>
                            <input type="text" id="news_title" runat="server" placeholder="فارسی وارد شود ..." autocomplete="off" />
                            <span class="error"></span>
                        </div>

                        <div class="items item19">
                            <span class="title">نویسنده </span>
                            <input type="text" id="news_author" runat="server" placeholder="نویسنده خبر ..." autocomplete="off" />
                            <span class="error"></span>
                        </div>

                        <div class="items item18">
                            <span class="title">لینک منبع</span>
                            <input type="text" id="news_source" runat="server" placeholder="لینک منبع خبر " autocomplete="off" />
                            <span class="error"></span>
                        </div>

                        <div class="items item19">
                            <span class="title">اولویت نمایش </span>
                            <input type="text" id="news_order" runat="server" placeholder="عدد از 1 تا 99 ..." autocomplete="off" />
                            <span class="error"></span>
                        </div>

                        <div class="items item18">
                            <span class="title">دسته بندی </span>
                            <select id="news_category" runat="server">
                                <option>ورزشی </option>
                                <option>هنری</option>
                                <option>علمی</option>
                                <option>فرهنگی</option>
                                <option>سیاسی</option>
                            </select>

                        </div>

                        <div class="items item19">
                            <span class="title">عکس خبر </span>

                            <input type="file" id="news_pic" runat="server" />
                            <label for="news_pic">آپلود </label>
                        </div>

                        <div class="items no_color">
                            <span class="title tt">وضعیت نمایش </span>

                            <input type="radio" id="show" runat="server" name="r" checked />
                            <label for="show">نمایش </label>

                            <input type="radio" id="hide" runat="server" name="r" />
                            <label for="hide">عدم نمایش</label>
                        </div>



                        <div class="items item24">
                            <span class="title tt2">خلاصه</span>
                            <textarea id="news_short" runat="server">  </textarea>
                        </div>

                        <div class="items item7">
                            <span class="title tt2">خبر کامل </span>
                            <textarea id="news_detail" runat="server">  </textarea>
                        </div>

                        <div class="items item8">
                            <input type="submit" value="افزودن" runat="server" onserverclick="add_news" />
                            <input type="submit" value="پاک کردن" runat="server" onserverclick="reset_form" />
                        </div>


                    </div>


                </div>
            </div>

        </div>

    </form>

</body>

<script>
    flag = 0;

    $(".headright > .menuswitch").click(function () {
        if (flag == 0) {
            $("#content>.holder>.right").addClass("close");
            $("body").css({ padding:"0 70px 0 0"} );
            flag = 1;
        } else if (flag == 1) {
            $("#content>.holder>.right").removeClass("close");
            $("body").css({ padding: "0 315px 0 0"} );
            flag = 0;
        }
    })
</script>

</html>
