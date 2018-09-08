<%@ Page Language="C#" AutoEventWireup="true" CodeFile="all_slides.aspx.cs" Inherits="admin_slide_all_slides" %>

<%@ Register Src="~/controls/admin_accar.ascx" TagPrefix="uc1" TagName="admin_accar" %>


<!DOCTYPE html>

<html>
<head>

    <link href="../../style/fonts.css" rel="stylesheet" />
    <link href="../../style/base.css" rel="stylesheet" />
    <link href="../../style/2 panel.css" rel="stylesheet" />
    <link href="../../style/grid.css" rel="stylesheet" />
    <link href="../../style/header.css" rel="stylesheet" />
    <link href="../../style/accardion.css" rel="stylesheet" />

</head>
<body>

    <div id="header"></div>
    <div id="content">

        <div class="holder">

            <div class="right">
                <!-- accardion  -->

                <uc1:admin_accar runat="server" ID="admin_accar" />

            </div>

            <div class="center">
                <div class="grid" id="grid" runat="server">
                    <h2>مشاهده اسلاید</h2>

                    <ul class="items header">
                        <li>عنوان</li>
                        <li>شروع</li>
                        <li>پایان</li>
                        <li>صفحه</li>
                        <li>اولویت</li>
                        <li>وضعیت</li>
                        <li>ویرایش</li>
                    </ul>


                </div>


            </div>
        </div>

    </div>
    
    <div id="footer"></div>




</body>
</html>
