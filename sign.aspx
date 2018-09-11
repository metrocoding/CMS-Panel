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
</head>
<body>
    <form runat="server">

        <div id="header"></div>
        <div id="content">

            <div class="holder">



                <div class="center">
                    <div class="form">
                        <h2> ثبت نام </h2>

                        <img src="images/Micon/sign.png" />

                        <div id="error" runat="server">فرم ثبت نام </div>

                        <div class="items">
                            <span class="title">آدرس ایمیل</span>
                            <input type="text" id="sign_user" runat="server" placeholder="فارسی وارد شود ..." />
                            <span class="error"></span>
                        </div>

                         <div class="items">
                            <span class="title">رمز ورود </span>
                            <input type="password" id="sign_pass" runat="server" placeholder="حداقل 8 کاراکتر ..." />
                            <span class="error"></span>
                        </div>       
                        
                         <div class="items">
                            <span class="title">تکرار رمز ورود </span>
                            <input type="password" id="sign_repass" placeholder="تکرار رمز ورود ..." />
                            <span class="error"></span>
                        </div>                                          

                         <div class="items">
                            <input type="submit" value="ثبت نام" runat="server"/>
                        </div>


                    </div>


                </div>
            </div>

        </div>

        <div id="footer"></div>


    </form>

</body>
</html>
