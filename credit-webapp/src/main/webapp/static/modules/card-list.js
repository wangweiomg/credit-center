var appData = {
    cardList: []
}


function initUserSelect() {
    var url = '/user/list';
    $.get(url, function (res) {
        var sel = $("#userSelect");
        sel.empty();
        sel.append("<option value='0'>全部</option>");
        $.each(res, function (idx, item) {
            var opt = new Option();
            opt.text = item.nickName;
            opt.value = item.id;
            sel.append(opt);

        });
    });
}

function changeSelect() {

    var userId = $("#userSelect :selected").val();
    var list = appData.cardList;
    var result = [];
    if (userId === '0') {
        result = list;
    } else {
        for (var i = 0; i < list.length; i++) {
            if (list[i].userId == userId) {
                result.push(list[i]);
            }

        }
    }


    initTable(result);
}

function initTable(cardList) {
    // first clear
    $(".showTr").remove();


    var tr = $(".cloneTr.hidden");
    $.each(cardList, function (index, card) {
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

            // 如果当前日在账单日前，就还在上个账单周期，找出上个账单日，计算还款日
            // 如果当前日在账单日后，就在新的账单周期，找出本次账单日，计算还款日

            let num = 0;
            if ((day - 0) <= (billDay - 0)) {

                num = moment().subtract(1, 'M').date(billDay).add(repayDayNum, 'days').format('D')
            } else {

                num = moment().date(billDay).add(repayDayNum, 'days').format('D')

            }

            cloneTr.find("td").eq(num).css("background-color", "red");

        }
        cloneTr.removeClass("hidden");
        cloneTr.addClass("showTr");
        cloneTr.insertBefore(tr);

    })
}

$(function () {

    initUserSelect();



    var nowDate = moment().format('YYYY-MM-DD');
    $("#time").html(nowDate);
    $("h3").html(nowDate);

    $.get('/card/findAll', function (data) {
        data.sort((a, b) => a.billDay - b.billDay);
        appData.cardList = data;
        initTable(data);
    });


});

