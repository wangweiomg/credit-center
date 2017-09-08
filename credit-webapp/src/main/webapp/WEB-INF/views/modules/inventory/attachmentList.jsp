<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1,,maximum-scale=1,user-scalable=no">
<!--上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！-->
<title>人工盘库</title>
<meta name="keywords" content="#">
<meta name="description" content="#">
<meta name="author" content="#">
<link rel="stylesheet"
	href="${ctxStatic}/public/libs/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${ctxStatic}/public/libs/bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${ctxStatic}/public/css/style-main.min.css">
<!--[if lt IE 9]>
    <script src="/libs/html5shiv.min.js"></script>
    <![endif]-->
</head>
<body>
	<c:forEach items="${result}" var="attachment" varStatus="status">
		<table>
			<tr>
				<td scope="row">${status.index + 1}</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>
				<form id="viewPic" action="${ctx}inventory/viewAttachs.do">
					<a href="${attachment.attachStoreAddr }" target="_blank">${attachment.attachName}</a>
				</form>
				</td>
			</tr>
		</table>
	</c:forEach>
</body>
</html>
<script src="${ctxStatic}/public/libs/jquery-1.9.1.min.js"></script>
<script src="${ctxStatic}/public/libs/bootstrap/js/bootstrap.min.js"></script>
<!-- build:js -->
<script src="${ctxStatic}/public/js/base.js"></script>
<script src="${ctxStatic}/public/js/list.js"></script>
<script type="text/javascript" src="${ctxStatic}/My97DatePicker/WdatePicker.js"></script>
<!-- endbuild -->