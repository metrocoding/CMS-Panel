﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="all_slides.aspx.cs" Inherits="admin_slide_all_slides" %>

<%@ Register Src="~/controls/admin_accar.ascx" TagPrefix="uc1" TagName="admin_accar" %>
<%@ Register Src="~/controls/Header.ascx" TagPrefix="uc1" TagName="Header" %>



<!DOCTYPE html>

<html>
<head>
    <title>اسلایدها</title>
    <link href="../../style/fonts.css" rel="stylesheet" />
    <link href="../../style/base.css" rel="stylesheet" />
    <link href="../../style/2 panel.css" rel="stylesheet" />
    <link href="../../style/grid.css" rel="stylesheet" />
    <link href="../../style/header.css" rel="stylesheet" />
    <link href="../../style/accardion.css" rel="stylesheet" />
    <script src="../../script/jquery.js"></script>
    <link href="../../style/responsive.css" rel="stylesheet" />

    <script>
        fo = [];


        $(document).ready(function () {

            fill_items(0, 200);

        })

        function fill_items(start, count) {
            $.ajax({
                url: "all_slides.aspx/getAll",
                data: "{st:" + start + ",cu:" + count + "}",
                dataType: "json",
                contentType: "application/json",
                type: "post",
                success: function (response) {
                    fo = response.d;

                    $(".grid>.items.slidegrid").remove();

                    $(".geleydun").addClass("show");

                    setTimeout("delayfor()", 2000)


                },
                error: function () { }

            });
        }

        function delayfor() {
            $(".geleydun").removeClass("show");
            for (i = 0; i < fo.length; i++) {

                setTimeout("gridsaz(" + i + ")", i * 200);
            }
        }

        function gridsaz(i) {
            ul = $("<ul>").addClass("items slidegrid");
            im = $("<li>").addClass("pic");
            img = $("<img>").attr("src", "../../images/uploads/slides/full/" + fo[i].pic);
            tit = $("<li>").html(fo[i].title);
            sta = $("<li>").addClass("date").html(fo[i].start);
            en = $("<li>").addClass("date").html(fo[i].end);
            pag = $("<li>").html(fo[i].target);
            ord = $("<li>").html(fo[i].order);
            if (fo[i].show == "True") {
                sho = $("<li>").html("نمایش");
            } else if (fo[i].show == "False") {
                sho = $("<li>").html("عدم نمایش");
            }
            //sho = $("<li>").html(fo[i].show);
            edi = $("<li>").addClass("edit");
            anc = $("<a>").attr("target", "_blank").attr("href", "alter_slide.aspx?id=" + fo[i].id);
            edi.append(anc);

            del = $("<li>").addClass("del");

            $(".grid").append(ul);
            ul.append(im).append(tit).append(sta).append(en).append(pag).append(ord).append(sho).append(edi).append(del);
            im.append(img);
        }



    </script>

</head>
<body>

    <div id="header" class="res">
        <uc1:Header runat="server" ID="Header1" />
    </div>
    <div id="content">

        <div id="time"></div>


        <div class="holder">

            <div class="right">
                <!-- accardion  -->

                <uc1:admin_accar runat="server" ID="admin_accar" />

            </div>

            <div class="center res">
                <div class="grid" id="grid" runat="server">
                    <h2>مشاهده اسلایدها</h2>

                    <ul class="items header">
                        <li>عنوان</li>
                        <li>شروع</li>
                        <li>پایان</li>
                        <li>صفحه</li>
                        <li>اولویت</li>
                        <li>وضعیت</li>
                        <li>ویرایش</li>
                    </ul>

                    <div class="geleydun show">

                        <div class="sk-cube-grid">
                            <div class="sk-cube sk-cube1"></div>
                            <div class="sk-cube sk-cube2"></div>
                            <div class="sk-cube sk-cube3"></div>
                            <div class="sk-cube sk-cube4"></div>
                            <div class="sk-cube sk-cube5"></div>
                            <div class="sk-cube sk-cube6"></div>
                            <div class="sk-cube sk-cube7"></div>
                            <div class="sk-cube sk-cube8"></div>
                            <div class="sk-cube sk-cube9"></div>
                        </div>

                    </div>


                </div>


            </div>
        </div>

    </div>





</body>
<script>
    flag = 0;

    setInterval("timing()", 1000);

    function timing() {
        var d = new Date();
        var h = d.getHours();
        var m = d.getMinutes();
        var time = h + " : " + m;

        $("#time").html(time);
    }

    $(".headright > .menuswitch").click(function () {
        if (flag == 0) {
            $("#content>.holder>.right").addClass("close");
            $("#header").removeClass("res");
            $("#content>.holder>.center").removeClass("res");
            $("body").css({ padding: "60px 70px 0 0" });
            flag = 1;
        } else if (flag == 1) {
            $("#content>.holder>.right").removeClass("close");
            $("#header").addClass("res");
            $("#content>.holder>.center").addClass("res");
            $("body").css({ padding: "60px 315px 0 0" });
            flag = 0;
        }
    })
</script>
</html>
