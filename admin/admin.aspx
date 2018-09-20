<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="admin_admin" %>

<%@ Register Src="~/controls/admin_accar.ascx" TagPrefix="uc1" TagName="admin_accar" %>
<%@ Register Src="~/controls/Header.ascx" TagPrefix="uc1" TagName="Header" %>




<!DOCTYPE html>

<html>
<head>
    <title>پنل ادمین</title>
    <link href="../../style/fonts.css" rel="stylesheet" />
    <link href="../../style/base.css" rel="stylesheet" />
    <link href="../../style/2 panel.css" rel="stylesheet" />
    <link href="../../style/form.css" rel="stylesheet" />
    <link href="../../style/header.css" rel="stylesheet" />
    <link href="../../style/accardion.css" rel="stylesheet" />
    <script src="../script/jquery.js"></script>

</head>
<body>

    <div id="header">
        <uc1:Header runat="server" ID="Header1" />
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
        <div id="time"></div>
    </div>





</body>

<script src="../script/JavaScript.js"></script>
</html>

