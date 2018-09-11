<%@ Page Language="C#" AutoEventWireup="true" CodeFile="alter_slide.aspx.cs" Inherits="admin_slide_alter_slide" %>

<%@ Register Src="~/controls/admin_accar.ascx" TagPrefix="uc1" TagName="admin_accar" %>



<!DOCTYPE html>

<html>
<head>
    <title>ویرایش اسلاید</title>
    <link href="../../style/fonts.css" rel="stylesheet" />
    <link href="../../style/base.css" rel="stylesheet" />
    <link href="../../style/2 panel.css" rel="stylesheet" />
    <link href="../../style/form.css" rel="stylesheet" />
    <link href="../../style/header.css" rel="stylesheet" />
    <link href="../../style/accardion.css" rel="stylesheet" />
    <script src="../../script/jquery.js"></script>

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
                        <h2>ویرایش اسلاید</h2>

                        <div class="items">
                            <img id="slide_img" runat="server" src="../../images/uploads/news/full/81680_Screenshot (2).png" />
                        </div>

                        <div id="error" runat="server"> ویرایش اسلاید </div>


                        <div class="items item1">
                            <span class="title">عنوان </span>
                            <input type="text" id="sli_title" runat="server" placeholder="فارسی وارد شود ..." autocomplete="off"/>
                            <span class="error"></span>
                        </div>

                        <div class="items item2">
                            <span class="title">شروع نمایش </span>
                            <input type="text" id="sli_start" runat="server" placeholder=" فرمت تاریخ : 1395/05/02 ..."  autocomplete="off"/>
                            <span class="error"></span>
                        </div>

                        <div class="items item3">
                            <span class="title">پایان نمایش </span>
                            <input type="text" id="sli_end" runat="server" placeholder=" فرمت تاریخ : 1395/05/02 ..."  autocomplete="off"/>
                            <span class="error"></span>
                        </div>

                        <div class="items item4">
                            <span class="title">اولویت نمایش </span>
                            <input type="text" id="sli_order" runat="server" placeholder="عدد از 1 تا 99 ..."  autocomplete="off"/>
                            <span class="error"></span>
                        </div>

                        <div class="items item5">
                            <span class="title">محل نمایش </span>
                            <select id="sli_page" runat="server">
                                <option>صفحه اصلی </option>
                                <option>صفحه اخبار </option>
                                <option>صفحه کالاها </option>
                            </select>

                        </div>

                        <div class="items item6">
                            <span class="title">عکس اسلاید </span>

                            <input type="file" id="sli_pic" runat="server" />
                            <label for="sli_pic">آپلود </label>
                        </div>

                        <div class="items no_color">
                            <span class="title tt">وضعیت نمایش </span>

                            <input type="radio" id="show" runat="server" name="r" checked />
                            <label for="show">نمایش </label>

                            <input type="radio" id="hide" runat="server" name="r" />
                            <label for="hide">عدم نمایش   </label>
                        </div>



                        <div class="items item7">
                            <span class="title tt2">توضیحات </span>
                            <textarea id="sli_des" runat="server">  </textarea>
                        </div>

                        <div class="items item8">
                            <input type="submit" value="بروزرسانی" runat="server"/>
                            <input type="submit" value=" حذف" runat="server"/>
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