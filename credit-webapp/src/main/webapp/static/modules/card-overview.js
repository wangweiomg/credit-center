$(function () {
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

