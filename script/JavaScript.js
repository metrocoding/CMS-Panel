flag = 0;

$(document).ready(function () {


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
        $("#header").removeClass("res");
        $("#content>.holder>.center").removeClass("res");
        $("body").css({ padding: "0px 70px 0 0" });
        flag = 1;
    } else if (flag == 1) {
        $("#content>.holder>.right").removeClass("close");
        $("#header").addClass("res");
        $("#content>.holder>.center").addClass("res");
        $("body").css({ padding: "0px 315px 0 0" });
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
