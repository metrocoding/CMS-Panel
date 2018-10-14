<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add_slide.aspx.cs" Inherits="admin_slide_add_slide" %>

<%@ Register Src="~/controls/admin_accar.ascx" TagPrefix="uc1" TagName="admin_accar" %>
<%@ Register Src="~/controls/Header.ascx" TagPrefix="uc1" TagName="Header" %>



<!DOCTYPE html>

<html>
<head>
    <title>افزودن اسلاید</title>
    <script src="../../script/jquery.js"></script>
    <link href="../../style/fonts.css" rel="stylesheet" />
    <link href="../../style/base.css" rel="stylesheet" />
    <link href="../../style/2 panel.css" rel="stylesheet" />
    <link href="../../style/form.css" rel="stylesheet" />
    <link href="../../style/header.css" rel="stylesheet" />
    <link href="../../style/accardion.css" rel="stylesheet" />
    <link href="../../style/responsive.css" rel="stylesheet" />
    

</head>
<script>
    window.onload = function () {
      accartune(0,0)
    }


    r = /^a*/;
    r = /^a+/;

    r = /^.{3,5}$/;

    r = /^a\/$/;


    r = /^\w(\w|\d|_|-|\.){0,20}@(\d|\w)(\w|\d|-){0,20}(\.\w{2,4}){1,3}$/;


    r1 = /^.{8,}$/;
    r2 = /\d/;
    r3 = /[A-Z]/;


    r1 = /^[\u0600-\u06ff]([\u0600-\u06ff]|\s|\d){3,50}$/;

    r2 = /^1(3|4)\d{2}\/\d{2}\/\d{2}$/;



    function validate_form() {
        er = 0;
        error.innerHTML = "";

        //title
        if (!r1.test(sli_title.value)) {
            er = 1;
            $("#sli_title").parent().addClass("er");
            error.innerHTML = "خطای عنوان";
        } else {
            $("#sli_title").parent().addClass("ok");
            $("#sli_title").parent().removeClass("er");
        }

        //start
        if (!r2.test(sli_start.value)) {
            er = 1;
            $("#sli_start").parent().addClass("er");
            error.innerHTML += "<br>" + "خطای تاریخ شروع";
        } else {
            $("#sli_start").parent().addClass("ok");
            $("#sli_start").parent().removeClass("er");
        }

        //end
        if (!r2.test(sli_end.value)) {
            er = 1;
            $("#sli_end").parent().addClass("er");
            error.innerHTML += "<br>" + "خطای تاریخ پایان";
        } else {
            $("#sli_end").parent().addClass("ok");
            $("#sli_end").parent().removeClass("er");
        }


        //order
        if (sli_order.value < 0 && sli_order.value > 100) {
            er = 1;
            $("#sli_order").parent().addClass("er");
            error.innerHTML += "<br>" + "خطای اولویت";
        } else {
            $("#sli_order").parent().addClass("ok");
            $("#sli_order").parent().removeClass("er");
        }



        if (er == 0) {
            return true;
        }
        if (er == 1) {
            return false;
        }
    }


</script>
<body>

    <form runat="server" onsubmit="return validate_form()">

        <div class="head">

            <div class="headright">
                <div class="menuswitch"></div>
            </div>



            <uc1:Header runat="server" ID="Header1" />


        </div>

        <div id="content">



            <div class="holder">

                <div class="right">
                    <!-- accardion  -->

                    <uc1:admin_accar runat="server" ID="admin_accar" />

                </div>
                <div class="center res">
                    <div class="form">
                        <h2>افزودن اسلاید</h2>

                        <div id="error" runat="server"></div>

                        <div class="items item1 ">
                            <span class="title">عنوان </span>
                            <input type="text" id="sli_title" runat="server" placeholder="فارسی وارد شود ..." autocomplete="off" />
                            <span class="error"></span>
                        </div>

                        <div class="items item2 ">
                            <span class="title">شروع نمایش </span>
                            <input type="text" id="sli_start" runat="server" placeholder=" فرمت تاریخ : 1395/05/02 ..." autocomplete="off" />
                            <span class="error"></span>
                        </div>

                        <div class="items item3">
                            <span class="title">پایان نمایش </span>
                            <input type="text" id="sli_end" runat="server" placeholder=" فرمت تاریخ : 1395/05/02 ..." autocomplete="off" />
                            <span class="error"></span>
                        </div>

                        <div class="items item4">
                            <span class="title">اولویت نمایش </span>
                            <input type="text" id="sli_order" runat="server" placeholder="عدد از 1 تا 99 ..." autocomplete="off" />
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
                            <label for="sli_pic">انتخاب </label>
                        </div>

                        <div class="items no_color no2">
                            <div class="switchmain">
                                <label class="switch">
                                    <input type="checkbox" id="show" runat="server" checked />
                                    <span class="slider"></span>
                                </label>
                                وضعیت نمایش
   
                            </div>
                        </div>



                        <div class="items item7 it1">
                            <span class="title tt2">توضیحات </span>
                            <textarea id="sli_des" runat="server">  </textarea>
                        </div>

                        <div class="items item8">
                            <input class="greenbut" type="submit" value="افزودن" runat="server" onserverclick="add_click" />
                            <input class="redbut" type="submit" value="پاک کردن" runat="server" />
                        </div>


                    </div>


                </div>
            </div>

            <div id="time"></div>

        </div>


    </form>

</body>
    <script src="../../script/JavaScript.js"></script>



</html>
