<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1,,maximum-scale=1,user-scalable=no">
    <!--上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！-->
    <title>催收</title>
    <meta name="keywords" content="#">
    <meta name="description" content="#">
    <meta name="author" content="#">
    <link rel="stylesheet" href="${ctxStatic}/public/libs/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/public/libs/bootstrap/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="${ctxStatic}/public/css/style-main.min.css"><!--[if lt IE 9]>
    <script src="/libs/html5shiv.min.js"></script>
    <![endif]-->
</head>
<script src="${ctxStatic}/public/libs/jquery-1.9.1.min.js"></script>
<script src="${ctxStatic}/public/libs/bootstrap/js/bootstrap.min.js"></script>
<!-- build:js -->
<script src="${ctxStatic}/public/js/base.js"></script>
<script src="${ctxStatic}/public/js/list.js"></script>
<!-- endbuild -->
<body>
<ul id="nav-tabs" class="nav nav-tabs">
     <li><a onclick="showInfo('${ctx}urge/list');" data-toggle="tab">催收列表</a></li>
     <li class="active"><a onclick="showInfo('${ctx}urge/history?id=${id }');" data-toggle="tab">催收历史</a></li>
</ul>
<div id="tab-content" class="tab-content">
    <div id="home" class="tab-pane fade active in">
    	<div style="padding-top: 10px;"></div>
        <table class="table table-bordered table-striped">
            <thead>
            <tr>
                <th>催收次数</th>
                <th>催收方式</th>
                <th>催收人</th>
                <th>催收时间</th>
                <th>催收过程</th>
                <th>催收结果</th>
                <th>催收金额</th>
                <th>催收结果描述</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${result.paging.list}" var="urge" varStatus="status">
                <tr>
                    <th scope="row">第${status.index + 1}次</th>
                    <td><a href="javascript:;" class="add-tab">${urge.urgeType}</a></td>
                    <td>${urge.urgePerson}</td>
                    <td><fmt:formatDate value="${urge.urgeTime}" type="date"/></td>
                    <td>${urge.urgeProcess}</td>
                    <td>${urge.urgeResult}</td>
                    <td>${urge.urgeAmt}</td>
                    <td>${urge.urgeResultDescrpt}</td>
                </tr>

            </c:forEach>

            </tbody>
        </table>
    </div>    
</div>
</body>
</html>
<script type="text/javascript">
function showInfo(url){
	window.location=url;
}
</script>
