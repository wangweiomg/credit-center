$(function () {
    $("#calendar").fullCalendar({
        locale: 'zh-cn',
        height: 450,
        defaultView: 'month',
        header: {
            left: 'title',
            center: 'month,agendaWeek,agendaDay,list'
        }, // buttons for switching between views
        events: [
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
        ]

    });
});

