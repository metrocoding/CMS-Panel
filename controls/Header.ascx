<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Header.ascx.cs" Inherits="controls_Header" %>


<div>
    <input name="search_box" type="text" id="search_box" placeholder="جستوجو..." autocomplete="off" />
    <i class="material-icons searchicon">search</i>
</div>

<ul class="leftmenu">
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

    <li class="pic">
        <img src="../../images/Micon/smi2.jpg" id="asdf" style="width: 100%; border-radius: 100%;" />
    
        <div class="message pic">
            <div>پروفایل</div>
            <div>تنظیمات</div>
            <div>خروج</div>
        </div>

    </li>

    <li>
        <i class="material-icons">apps</i>
    </li>

</ul>


<script>
    flag = 0;



setInterval("timing()", 1000);

function timing() {
    var d = new Date();
    var h = d.getHours();
    if (h < 10) {
        h = "0" + h
    }
    var m = d.getMinutes();
    if (m < 10) {
        m = "0" + m
    }
    var time = h + " : " + m;

    $("#time").html(time);
}

$(".headright > .menuswitch").click(function () {

    if (flag == 0) {
        $("#content>.holder>.right").addClass("close");
        $("#header").removeClass("res");
        $("#content>.holder>.center").removeClass("res");
        $("body").css({ padding: "60px 70px 0 0" });
        flag = 1;
    } else if (flag == 1) {
        $("#content>.holder>.right").removeClass("close");
        $("#header").addClass("res");
        $("#content>.holder>.center").addClass("res");
        $("body").css({ padding: "60px 315px 0 0" });
        flag = 0;
    }
})
</script>