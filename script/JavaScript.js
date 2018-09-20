flag = 0;


timing();

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