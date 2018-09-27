<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Header.ascx.cs" Inherits="controls_Header" %>


<div>
    <input name="search_box" type="text" id="search_box" placeholder="جستوجو..." autocomplete="off" />
    <i class="material-icons searchicon">search</i>
</div>

<ul class="leftmenu">
    

  

    <li>
        <i class="material-icons">apps</i>
    </li>


     <li class="pic">
        <img src="../../images/Micon/smi2.jpg" id="asdf" style="width: 100%; border-radius: 100%;" />
    
        <div class="message pic">
            <div>پروفایل</div>
            <div>تنظیمات</div>
            <div>خروج</div>
        </div>

    </li>


    <li id="mes">
        <i class="material-icons">email</i>
        <div class="message">
            <div class="small">
                پیام ها
                <span>13</span>
            </div>

            <div class="big">
                <img src="../../images/Micon/avatari.png" />
                <h1 class="name">حسن معین</h1>
                <span class="mestext">چطوری یا نه؟ خرید...</span>
                <span class="time">54 دقیقه قبل</span>
            </div>

            <div class="big">
                <img src="../../images/Micon/avatari.png" />
                <h1 class="name">رستم حقی</h1>
                <span class="mestext">فردا روز بزرگیه برا...</span>
                <span class="time">15 ساعت قبل</span>
            </div>

            <div class="big">
                <img src="../../images/Micon/avatari.png" />
                <h1 class="name">حسین نادری</h1>
                <span class="mestext">بانک خون فردا 300 واحد...</span>
                <span class="time">3روز قبل</span>
            </div>

            <div class="allmes">مشاهده همه ی پیام ها</div>
        </div>
        <div class="notif" id="notifmes"></div>
    </li>


    

    <li>
        <i class="material-icons">notifications</i>
         <div class="message">
            <div class="small">
                اعلان ها
                <span>6</span>
            </div>

            <div class="big">
                <img src="../../images/Micon/newuser.png" />
                <h1>کاربر جدید</h1>
                <span class="time">54 دقیقه قبل</span>
            </div>

            <div class="big">
                <img src="../../images/Micon/like.png" />
                <h1>الهام نظرتان را پسندید </h1>
                <span class="time">15 ساعت قبل</span>
            </div>

            <div class="big">
                <img src="../../images/Micon/com.png" />
                <h1>کامنت از طرف هوتن </h1>
                <span class="time">3روز قبل</span>
            </div>

            <div class="allmes">مشاهده همه ی اعلان ها</div>
        </div>
        <div class="notif" id="notif"></div>
    </li>


     

</ul>


