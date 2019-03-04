$(function () {

    initUserSelect();


    $("#calendar").fullCalendar({
        locale: 'zh-cn',
        height: 500,
        showNonCurrentDates: false,
        defaultView: 'month',
        footer: true,
        header: {
            left: 'title',
            // center: 'month,agendaWeek,agendaDay,list',
            center: '',
            right: ''
        }, // buttons for switching between views
        /*events: [
            {
                title: '刷A',
                start: '2018-09-25T13:13:55.008',
                end: '2018-09-25T19:13:55.008'
            },
            {
                title: '刷B',
                start: '2018-09-28T13:13:55-0400',
                end: '2018-09-28T17:13:55-0400'
            }
        ]*/
        events: function (start, end, timezone, callback) {

            console.log(11, start,  start.unix(), moment(start.unix()).format('YYYY-MM-DD HH:mm:ss'));
            console.log(22, end,  end.unix(), moment(end.unix()).format('YYYY-MM-DD HH:mm:ss'));
            console.log(33, timezone);
            var url = '/card/overview';
            $.get(url, function (data) {
                callback(data);
            });
        },


    });
});


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

    /*var userId = $("#userSelect :selected").val();
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


    initTable(result);*/
}

