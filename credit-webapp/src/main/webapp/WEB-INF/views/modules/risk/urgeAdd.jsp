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
<style>
label.error{background:url("${ctxStatic}/jquery-validation/1.11.0/images/unchecked.gif") no-repeat 0 0;padding-left:18px;padding-bottom:2px;font-weight:bold;color:#ea5200;margin-left:10px}
</style>
<body>
<ul id="nav-tabs" class="nav nav-tabs">
     <li><a onclick="showInfo('${ctx}urge/list');" data-toggle="tab">催收列表</a></li>
     <li class="active"><a onclick="showInfo('${ctx}urge/add?id=${urgeId }&loanNo=${loanNo}');" data-toggle="tab">催收历史</a></li>
</ul>
<div id="tab-content" class="tab-content">
    <div id="home" class="tab-pane fade active in">
    	<div style="padding-top: 10px;"></div>
    	<form id="addForm" modelAttribute="urge" action="${ctx}urge/save" class="form-inline" method="post" enctype="multipart/form-data">
    		<input type="hidden" id="loanNo" name="loanNo" value="${loanNo}" class="form-control"/>
			<input type="hidden" id="urgeId" name="urgeId" value="${urgeId }" class="form-control"/>
        <div style="border:1px solid #ddd;padding:10px 20px;">
				<ul class="list-unstyled">
					<li class="row form-inline">
						<span class="col-md-6">
							<div class="col-sm-12 form-group">
								<label class="col-sm-3">融资编号：</label>${loanNo}
							</div>
						</span>
					</li>
					<li class="row form-inline">
						<span class="col-md-6">
							<div class="col-sm-12 form-group">
								<label class="col-sm-3">催收方式：</label>
								 <select id="urgeType" name="urgeType" style="width:30%" class="form-control">
			                        <option value="1">电催</option>
			                        <option value="2">上门催收</option>
			                        <option value="3">第三方催收</option>
			                    </select>
							</div>
						</span>
					</li>
					<li class="row form-inline">
						<span class="col-md-6">
							<div class="col-sm-12 form-group">
								<label class="col-sm-3">催收人：</label>
								 <input id="urgePerson" name="urgePerson" value="${urge.urgePerson}"  type="text" style="width:30%" class="form-control"/>
							</div>
						</span>
					</li>
					<li class="row form-inline">
						<span class="col-md-6">
							<div class="col-sm-12 form-group">
								<label class="col-sm-3">催收时间：</label>
								<input id="urgeTime" name="urgeTime" value="${today}" readOnly="readOnly" style="width:30%" class="form-control" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />
							</div>
						</span>
					</li>
					<li class="row form-inline">
						<span class="col-md-6">
							<div class="col-sm-12 form-group">
								<label class="col-sm-3">催收过程：</label> <textarea style="width:50%"  value="${urge.urgeProcess}" maxlength="100" name="urgeProcess" rows="3" class="form-control"> ${urge.urgeProcess}</textarea>
							</div>
						</span>
					</li>
					<li class="row form-inline">
						<span class="col-md-6">
							<div class="col-sm-12 form-group">
								<label class="col-sm-3">催收结果：</label>
								 <select id="urgeResult" name="urgeResult" style="width:30%" class="form-control">
			                        <option value="1">未还款</option>
			                        <option value="2">部分还款</option>
			                        <option value="3">正常还款</option>
			                        <option value="4">处置还款</option>
			                    </select>
							</div>
						</span>
					</li>
					<li class="row form-inline">
						<span class="col-md-6">
							<div class="col-sm-12 form-group">
								<label class="col-sm-3">催收金额：</label>
								<div class="input-group" style="width:30%">
								 <input id="urgeAmt" name="urgeAmt" onkeyup="value=value.replace(/[^\d.]/g,'')"  value="${urge.urgeAmt}" maxlength="20" type="text" class="form-control"/>
								 <div class="input-group-addon">万元</div>
								 </div>
							</div>
						</span>
					</li>
					<li class="row form-inline">
						<span class="col-md-6">
							<div class="col-sm-12 form-group">
								<label class="col-sm-3">催收结果描述：</label> <textarea style="width:50%;" value="${urge.urgeResultDescrpt}" maxlength="50" name="urgeResultDescrpt" rows="3" class="form-control">${urge.urgeResultDescrpt}</textarea>
							</div>
						</span>
					</li>
					<li class="row form-inline">
						<span class="col-md-6">
							<div class="col-sm-12 form-group">
								<label class="col-sm-3">上传附件：</label>
									<div class="input-group">
										<label>
											<div id="formFile">
												<ul class="list-unstyled">
													<li><label> <input type="file" name="file" />
													</label></li>
												</ul>
											</div>
										</label>
									</div>
								</div>
						</span>
					</li>
				</ul>
		</div>
        <div class="text-center  btns-tab" style="padding-top: 20px;">
	      	<button type="submit" class="btn btn-primary" data-dismiss="modal">提交</button>
	      	<button type="button" class="btn btn-info" onclick="showInfo('${ctx}urge/list');">返回</button>
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
<!-- endbuild -->
<script type="text/javascript" src="${ctxStatic}/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${ctxStatic}/jquery-validation/1.11.0/jquery.validate.min.js"></script>
<script src="${ctxStatic}/layer/layer.js"></script>
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
	$("#addForm").validate({
		rules: {
			loanNo: {
               required : true
            },urgeId: {
            	required : true
            },urgeType: {
            	required : true
            },urgePerson: {
            	required : true
            },urgeTime: {
            	required : true
            },urgeProcess: {
            	required : true
            },urgeResult: {
            	required : true
            },urgeAmt: {
            	required : true,
            	number:true
            },urgeResultDescrpt: {
            	required : true
            }
  
        },
		submitHandler: function(form){
			layer.confirm('确认提交催收记录？', {shade: false,
				  btn: ['确认','取消'] //按钮
				}, function(){
					form.submit();
					layer.closeAll('dialog');
				}, function(){
					layer.closeAll('dialog');
				});
		},
		errorPlacement: function(error, element) {
			error.insertAfter(element);
		}
	});
});
</script>
