<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="admin_admin" %>

<%@ Register Src="~/controls/admin_accar.ascx" TagPrefix="uc1" TagName="admin_accar" %>



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

    <div id="header">


                <a class="home" href="admin.aspx">
                    <img src="../images/Micon/home.png" /></a>
                <img id="user_pic" runat="server" src="../images/Micon/avatar.png" />

                <h2>پنل ادمین کل</h2>
                <h2 class="wel">وقت بخیر <span id="wel" runat="server">کاربر</span></h2>

    </div>

    <div id="content">

        <div class="holder">

            <div class="right">
                <!-- accardion  -->

                <uc1:admin_accar runat="server" ID="admin_accar" />

            </div>

            <div class="center">
                <div class="form">
                    <h2>افزودن اسلاید</h2>


                </div>


            </div>
        </div>

    </div>

    <div id="footer"></div>




</body>
</html>

