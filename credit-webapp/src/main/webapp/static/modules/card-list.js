
$(function () {

    $.get('/card/list', function (data) {
        var tr = $("#cloneTr");
        $.each(data, function (index, card) {
            var cloneTr = tr.clone();
            cloneTr.append("<td>" + card.name + "</td>");
            for (var i = 1; i < 32; i++) {
                // var td = "<td>" + i + "</td>";

                var td = $("<td></td>");
                $(td).html(i);
                // $(td).css("background-color", "pink");
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
                var num = (billDay + repayDayNum) % 32;
                cloneTr.find("td").eq(num).css("background-color", "red");

            }
            cloneTr.insertBefore(tr);

        })

    });


});

