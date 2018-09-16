<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1,,maximum-scale=1,user-scalable=no">
    <!--上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！-->
    <title>这是标题</title>
    <meta name="keywords" content="#">
    <meta name="description" content="#">
    <meta name="author" content="#">
    <link rel="stylesheet" href="${ctxStatic}/css/plugins/bootstrap-table/bootstrap-table.min.css">
    <link rel="stylesheet" href="${ctxStatic}/public/libs/bootstrap/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="${ctxStatic}/public/css/style-main.min.css">
    <!--[if lt IE 9]>

    <script src="/libs/html5shiv.min.js"></script>


    <![endif]-->

</head>
<body>
<div id="tab-content" class="tab-content">

    <table class="table table-bordered" id="dataTable"></table>

</div>
<script src="/static/jquery/jquery-1.9.1.js"></script>
<script src="/static/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script type="text/javascript">
    $("#dataTable").bootstrapTable({
        columns: [{
            field: 'id',
            title: 'Item ID'
        }, {
            field: 'name',
            title: 'Item Name'
        }, {
            field: 'price',
            title: 'Item Price'
        }],
        data: [{
            id: 1,
            name: 'Item 1',
            price: '$1'
        }, {
            id: 2,
            name: 'Item 2',
            price: '$2'
        }]
    });
</script>
</body>
</html>


