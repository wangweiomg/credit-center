
$(function () {

    var nowDate = moment().format('YYYY-MM-DD');
    $("#time").html(nowDate);
    $("h3").html(nowDate);

    $.get('/card/list', {"wxOpenId": 1}, function (data) {
        var tr = $("#cloneTr");
        $.each(data, function (index, card) {
            var cloneTr = tr.clone();
            cloneTr.append("<td>" + card.name + "</td>");
            var daysInMonth = moment().daysInMonth();
            for (var i = 1; i <= daysInMonth; i++) {
                var td = $("<td></td>");
                $(td).html(i);
                cloneTr.append(td);
            }


            var day = moment().format('D');
            cloneTr.find("td").eq(day).css("background-color", "lightgreen");

            var billDay = card.billDay;
            cloneTr.find("td").eq(billDay).css("background-color", "yellow");

            var repayDayType = card.repayDayType;
            var repayDayNum = card.repayDayNum;

            if (repayDayType === 1) {
                cloneTr.find("td").eq(repayDayNum).css("background-color", "red");
            }

            if (repayDayType === 2) {
                var num = (billDay + repayDayNum) % daysInMonth + 1;
                cloneTr.find("td").eq(num).css("background-color", "red");

            }
            cloneTr.insertBefore(tr);

        })

    });


});

