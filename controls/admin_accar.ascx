﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="admin_accar.ascx.cs" Inherits="controls_admin_accar" %>




<div class="proinfo">
    <img id="user_avatar" runat="server" src="../../images/Micon/smi.jpg" /><h2 id="user_name" runat="server">فاطمه رادمنش</h2>
    <span id="admin_level" runat="server">ادمین کل</span><div>پروفایل<i class="material-icons">account_box</i></div>
    <div>ویرایش<i class="material-icons">edit</i></div>
    <div>تنظیمات<i class="material-icons">settings</i></div>

</div>

<ul id="accardion">

    <li>

        <input type="radio" id="ch0" name="rara">
        <label for="ch0">
            مدیریت اسلایدها 
            <i class="material-icons ">layers</i>
        </label>

        <div class="content">
            <a runat="server" href="~/admin/slide/add_slide.aspx">افزودن  </a>
            <a runat="server" href="~/admin/slide/all_slides.aspx">مشاهده  </a>
        </div>

    </li>
    <li>

        <input type="radio" id="ch1" name="rara">
        <label for="ch1">
            مدیریت اخبار 
            <i class="material-icons">chrome_reader_mode</i>
        </label>

        <div class="content">
            <a href="#">افزودن  </a>
            <a href="#">مشاهده  </a>
            <a href="#">ویرایش </a>
        </div>

    </li>

    <li>

        <input type="radio" id="ch2" name="rara">
        <label for="ch2">
            مدیریت محصولات
            <i class="material-icons">shopping_cart</i>
        </label>

        <div class="content">
            <a href="#">افزودن  </a>
            <a href="#">مشاهده  </a>
            <a href="#">ویرایش </a>
        </div>

    </li>

    <li>

        <input type="radio" id="ch3" name="rara">
        <label for="ch3">
            مدیریت تبلیغات
            <i class="material-icons">contact_phone</i>
        </label>

        <div class="content">
            <a href="#">افزودن  </a>
            <a href="#">مشاهده  </a>
            <a href="#">ویرایش </a>
        </div>

    </li>

    <li>

        <input type="radio" id="ch4" name="rara">
        <label for="ch4">
            مدیریت کاربران
            <i class="material-icons">supervisor_account</i>
        </label>

        <div class="content">
            <a href="#">افزودن  </a>
            <a href="#">مشاهده  </a>
            <a href="#">ویرایش </a>
        </div>

    </li>
</ul>





