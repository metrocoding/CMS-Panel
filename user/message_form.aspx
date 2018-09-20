<%@ Page Language="C#" AutoEventWireup="true" CodeFile="message_form.aspx.cs" Inherits="user_message_form" %>

<%@ Register Src="~/controls/admin_accar.ascx" TagPrefix="uc1" TagName="admin_accar" %>
<%@ Register Src="~/controls/Header.ascx" TagPrefix="uc1" TagName="Header" %>



<!DOCTYPE html>

<html>
<head>
    <title>ارسال پیام</title>
    <link href="../../style/fonts.css" rel="stylesheet" />
    <link href="../../style/base.css" rel="stylesheet" />
    <link href="../../style/2 panel.css" rel="stylesheet" />
    <link href="../../style/form.css" rel="stylesheet" />
    <link href="../../style/header.css" rel="stylesheet" />
    <link href="../../style/accardion.css" rel="stylesheet" />
    <script src="../script/jquery.js"></script>

</head>
<body>

    <form runat="server">

        <div id="header">
            <uc1:Header runat="server" ID="Header1" />
        </div>

        <div id="content">

            <div class="holder">

                <div class="right">
                    <uc1:admin_accar runat="server" ID="admin_accar" />
                </div>

                <div class="center">
                    <div class="form">
                        <h2>ارسال پیام</h2>

                        <div id="error" runat="server"> پیام شخصی</div>

                        <div class="items item14">
                            <span class="title">ارسال به</span>
                            <input type="text" id="mes_contact" runat="server" placeholder="نام کاربری گیرنده ..." autocomplete="off"/>
                            <span class="error"></span>
                        </div>

                        <div class="items item15">
                            <span class="title">عنوان پیام</span>
                            <input type="text" id="mes_title" runat="server" placeholder="موضوع پیام ..." autocomplete="off"/>
                            <span class="error"></span>
                        </div>

                        <div class="items item16">
                            <span class="title">اهمیت</span>
                            <select id="mes_prio" runat="server">
                                <option>خیلی مهم</option>
                                <option>مهم</option>
                                <option>کم اهمیت</option>
                                <option>بی اهمیت</option>
                            </select>
                        </div>

                        <div class="items item17">
                            <span class="title">ارسال فایل</span>
                            <input type="file" id="mes_attach" runat="server" />
                            <label for="mes_attach">آپلود فایل</label>
                        </div>

                        <div class="items item7">
                            <span class="title tt2">متن پیام </span>
                            <textarea id="mes_body" runat="server">  </textarea>
                        </div>

                        <div class="items item8">
                            <input type="submit" value="ارسال" runat="server" onserverclick="send_mes"/>
                            <input type="submit" value="پاک کردن" runat="server"  onserverclick="clear_form"/>
                        </div>


                    </div>


                </div>
            </div>
            <div id="time"></div>
        </div>



    </form>

</body>
  
<script src="../script/JavaScript.js"></script>
</html>

