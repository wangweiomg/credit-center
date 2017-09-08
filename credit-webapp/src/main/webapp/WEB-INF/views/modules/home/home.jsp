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
     <li class="active"><a href="#pending" data-toggle="tab"> 待办事项</a></li>
     <li><a href="#already" data-toggle="tab">已办事项</a></li>
</ul>
<div id="tab-content" class="tab-content">
    <div id="pending" class="tab-pane fade active in">
    	<div style="padding-top: 10px;"></div>
        <table class="table table-bordered table-striped">
            <thead>
            <tr>
                <th></th>
                <th>任务</th>
                <th>产品类型</th>
                <th>提交时间</th>
                <th>提交人</th>
            </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>放款审核</td>
                    <td>活期</td>
                    <td>2017-07-11</td>
                    <td>徐龙</td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>放款审核</td>
                    <td>活期</td>
                    <td>2017-07-11</td>
                    <td>徐龙</td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td>放款审核</td>
                    <td>活期</td>
                    <td>2017-07-11</td>
                    <td>徐龙</td>
                </tr>
            </tbody>
        </table>
        <nav>
            <ul class="pagination">
                <li><a href="####" onclick="gotoPage('1');">首页</a></li>
                <c:if test="${result.paging.pageNum > 1}">
                    <li><a href="####" onclick="gotoPage('');" aria-label="Previous">&laquo;</a></li>
                    <li><a href="####" onclick="gotoPage('');">${result.paging.pageNum - 1}</a></li>
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
    <div id="already" class="tab-pane fade">
    	<div style="padding-top: 10px;"></div>
        <table class="table table-bordered table-striped">
            <thead>
            <tr>
                <th></th>
                <th>任务</th>
                <th>产品类型</th>
                <th>提交时间</th>
                <th>提交人</th>
                <th>处理时间</th>
            </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>放款审核</td>
                    <td>活期</td>
                    <td>2017-07-11</td>
                    <td>徐龙</td>
                    <td>2017-07-11</td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>放款审核</td>
                    <td>活期</td>
                    <td>2017-07-11</td>
                    <td>徐龙</td>
                    <td>2017-07-11</td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td>放款审核</td>
                    <td>活期</td>
                    <td>2017-07-11</td>
                    <td>徐龙</td>
                    <td>2017-07-11</td>
                </tr>
            </tbody>
        </table>
        <nav>
            <ul class="pagination">
                <li><a href="####" onclick="gotoPage('1');">首页</a></li>
                <c:if test="${result.paging.pageNum > 1}">
                    <li><a href="####" onclick="gotoPage('${result.paging.pageNum - 1}');" aria-label="Previous">&laquo;</a></li>
                    <li><a href="####" onclick="gotoPage('${result.paging.pageNum - 1}');">${result.paging.pageNum - 1}</a></li>
                </c:if>
                <li class="active"><a href="javascript:;">11</a></li>

                <c:if test="${result.paging.pageNum + 1 <= result.paging.pageCount}">
                    <li><a href="####" onclick="gotoPage('${result.paging.pageNum + 1}');">${result.paging.pageNum + 1}</a></li>
                    <li><a href="####" onclick="gotoPage('${result.paging.pageNum + 1}');" aria-label="Next">&raquo;</a></li>
                </c:if>
                <li><a href="####" onclick="gotoPage('${result.paging.pageCount}');">最后一页</a></li>
            </ul><span style="line-height:34px;"> &emsp;共${result.paging.pageCount}页</span>
        </nav>
    </div>  
</div>
<div id="custInfoShow" style="display: none"></div>
</body>
</html>
<script src="${ctxStatic}/public/libs/jquery-1.9.1.min.js"></script>
<script src="${ctxStatic}/public/libs/bootstrap/js/bootstrap.min.js"></script>
<!-- build:js -->
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
function showDetail(code){
	$("#custInfoShow").html("");
	var _data = {};
	_data.code = code;
	var url = "${ctx}warn/custinfo";
	$("#custInfoShow").load(url,_data,function(){
		layer.open({
			  type: 1,
			  title: "详细信息",
			  scrollbar: false,
			  shade: false,
			  skin: 'layui-layer-rim', //加上边框
			  area: ['1100px', '500px'], //宽高
			  content: $(this)
		});
	});
}
</script>