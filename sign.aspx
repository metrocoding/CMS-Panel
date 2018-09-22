<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sign.aspx.cs" Inherits="sign" %>


<!DOCTYPE html>

<html>
<head>
    <title>ثبت نام</title>
    <link href="../../style/fonts.css" rel="stylesheet" />
    <link href="../../style/base.css" rel="stylesheet" />
    <link href="../../style/2 panel.css" rel="stylesheet" />
    <link href="../../style/form.css" rel="stylesheet" />
    <link href="../../style/header.css" rel="stylesheet" />
    <link href="../../style/accardion.css" rel="stylesheet" />
    <link href="style/sign.css" rel="stylesheet" />
    <script src="script/jquery.js"></script>

    <style>
        body {
            padding: 0;
            margin: 0;
            overflow-x:hidden;
            background-color: #0099B4;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 1600 900'%3E%3Cpolygon fill='%23cc0000' points='957 450 539 900 1396 900'/%3E%3Cpolygon fill='%23aa0000' points='957 450 872.9 900 1396 900'/%3E%3Cpolygon fill='%23d6002b' points='-60 900 398 662 816 900'/%3E%3Cpolygon fill='%23b10022' points='337 900 398 662 816 900'/%3E%3Cpolygon fill='%23d9004b' points='1203 546 1552 900 876 900'/%3E%3Cpolygon fill='%23b2003d' points='1203 546 1552 900 1162 900'/%3E%3Cpolygon fill='%23d3006c' points='641 695 886 900 367 900'/%3E%3Cpolygon fill='%23ac0057' points='587 900 641 695 886 900'/%3E%3Cpolygon fill='%23c4008c' points='1710 900 1401 632 1096 900'/%3E%3Cpolygon fill='%239e0071' points='1710 900 1401 632 1365 900'/%3E%3Cpolygon fill='%23aa00aa' points='1210 900 971 687 725 900'/%3E%3Cpolygon fill='%23880088' points='943 900 1210 900 971 687'/%3E%3C/svg%3E");
            background-attachment: fixed;
            background-size: cover;
        }

        .form {
            transition: .5s;
            width: 400px;
            height: 600px;
            background-color: #fff;
            background-image: url("images/Micon/pass.png"),url("images/Micon/id.png");
            background-repeat: no-repeat;
            background-position: 35px 700px,35px 700px;
            background-size: 64px;
            margin: 150px auto 0;
            box-shadow: 0 1px 11px rgba(0,0,0,.5);
            border-radius: 20px;
        }

            .form.see {
                transition: .5s;
                background-position: 35px 550px,35px 700px;
             
            }

            .form.see2 {
                transition: .5s;
                background-position: 35px 700px,35px 550px;
             
            }

            .form > h2 {
                text-align: center;
                text-indent: 0;
            }

            .form > img {
                width: 90px;
                margin: 20px auto;
                border: 1px solid transparent;
                display: block;
                opacity: 0.7;
                border-radius: 20px;
            }

            .form > .items {
                transition: 0.3s;
                width: 80%;
                margin: 10px 10% 40px 10%;
                padding: 4px 0;
                border-radius: 3px;
                position: relative;
            }

                .form > .items.ramz {
                    margin-bottom: 0;
                }

                .form > .items > input[type="submit"] {
                    margin: 0;
                    border: 0 none;
                    border-bottom: 5px solid #5175d5;
                }

            .form > .forget:hover {
                transition: .3s;
                cursor: pointer;
            }

            .form > .forget {
                transition: .3s;
                color: blue;
                font-size: 14px;
                margin-right: 10%;
                margin-bottom: 20px;
                display: inline-block;
            }

        .cloud {
            position: absolute;
            z-index: -1;
            width: 200px;
            height: 170px;
            background: url("images/Micon/cloud.png") no-repeat;
            background-size: 200px;
            animation: animate 90s infinite alternate;
            top: 20%;
            right: 2%;
        }

        @keyframes animate {
            0% {
                top: 20%;
                right: 2%;
            }

            100% {
                top: 35%;
                right: 80%;
            }
        }

        .sun {
            position: absolute;
            z-index: -2;
            width: 200px;
            height: 200px;
            background: url("images/Micon/sun.png") no-repeat;
            background-size: 200px;
            animation: sunny 5s infinite alternate;
            top: 5%;
            left: 5%;
        }

        @keyframes sunny {
            0% {
                transform: scale(1) rotateZ(0);
            }

            100% {
                transform: scale(1.1) rotateZ(10deg);
            }
        }

         .plane {
            position: absolute;
            z-index: -2;
            width: 300px;
            height: 100px;
            background: url("images/Micon/plane.png") no-repeat;
            background-size: 300px;
            animation: fly 30s infinite ;
            top: 75%;
            left: -400px;
        }

        @keyframes fly {
            0% {
                top: 75%;
                left: -400px;
                
            }

            100% {
                top: 40%;
                left: 120%;
            }
        }
    </style>
</head>
<body>
    <form runat="server">

        <div class="cloud"></div>

        <div class="sun"></div>

            <div class="plane"></div>



        <div class="form">
            <h2>ثبت نام </h2>


            <img src="images/Micon/list.png" />


            <div id="error" runat="server"></div>

            <div class="items">
                <span class="title">آدرس ایمیل</span>
                <input type="text" id="sign_user" runat="server" placeholder="فارسی وارد شود ..." />
                <span class="error"></span>
            </div>

            <div class="items">
                <span class="title">رمز ورود </span>
                <input class="pass" type="password" id="sign_pass" runat="server" placeholder="حداقل 8 کاراکتر ..." />
                <span class="error"></span>
            </div>

            <div class="items">
                <span class="title">تکرار رمز ورود </span>
                <input class="pass" type="password" id="sign_repass" placeholder="تکرار رمز ورود ..." />
                <span class="error"></span>
            </div>

            <div class="items">
                <input type="submit" value="ثبت نام" runat="server" onserverclick="sign_click" />
            </div>


        </div>





    </form>

</body>
<script>

      $(".form > .items > .pass").focus(function () {
        $(".form").removeClass("see2").addClass("see");
    })

    $(".form > .items > .pass").focusout(function () {
        $(".form").removeClass("see");
    })


    $(".form > .items > #sign_user").focus(function () {
        $(".form").removeClass("see").addClass("see2");
    })

    $(".form > .items > #sign_user").focusout(function () {
        $(".form").removeClass("see2");
    })

</script>
</html>
