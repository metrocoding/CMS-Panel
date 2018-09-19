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
            $("body").css({ padding:"60px 70px 0 0"} );
            flag = 1;
        } else if (flag == 1) {
            $("#content>.holder>.right").removeClass("close");
            $("body").css({ padding: "60px 315px 0 0"} );
            flag = 0;
        }
    })
</script>
</html>

