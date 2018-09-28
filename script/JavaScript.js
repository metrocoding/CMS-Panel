flag = 0;

$(document).ready(function () {

    backright();
    timing();

})







// Clock=====================================================================
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



//PANEL SWITCH================================================================
$(".headright > .menuswitch").click(function () {

    if (flag == 0) {
        $("#content>.holder>.right").addClass("close");
        $(".header").removeClass("res");
        $("#content>.holder>.center").removeClass("res");
        $(".head > .headright").css({ width: "70px" });
        $(".head > .headright > .menuswitch").addClass("close");
        $("body").css({ padding: "60px 70px 0 0" });
        flag = 1;
    } else if (flag == 1) {
        $("#content>.holder>.right").removeClass("close");
        $(".header").addClass("res");
        $("#content>.holder>.center").addClass("res");
        $(".head > .headright").css({ width: "315px" });
        $(".head > .headright > .menuswitch").removeClass("close");
        $("body").css({ padding: "60px 315px 0 0" });
        flag = 0;
    }
})



//SPAN MOVER===================================================================
$(".grid").on("mouseover", ".items.slidegrid > li:nth-child(2)", function () {
    span = $("span", this).width();
    li = $(this).width();

    if (span > li) {
        dif = span - li;
        $("span", this).playKeyframe({
            name: 'move',
            duration: '10s',
            iterationCount: 'infinite',
        });
    } else {
        dif = 0;
    }


    $.keyframe.define([{
        name: 'move',
        '0%': { 'transform': 'translateX(0)' },
        '5%': { 'transform': 'translateX(0)' },
        '90%': { 'transform': 'translateX(' + dif + 'px)' },
        '100%': { 'transform': 'translateX(' + dif + 'px)' },
    }]);

})

$(".grid").on("mouseleave", ".items.slidegrid > li:nth-child(2)", function () {
    $(".grid>.items.slidegrid > li:nth-child(2)>span").css({ animation: '0' });
})


//background right===========================================
$("#content > .holder > .right").on("resize", backright());


function backright() {
    hi = $("#content > .holder > .right").height();
    //$("#content > .holder > .right").css({ "background-position": "0 " + hi + "px" });
}