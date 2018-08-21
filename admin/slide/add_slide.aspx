<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add_slide.aspx.cs" Inherits="admin_slide_add_slide" %>

<!DOCTYPE html>

<html>
<head>

    <link href="../../style/fonts.css" rel="stylesheet" />
    <link href="../../style/base.css" rel="stylesheet" />
    <link href="../../style/2 panel.css" rel="stylesheet" />
    <link href="../../style/form.css" rel="stylesheet" />
    <link href="../../style/header.css" rel="stylesheet" />
    <link href="../../style/accardion.css" rel="stylesheet" />

</head>
<body>

    <div id="header"></div>
    <div id="content">

        <div class="holder">

            <div class="right">
                <!-- accardion  -->
            </div>

            <div class="center">
                <div class="form">
                    <h2>افزودن اسلاید</h2>

                    <div id="error" runat="server">ذخیره در دیتابیس </div>

                    <div class="items item1">
                        <span class="title">عنوان </span>
                        <input type="text" id="sli_title" runat="server" placeholder="فارسی وارد شود ..." />
                        <span class="error"></span>
                    </div>

                    <div class="items item2">
                        <span class="title">شروع نمایش </span>
                        <input type="text" id="sli_start" runat="server" placeholder=" فرمت تاریخ : 1395/05/02 ..." />
                        <span class="error"></span>
                    </div>

                    <div class="items item3">
                        <span class="title">پایان نمایش </span>
                        <input type="text" id="sli_end" runat="server" placeholder=" فرمت تاریخ : 1395/05/02 ..." />
                        <span class="error"></span>
                    </div>

                    <div class="items item4">
                        <span class="title">اولویت نمایش </span>
                        <input type="text" id="sli_order" runat="server" placeholder="عدد از 1 تا 99 ..." />
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
                        <input type="submit" value="افزودن" runat="server" />
                        <input type="submit" value="پاک کردن" runat="server" />
                    </div>


                </div>


            </div>
        </div>

    </div>

    <div id="footer"></div>




</body>
</html>
