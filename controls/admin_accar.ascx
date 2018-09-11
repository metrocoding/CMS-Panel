<%@ Control Language="C#" AutoEventWireup="true" CodeFile="admin_accar.ascx.cs" Inherits="controls_admin_accar" %>


<div class="headright">
    <div class="menuswitch"></div>
</div>

<div class="proinfo">
    <img src="../../images/Micon/smi.jpg" /><h2 id="user_name" runat="server">آرمین اسلامی</h2><span id="admin_level"  runat="server">ادمین کل</span><div>پروفایل</div>
    <div>ویرایش</div>
    <div>تنظیمات</div>
</div>

<ul id="accardion">

    <li>

        <input type="radio" id="ch0" name="r">
        <label for="ch0">مدیریت اسلایدها </label>

        <div class="content">
            <a href="add_slide.aspx">افزودن آیتم </a>
            <a href="all_slides.aspx">مشاهده آیتم ها </a>
            <a href="all_slides.aspx">تغییر و حذف </a>
        </div>

    </li>
    <li>

        <input type="radio" id="ch1" name="r">
        <label for="ch1">مدیریت اخبار </label>

        <div class="content">
            <a href="#">افزودن آیتم </a>
            <a href="#">مشاهده آیتم ها </a>
            <a href="#">تغییر و حذف </a>
        </div>

    </li>

    <li>

        <input type="radio" id="ch2" name="r">
        <label for="ch2">مدیریت محصولات</label>

        <div class="content">
            <a href="#">افزودن آیتم </a>
            <a href="#">مشاهده آیتم ها </a>
            <a href="#">تغییر و حذف </a>
        </div>

    </li>

    <li>

        <input type="radio" id="ch3" name="r">
        <label for="ch3">مدیریت تبلیغات</label>

        <div class="content">
            <a href="#">افزودن آیتم </a>
            <a href="#">مشاهده آیتم ها </a>
            <a href="#">تغییر و حذف </a>
        </div>

    </li>

    <li>

        <input type="radio" id="ch4" name="r">
        <label for="ch4">مدیریت کاربران</label>

        <div class="content">
            <a href="#">افزودن آیتم </a>
            <a href="#">مشاهده آیتم ها </a>
            <a href="#">تغییر و حذف </a>
        </div>

    </li>
</ul>
