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
<body>
<ul id="nav-tabs" class="nav nav-tabs">
     <li class="active"><a onclick="showInfo('${ctx}urge/list');" data-toggle="tab">催收列表</a></li>
</ul>
<div id="tab-content" class="tab-content">
    <div id="home" class="tab-pane fade active in">
    	<div class="alert alert-danger">
            <form id="serchForm" action="${ctx}urge/list"  class="form-inline" >
            <input type="hidden" id="pageNum" name="pageNum" value="${result.paging.pageNum }">
                <div class="form-group">
                    <input name="" value="" type="text" class="form-control" placeholder="经销商名称 ">
                </div>
                <div class="form-group">
                   <input name="" value="" type="text" class="form-control" placeholder="合同编号">
                </div>
                <div class="form-group">
                    <select name="" class="form-control">
                        <option value="">请选则状态</option>
                        <option value="">催收中</option>
                        <option value="">正常还款</option>
                        <option value="">处置还款</option>
                    </select>
                </div>
                <button id="serchButton" type="submit" class="btn btn-primary">查询</button>
            </form>
        </div>
        <table class="table table-bordered table-striped">
            <thead>
            <tr>
                <th width="40" class="text-center bg-primary dropdown"><a href="javascript:;" id="custom-dropdown" class="ico ico-menu"></a>
                    <ul id="custom-menu" class="dropdown-menu">
                        <li class="title"><a href="javascript:;">自定义列表</a></li>
                        <li class="checkbox"><a href="javascript:;">
                            <label style="display:none">
                                <input type="checkbox" checked>融资编号
                            </label></a><a href="javascript:;">
                            <label>
                                <input type="checkbox" checked>经销商
                            </label></a><a href="javascript:;">
                            <label>
                                <input type="checkbox" checked>经销商电话
                            </label></a><a href="javascript:;">
                            <label>
                                <input type="checkbox" checked>产品类型
                            </label></a><a href="javascript:;">
                            <label>
                                <input type="checkbox" checked>贷款周期
                            </label></a><a href="javascript:;">
                            <label>
                                <input type="checkbox" checked>利率
                            </label></a><a href="javascript:;">
                            <label>
                                <input type="checkbox" checked>贷款车辆数
                            </label></a><a href="javascript:;">
                            <label>
                                <input type="checkbox" checked>车辆评估价（万元）
                            </label></a><a href="javascript:;">
                            <label>
                                <input type="checkbox" checked>合同金额（万元）
                            </label></a><a href="javascript:;">
                            <label>
                                <input type="checkbox" checked>当期应还款金额（元）
                            </label></a><a href="javascript:;">
                            <label>
                                <input type="checkbox" checked>当期逾期罚息（元）
                            </label></a><a href="javascript:;">
                            <label>
                                <input type="checkbox" checked>当期还款时间
                            </label></a><a href="javascript:;">
                            <label>
                                <input type="checkbox" checked>逾期天数
                            </label></a><a href="javascript:;">
                            <label>
                                <input type="checkbox" checked>当期已还金额（元）
                            </label></a></li>
                        <li class="divider"></li>
                        <li class="footer text-center">
                            <button class="btn btn-primary">确定</button>
                            <button class="btn btn-info">取消</button>
                        </li>
                    </ul>
                </th>
                <th>融资编号</th>
                <th>经销商</th>
                <th>经销商电话</th>
                <th>产品类型</th>
                <th>贷款周期</th>
                <th>利率</th>
                <th>贷款车辆数</th>
                <th>车辆评估价（万元）</th>
                <th>合同金额（万元）</th>
                <th>当期应还款金额（元）</th>
                <th>当期逾期罚息（元）</th>
                <th>当期还款时间</th>
                <th>逾期天数</th>
                <th>当期已还金额（元）</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${result.paging.list}" var="urge" varStatus="status">
                <tr>
                    <th scope="row">${status.index + 1}</th>
                    <td><a href="javascript:;">${urge.loanNo}</a></td>
                    <td>${urge.custName}</td>
                    <td>${urge.custTel}</td>
                    <td>${urge.prodName}</td>
                    <td>${urge.loanPeriod}</td>
                    <td><fmt:formatNumber type="percent">${urge.rate}</fmt:formatNumber></td>
                    <td>${urge.loanCarCount}</td>
                    <td>${urge.carEvalAmt}</td>
                    <td>${urge.contractAmt}</td>
                    <td>${urge.expectAmt}</td>
                    <td>${urge.penalty}</td>
                    <td><fmt:formatDate value="${urge.repaymentTime}" type="date"/></td>
                    <td>${urge.overDays}</td>
                    <td>${urge.actualAmt}</td>
                    <td>
                    <a href="#" onclick="showInfo('${ctx}urge/history?id=${urge.tid }');;">催收历史</a>
                    <a href="#" onclick="showInfo('${ctx}urge/add?id=${urge.tid }&loanNo=${urge.loanNo}');;">新建催收</a>
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
$(function(){
	var type="${type}";
	var message = "${message}";
	if("Y"==type){
		layer.msg(message);
	}
});
function gotoPage(pageNum){
	$("#pageNum").val(pageNum);
	$("#serchButton").click();
}
</script>
