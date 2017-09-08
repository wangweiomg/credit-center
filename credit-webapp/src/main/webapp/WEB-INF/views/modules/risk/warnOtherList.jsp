<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1,,maximum-scale=1,user-scalable=no">
    <!--上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！-->
    <title>预警</title>
    <meta name="keywords" content="#">
    <meta name="description" content="#">
    <meta name="author" content="#">
    <link rel="stylesheet" href="${ctxStatic}/public/libs/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/public/libs/bootstrap/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="${ctxStatic}/public/css/style-main.min.css"><!--[if lt IE 9]>
    <script src="/libs/html5shiv.min.js"></script>
    <![endif]-->
</head>
<body>
<ul id="nav-tabs" class="nav nav-tabs">
     <li><a onclick="showInfo('${ctx}warn/loanlist');" data-toggle="tab"> 结清预警</a></li>
     <li><a onclick="showInfo('${ctx}warn/carlist');" data-toggle="tab">合格证到期预警</a></li>
     <li class="active"><a onclick="showInfo('${ctx}warn/otherlist');" data-toggle="tab">其他预警</a></li>
     <li><a onclick="showInfo('${ctx}warn/repaylist');" data-toggle="tab">逾期预警</a></li>
     <li><a onclick="showInfo('${ctx}warn/add');" data-toggle="tab">新增预警</a></li>
</ul>
<div id="tab-content" class="tab-content">
    <div id="home" class="tab-pane fade active in">
    	<div class="alert alert-danger">
            <form id="serchForm" action="${ctx}warn/otherlist"  class="form-inline" >
            <input type="hidden" id="pageNum" name="pageNum" value="${result.paging.pageNum }">
                <div class="form-group">
                    <select name="custCode" class="form-control">
                        <option value="">请选则经销商</option>
                        <c:forEach items="${fns:getOtherCust()}" var="othermap" varStatus="status">
				        <option <c:if test="${custCode == othermap.custCode }" >selected="selected" </c:if>  value="${othermap.custCode }">${othermap.custName }</option>
				        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <input name="carriageCode" value="${carriageCode }" type="text" class="form-control" placeholder="车架号">
                </div>
                <div class="form-group">
                    <select name="subId" class="form-control">
                        <option value="">请选预警提交人</option>
                        <c:forEach items="${fns:getOtherUser()}" var="usermap" varStatus="status">
				        <option <c:if test="${subId == usermap.userId }" >selected="selected" </c:if>  value="${usermap.userId }">${usermap.userName }</option>
				        </c:forEach>
                    </select>
                </div>
                <button id="serchButton" type="button" onclick="serchInfo();" class="btn btn-primary">查询</button>
            </form>
        </div>
        <table class="table table-bordered table-striped">
            <thead>
            <tr>
                <th width="40" class="text-center bg-primary dropdown"><a href="javascript:;" id="custom-dropdown" class="ico ico-menu"></a>
                    <ul id="custom-menu" class="dropdown-menu">
                        <li class="title"><a href="javascript:;">自定义列表</a></li>
                        <li class="checkbox"><a href="javascript:;">
                            <label>
                                <input type="checkbox" checked>预警ID
                            </label></a><a href="javascript:;">
                            <label>
                                <input type="checkbox" checked>预警对象
                            </label></a><a href="javascript:;">
                            <label>
                                <input type="checkbox" checked>车架号/经销商
                            </label></a><a href="javascript:;">
                            <label>
                                <input type="checkbox" checked>预警描述
                            </label></a><a href="javascript:;">
                            <label>
                                <input type="checkbox" checked>状态
                            </label></a></li>
                        <li class="divider"></li>
                        <li class="footer text-center">
                            <button class="btn btn-primary">确定</button>
                            <button class="btn btn-info">取消</button>
                        </li>
                    </ul>
                </th>
                <th>预警ID</th>
                <th>预警对象</th>
                <th>车架号/经销商</th>
                <th>预警描述</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${result.paging.list}" var="warn" varStatus="status">
                <tr>
                    <th scope="row">${status.index + 1}</th>
                    <td>${warn.tid}</a></td>
                    <td>${warn.objId}</td>
                    <td><a href="javascript:;">${warn.objName}</a></td>
                    <td>${warn.warnDescrpt}</td>
                    <td name="statuShow">${warn.status}</td>
                    <td>
                    <c:if test="${warn.status == 1}">
                    <a href="#" onclick="upStatus(this,${warn.tid});">解除预警</a>
                    </c:if>
                    </td>
                </tr>

            </c:forEach>

            </tbody>
        </table>
        <nav>
            <ul class="pagination">
                <li><a href="####" onclick="gotoPage('1');">首页</a></li>
                <c:if test="${result.paging.pageNum > 1}">
                    <li><a href="####" onclick="gotoPage('${result.paging.pageNum - 1}');" aria-label="Previous">&laquo;</a></li>
                    <li><a href="####" onclick="gotoPage('${result.paging.pageNum - 1}');">${result.paging.pageNum - 1}</a></li>
                </c:if>
                <li class="active"><a href="javascript:;">${result.paging.pageNum}</a></li>

                <c:if test="${result.paging.pageNum + 1 <= result.paging.pageCount}">
                    <li><a href="####" onclick="gotoPage('${result.paging.pageNum + 1}');">${result.paging.pageNum + 1}</a></li>
                    <li><a href="####" onclick="gotoPage('${result.paging.pageNum + 1}');" aria-label="Next">&raquo;</a></li>
                </c:if>
                <li><a href="####" onclick="gotoPage('${result.paging.pageCount}');">最后一页</a></li>
            </ul><span style="line-height:34px;"> &emsp;共${result.paging.pageCount}页</span>
        </nav>
    </div>    
</div>
</body>
</html>
<script src="${ctxStatic}/public/libs/jquery-1.9.1.min.js"></script>
<script src="${ctxStatic}/public/libs/bootstrap/js/bootstrap.min.js"></script>
<!-- build:js -->
<script src="${ctxStatic}/public/js/base.js"></script>
<script src="${ctxStatic}/public/js/list.js"></script>
<script src="${ctxStatic}/layer/layer.js"></script>
<!-- endbuild -->
<script type="text/javascript">
function showInfo(url){
	window.location=url;
}
function upStatus(ele,id){
	
	layer.confirm('确认解除预警？', {shade: false,
		  btn: ['确认','取消'] //按钮
		}, function(){			
			$.ajax({
				type:"POST",
				dataType:"json",
				async:false,
				url:"${ctx}warn/upstatus/"+id ,
				success:function(data){
					if(data.type=="S"){
						$(ele).parent("td").parent("tr").find("[name='statuShow']").html("已解除");
						$(ele).parent("td").html("");
					}
				}
			});
			layer.closeAll('dialog');
		}, function(){
			layer.closeAll('dialog');
		});
}
function gotoPage(pageNum){
	$("#pageNum").val(pageNum);
	$("#serchForm").submit();
}
function serchInfo(){
	$("#pageNum").val(1);
	$("#serchForm").submit();
}
</script>