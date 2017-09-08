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
     <li><a onclick="showInfo('${ctx}warn/otherlist');" data-toggle="tab">其他预警</a></li>
     <li><a onclick="showInfo('${ctx}warn/repaylist');" data-toggle="tab">逾期预警</a></li>
     <li class="active"><a onclick="showInfo('${ctx}warn/add');" data-toggle="tab">新增预警</a></li>
</ul>
<div id="tab-content" class="tab-content">
    <div id="home" class="tab-pane fade active in">
    	<div style="padding-top: 10px;"></div>
    	<form id="addForm" modelAttribute="warn" action="${ctx}warn/save" class="form-inline" >
    		<input type="hidden" id="objName" name="objName" value="" class="form-control"/>
			<input type="hidden" id="objId" name="objId" value="" class="form-control"/>
        <div style="border:1px solid #ddd;padding:10px 20px;">
				<ul class="list-unstyled">
					<li class="row form-inline">
						<span class="col-md-6">
							<div class="col-sm-12 form-group">
								<label class="col-sm-3">预警对象：</label>
								 <select id="warnType" name="warnType" style="width:30%" class="form-control">
			                        <option value="4">车辆</option>
			                        <option value="5">经销商</option>
			                    </select>
							</div>
						</span>
					</li>
					<li class="row form-inline" id="carInfo">
						<span class="col-md-6">
							<div class="col-sm-12 form-group">
								<label class="col-sm-3">车架号：</label> <input id="carCode" name="carCode" maxlength="17" onkeyup="value=value.replace(/[^a-zA-Z\d]/g,'')" type="text" onblur="checkCarInfo();" style="width:50%" class="form-control"/>
							</div>
						</span>
					</li>
					<li class="row form-inline" id="custInfo">
						<span class="col-md-6">
							<div class="col-sm-12 form-group">
								<label class="col-sm-3">经销商：</label> 
									<select id="custCode" name="custCode" style="width:50%" class="form-control">
										<option value="">请选择</option>
										<c:forEach items="${fns:getOtherCust()}" var="othermap" varStatus="status">
				                        <option <c:if test="${custCode == othermap.custCode }" >selected="selected" </c:if> value="${othermap.custCode }">${othermap.custName }</option>
				                        </c:forEach>
			                    	</select>
							</div>
						</span>
					</li>
					<li class="row form-inline">
						<span class="col-md-6">
							<div class="col-sm-12 form-group">
								<label class="col-sm-3">预警描述：</label> <textarea style="width:50%" id="warnDescrpt" name="warnDescrpt" rows="3" class="form-control"></textarea>
							</div>
						</span>
					</li>
				</ul>
		</div>
        <div class="text-center  btns-tab" style="padding-top: 20px;">
	      	<button type="submit" class="btn btn-primary" data-dismiss="modal">提交</button>
	      	<button type="button" class="btn btn-info">取消</button>
      	</div>
      	</form>
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
<script type="text/javascript" src="${ctxStatic}/jquery-validation/1.11.0/jquery.validate.min.js"></script>
<style>
label.error{background:url("${ctxStatic}/jquery-validation/1.11.0/images/unchecked.gif") no-repeat 0 0;padding-left:18px;padding-bottom:2px;font-weight:bold;color:#ea5200;margin-left:10px}
</style>
<script type="text/javascript">
$(function(){
	$("#custInfo").hide();
	$("#warnType").change(function(){
		var type = $("#warnType").val();
		if(type =='4'){
			$("#custInfo").hide();
			$("#carInfo").show();
		}else{
			$("#custInfo").show();
			$("#carInfo").hide();
		}
		$("#carCode").val("");
		$("#custCode").val("");
		$("#objId").val("");
		$("#objName").val("");
	});
	$("#custCode").change(function(){
		var code = $("#custCode").val();
		var info = $("#custCode").find("option:selected").text();
		$("#objName").val(info);
		$("#objId").val(code);
	});
	$("#addForm").validate({
		rules: {
			warnType: {
               required : true
            },carCode: {
            	required : true
            },custCode: {
            	required : true
            },warnDescrpt: {
            	required : true
            },objId: {
            	required : true
            },objName: {
            	required : true
            }
        },
		submitHandler: function(form){
			var oid = $("#objId").val();
			var onm = $("#objName").val();
			if(""==oid || ""==onm){
				layer.msg("车架号或经销商信息有误，无法提交");
				return false;
			}else{
				layer.confirm('确认提交预警？', {shade: false,
					  btn: ['确认','取消'] //按钮
					}, function(){
						form.submit();
						layer.closeAll('dialog');
					}, function(){
						layer.closeAll('dialog');
					});
			}
			
		},
		errorPlacement: function(error, element) {
			if($("#warnType").val()==4){
				$("#custCode").rules("remove");
			}
			if($("#warnType").val()==5){
				$("#carCode").rules("remove");
			}
			error.insertAfter(element);
		}
	});
});
function checkCarInfo(){
	var carCode = $("#carCode").val();
	$.ajax({
		type:"POST",
		dataType:"json",
		async:false,
		url:"${ctx}warn/checkCar/"+carCode ,
		success:function(data){
			if(data.type=="S"){
				$("#objId").val(data.objId);
				$("#objName").val(carCode);
			}else{
				layer.msg(data.message);
				$("#objId").val("");
				$("#objName").val("");
			}
		}
	});
}
function showInfo(url){
	window.location=url;
}
</script>
<!-- endbuild -->