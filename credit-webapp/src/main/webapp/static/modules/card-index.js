var $table = $('#table');
$(function() {
    $(document).on('focus', 'input[type="text"]', function() {
        $(this).parent().find('label').addClass('active');
    }).on('blur', 'input[type="text"]', function() {
        if ($(this).val() === '') {
            $(this).parent().find('label').removeClass('active');
        }
    });
    // bootstrap table初始化
    // http://bootstrap-table.wenzhixin.net.cn/zh-cn/documentation/
    $table.bootstrapTable({
        // url: '/static/resources/data/data1.json',
        url: '/card/list',
        height: getHeight(),
        striped: true,
        search: true,
        searchOnEnterKey: true,
        showRefresh: true,
        showToggle: true,
        showColumns: true,
        minimumCountColumns: 2,
        showPaginationSwitch: true,
        clickToSelect: true,
        detailView: true,
        detailFormatter: 'detailFormatter',
        pagination: true,
        paginationLoop: false,
        classes: 'table table-hover table-no-bordered',
        //sidePagination: 'server',
        //silentSort: false,
        smartDisplay: false,
        idField: 'id',
        sortName: 'id',
        sortOrder: 'desc',
        escape: true,
        maintainSelected: true,
        toolbar: '#toolbar',
        columns: [
            {field: 'state', checkbox: true},
            {field: 'id', title: '编号', sortable: true, halign: 'center', visible: false},
            {field: 'name', title: '卡片名称', sortable: true, halign: 'center'},
            {field: 'cardNo', title: '卡号', sortable: true, halign: 'center'},
            {field: 'bankId', title: '所属银行', sortable: true, halign: 'center'},
            {field: 'cardType', title: '卡片类型', sortable: true, halign: 'center', visible: false},
            {field: 'cardLimit', title: '额度', sortable: true, halign: 'center'},
            {field: 'billDay', title: '账单日', sortable: true, halign: 'center'},
            {field: 'repayDayType', title: '还款日类型', sortable: true, halign: 'center'},
            {field: 'repayDayNum', title: '款款日记数', sortable: true, halign: 'center'},
            {field: 'status', title: '状态', sortable: true, halign: 'center'},
            {field: 'createBy', title: '创建人', halign: 'center', align: 'center'},
            {field: 'createAt', title: '创建时间', halign: 'center', align: 'center', formatter: 'formatDate'},
            {field: 'updateBy', title: '更新人', halign: 'center', align: 'center', visible: false},
            {field: 'updateAt', title: '更新时间', halign: 'center', align: 'center', formatter: 'formatDate', visible: false},
            {title: '操作', halign: 'center', align: 'center', formatter: 'actionFormatter', events: 'actionEvents', clickToSelect: false},
        ]
    }).on('all.bs.table', function (e, name, args) {
        $('[data-toggle="tooltip"]').tooltip();
        $('[data-toggle="popover"]').popover();
    });
});
function actionFormatter(value, row, index) {
    return [
        '<a class="like" href="javascript:void(0)" data-toggle="tooltip" title="Like"><i class="glyphicon glyphicon-heart"></i></a>　',
        '<a class="edit ml10" href="javascript:void(0)" data-toggle="tooltip" title="Edit"><i class="glyphicon glyphicon-edit"></i></a>　',
        '<a class="remove ml10" href="javascript:void(0)" data-toggle="tooltip" title="Remove"><i class="glyphicon glyphicon-remove"></i></a>'
    ].join('');
}

function formatDate(value, row, index) {
    return moment(value).format('YYYY-MM-DD HH:mm:ss');
}

window.actionEvents = {
    'click .like': function (e, value, row, index) {
        alert('You click like icon, row: ' + JSON.stringify(row));
        console.log(value, row, index);
    },
    'click .edit': function (e, value, row, index) {
        alert('You click edit icon, row: ' + JSON.stringify(row));
        console.log(value, row, index);
    },
    'click .remove': function (e, value, row, index) {
        alert('You click remove icon, row: ' + JSON.stringify(row));
        console.log(value, row, index);
    }
};
function detailFormatter(index, row) {
    var html = [];
    $.each(row, function (key, value) {
        html.push('<p><b>' + key + ':</b> ' + value + '</p>');
    });
    return html.join('');
}
// 新增
function createAction() {
    $.dialog({
        type: 'dark',
        animationSpeed: 300,
        title: '新增卡片',
        content: $('#createDialog').html(),
        buttons: {
            confirm: {
                text: '确认',
                // btnClass: 'waves-effect waves-button',
                // btnClass: 'btn-blue',
                action: function () {
                    // $.alert('确认');
                    var params = $("#createForm").serialize();
                    console.log(1, params);
                    var input1 = $("#input1").val();
                    var input2 = $("#input2").val();
                    var input3 = $("#input3").val();
                    var input4 = $("#input4").val();
                    var input5 = $("#input5").val();
                    console.log(2, input1, input2, input3, input4, input5);
                    var url = '/card/save';
                    $.post(url, params, function(data){
                        console.log(data);
                        $.alert("hello world!");
                    });

                }
            },
            cancel: {
                text: '取消',
                btnClass: 'waves-effect waves-button'
            }
        }
    });
}
// 编辑
function updateAction() {
    var rows = $table.bootstrapTable('getSelections');
    if (rows.length === 0) {
        $.confirm({
            title: false,
            content: '请至少选择一条记录！',
            autoClose: 'cancel|3000',
            backgroundDismiss: true,
            buttons: {
                cancel: {
                    text: '取消',
                    btnClass: 'waves-effect waves-button'
                }
            }
        });
    } else {
        $.confirm({
            type: 'blue',
            animationSpeed: 300,
            title: '编辑系统',
            content: $('#createDialog').html(),
            buttons: {
                confirm: {
                    text: '确认',
                    btnClass: 'waves-effect waves-button',
                    action: function () {
                        $.alert('确认' + $("#createForm").serialize());
                    }
                },
                cancel: {
                    text: '取消',
                    btnClass: 'waves-effect waves-button'
                }
            }
        });
    }
}
// 删除
function deleteAction() {
    var rows = $table.bootstrapTable('getSelections');
    if (rows.length === 0) {
        $.confirm({
            title: false,
            content: '请至少选择一条记录！',
            autoClose: 'cancel|3000',
            backgroundDismiss: true,
            buttons: {
                cancel: {
                    text: '取消',
                    btnClass: 'waves-effect waves-button'
                }
            }
        });
    } else {
        $.confirm({
            type: 'red',
            animationSpeed: 300,
            title: false,
            content: '确认删除该系统吗？',
            buttons: {
                confirm: {
                    text: '确认',
                    btnClass: 'waves-effect waves-button',
                    action: function () {
                        var ids = new Array();
                        for (var i in rows) {
                            ids.push(rows[i].systemId);
                        }
                        $.alert('删除：id=' + ids.join("-"));
                    }
                },
                cancel: {
                    text: '取消',
                    btnClass: 'waves-effect waves-button'
                }
            }
        });
    }
}