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
	<input type="hidden" value="仓库详情" id="addTabTitle">
	<ul id="nav-tabs" class="nav nav-tabs">
		<li class="active"><a href="#home" data-toggle="tab"> 盘库记录</a></li>
		<li><a href="#profile" data-toggle="tab">新增盘库记录</a></li>
	</ul>
	<div id="tab-content" class="tab-content">
		<div id="home" class="tab-pane fade active in">
			<div class="alert alert-danger">
				<form class="form-inline" action="${ctx}inventory/findByPage">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="仓库名称" name="depotName"></input>
					</div>
					<div class="form-group">
						<select class="form-control" name="depotLocProv">
							<option selected="selected" disabled="disabled">所在省份</option>
							<option>北京</option>
							<option>河北</option>
							<option>湖北</option>
						</select>
					</div>
					<div class="form-group">
						<select class="form-control" name="depotLocCity">
							<option selected="selected" disabled="disabled">所在地市</option>
							<option>海淀</option>
							<option>石家庄</option>
							<option>武汉</option>
						</select>
					</div>
					<div class="form-group">
						<select class="form-control" name="chkPersonId">
							<option selected="selected" disabled="disabled">盘库人</option>
							<option>123</option>
							<option>234</option>
							<option>345</option>
						</select>
					</div>
					<div class="form-group">
						<input name="chkTimeStart" placeholder="盘库时间起始" value="" class="Wdate form-control" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" /> 
					</div>
					-&nbsp;
					<div class="form-group">
						<input name="chkTimeEnd" placeholder="盘库时间终止" value="" class="Wdate form-control" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" /> 
					</div>
					<div class="form-group">
						<select class="form-control" name="status">
							<option selected="selected" disabled="disabled">盘库结果</option>
							<option>1</option>
							<option>2</option>
						</select>
					</div>
					<button type="submit" class="btn btn-primary">查询</button>
				</form>
			</div>
			<table class="table table-bordered table-striped">
				<thead>
					<tr>
						<th width="40" class="text-center bg-primary dropdown"><a
							href="javascript:;" id="custom-dropdown" class="ico ico-menu"></a>
							<ul id="custom-menu" class="dropdown-menu">
		                        <li class="title"><a href="javascript:;">自定义列表</a></li>
		                        <li class="checkbox"><a href="javascript:;">
		                            <label>
		                                <input type="checkbox" checked>全部
		                            </label></a><a href="javascript:;">
		                            <label>
		                                <input type="checkbox" checked>仓库名称
		                            </label></a><a href="javascript:;">
		                            <label>
		                                <input type="checkbox" checked>仓库所在省市
		                            </label></a><a href="javascript:;">
		                            <label>
		                                <input type="checkbox" checked>仓库在库车辆数
		                            </label></a><a href="javascript:;">
		                            <label>
		                                <input type="checkbox" checked>盘库车辆数
		                            </label></a><a href="javascript:;">
		                            <label>
		                                <input type="checkbox" checked>盘库时间
		                            </label></a><a href="javascript:;">
		                            <label>
		                                <input type="checkbox" checked>盘库人
		                            </label></a><a href="javascript:;">
		                            <label>
		                                <input type="checkbox" checked>盘库结果
		                            </label></a><a href="javascript:;">
		                            <label>
		                                <input type="checkbox" checked>备注
		                            </label></a></li>
		                        <li class="divider"></li>
		                        <li class="footer text-center">
		                            <button class="btn btn-primary">确定</button>
		                            <button class="btn btn-info">取消</button>
		                        </li>
		                    </ul>
						</th>
						<th>盘库记录ID</th>
						<th>仓库名</th>
						<th>仓库所在省市</th>
						<th>仓库在库车辆数</th>
						<th>盘库车辆数</th>
						<th>盘库时间</th>
						<th>盘库人</th>
						<th>盘库结果</th>
						<th>备注</th>
						<th>操作</th>
						<th class="hidden"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${result.paging.list}" var="chkRecord"
						varStatus="status">
						<tr>
							<th scope="row">${status.index + 1}</th>
							<td>${chkRecord.chkRecordId}</td>
							<td>
								<a id="depotName" href="javascript:;" class="add-tab">${chkRecord.depotName}</a>
								<input type="text" id="depotCode" class="hidden" value="${chkRecord.depotCode}">
							</td>
							<td>${chkRecord.depotLocProv} ${chkRecord.depotLocCity}</td>
							<td>${chkRecord.inStockCnt}</td>
							<td>${chkRecord.chkCarCnt}</td>
							<td><fmt:formatDate value="${chkRecord.chkTime}" pattern="yyyy-MM-dd"/></td>
							<td>${chkRecord.chkPersonName}</td>
							<td>${chkRecord.status}</td>
							<td>${chkRecord.reason}</td>
							<td>
								<form id="attachForm${status.index + 1}" action="${ctx}inventory/viewAttachs">
									<a onclick="document.getElementById('attachForm${status.index + 1}').submit();">查看附件</a>
									<input type="text" name="tid" class="hidden" value="${chkRecord.tid}">
								</form>
							</td>
						</form>	
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<nav>
				<ul class="pagination">
					<li><a href="${ctx}inventory/findByPage?pageNum=1">首页</a></li>
					<c:if test="${result.paging.pageNum > 1}">
						<li><a
							href="${ctx}inventory/findByPage?pageNum=${result.paging.pageNum - 1}"
							aria-label="Previous">&laquo;</a></li>
						<li><a
							href="${ctx}inventory/findByPage?pageNum=${result.paging.pageNum - 1}">${result.paging.pageNum - 1}</a></li>
					</c:if>
					<li class="active"><a href="javascript:;">${result.paging.pageNum}</a></li>

					<c:if
						test="${result.paging.pageNum + 1 <= result.paging.pageCount}">
						<li><a
							href="${ctx}inventory/findByPage?pageNum=${result.paging.pageNum + 1}">${result.paging.pageNum + 1}</a></li>
						<li><a
							href="${ctx}inventory/findByPage?pageNum=${result.paging.pageNum + 1}"
							aria-label="Next">&raquo;</a></li>
					</c:if>
					<li><a
						href="${ctx}inventory/findByPage?pageNum=${result.paging.pageCount}">最后一页</a></li>
				</ul>
				<span style="line-height: 34px;">
					&emsp;共${result.paging.pageCount}页</span>
			</nav>
		</div>

		<div id="profile" class="tab-pane fade">

			<form id="subbitForm" class="form-inline" action="${ctx}inventory/insert" method="post" enctype="multipart/form-data">
				<dl id="dl_form" class="dl_fo8rm">
					<div style="border: 1px solid #ddd; padding: 10px 20px;">
						<dd>
							<ul class="list-unstyled">
									<li class="row form-inline">
										<span class="col-md-6">
											<div class="form-group">
												<label>仓库所在地：</label> 
												<select id="selectDepotLocProv" class="form-control" name="depotLocProv">
													<option selected="selected" disabled="disabled">所在省份</option>
													<option value="1">北京</option>
													<option value="2">河北省</option>
												</select> 
												<select id="selectDepotLocCity" class="form-control" name="depotLocCity">
													<option selected="selected" disabled="disabled">所在地市</option>
													<option value="1">海淀</option>
													<option value="2">石家庄</option>
												</select>
											</div>
										</span>
									</li>
									
									<li class="row form-inline">
										<span class="col-md-6">
											<div class="form-group">
												<label>仓库名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> 
												<select id="selectDepot" class="form-control"  name="depotName">
													<option selected="selected" disabled="disabled">仓库名</option>
												</select> 
											</div>
										</span>
									</li>
									
									<li class="row form-inline">
		                            	<span class="col-md-6">
		                                	<div class="form-group">
		                                		<label>在库车辆数：</label>
		                                			<div class="input-group">
			                                			<input id="inStockCnt" type="text" readonly="readonly" class="form-control" name="inStockCnt" />
			                                				<div class="input-group-addon">台</div>
		                                			</div>
		                                	</div>
		                                </span>
		                            </li>
		                            
		                            <li class="row form-inline">
		                            	<span class="col-md-6">
		                                	<div class="form-group">
		                                		<label>盘库时间：&nbsp;&nbsp;&nbsp;</label>
		                                			<div class="input-group">
														<input name="chkTime" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" /><br><br> 
		                                			</div>
		                                	</div>
		                                </span>
		                            </li>
		                            
		                            <li class="row form-inline">
										<span class="col-md-6">
											<div class="form-group">
												<label>盘库人：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> 
												<select class="form-control"  name="chkPersonName">
													<option selected="selected" disabled="disabled">盘库人</option>
													<option>张三</option>
													<option>李四</option>
												</select> 
											</div>
										</span>
									</li>
									
									<li class="row form-inline">
		                            	<span class="col-md-6">
		                                	<div class="form-group">
		                                		<label>盘库车辆数：</label>
		                                			<div class="input-group">
			                                			<input type="text" class="form-control" name="chkCarCnt" />
			                                				<div class="input-group-addon">台</div>
		                                			</div>
		                                	</div>
		                                </span>
		                            </li>
		                            
		                            <li class="row form-inline">
										<span class="col-md-6">
											<div class="form-group">
												<label>盘库结果：&nbsp;&nbsp;&nbsp;</label> 
												<select class="form-control"  name="status">
													<option selected="selected" disabled="disabled">盘库结果</option>
													<option>1</option>
													<option>2</option>
												</select> 
											</div>
										</span>
									</li>
									
									<li class="row form-inline">
		                            	<span class="col-md-6">
		                                	<div class="form-group">
		                                		<label>备注：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
		                                			<div class="input-group">
			                                			<textarea name="reason" class="form-control" rows="3" cols="50" placeholder="请输入"></textarea>
		                                			</div>
		                                	</div>
		                                </span>
		                            </li>
		                            
		                            <li class="row form-inline">
		                            	<span class="col-md-6">
		                                	<div class="form-group">
		                                		<label>上传附件：&nbsp;&nbsp;&nbsp;</label>
		                                			<div class="input-group">
			                                			<label>
		  													
															<div id="formFile">
												                <ul class="list-unstyled">
												                  <li>
												                    <label>
												                      <input type="file" name="file" />
												                    </label>
												                  </li>
												                  <li><a href="javascript:;" id="addFile">+添加附件</a></li>
												                </ul>
												              </div>
														</label>
		                                			</div>
		                                			
		                                	</div>
		                                	
		                                </span>
		                            </li>
							</ul>
						</dd>
					</div>
				</dl>
				<div class="text-center btns-tab">
					<a onclick="document.getElementById('subbitForm').submit();return false" class="btn btn-primary">提&emsp;交</a> 
					<a href="${ctx}inventory/findByPage?pageNum=1"
						class="btn btn-info">取&emsp;消</a>
					<p id="successText">信息已提交!</p>
				</div>
			</form>
		</div>
		<div id="detail" class="tab-pane fade">
		<div class="content">
            <ul class="nav nav-pills">
                <li class="active"><a href="#tab1" data-toggle="tab"> 仓库信息</a></li>
                <li><a href="#tab2" data-toggle="tab">在库车辆信息</a></li>
            </ul>
            <div class="tab-content">
                <div id="tab1" class="tab-pane fade active in">
                    <ul class="list-unstyled">
                        <li class="row form-inline no-gutter">
                        	<span class="col-md-3">
	                    		<div class="form-group">
	                    			<label>仓库名：</label>
	                    			<span id="depotDetailName"></span>
	                    		</div>
	                    	</span>
	                    </li>
                        <li class="row form-inline no-gutter">
                        	<span class="col-md-3">
                    			<div class="form-group">
                    				<label>仓库地址：</label>
                    				<span id="depotDetailAddress"></span>
                    			</div>
                    		</span>
                    	</li>
                    	<li class="row form-inline no-gutter">
                        	<span class="col-md-3">
	                    		<div class="form-group">
	                    			<label>仓库范围：</label>
	                    			<span id="depotDetailScope"></span>
	                    		</div>
	                    	</span>
	                    </li>
	                    <li class="row form-inline no-gutter">
                        	<span class="col-md-3">
	                    		<div class="form-group">
	                    			<label>仓库归属：</label>
	                    			<span id="depotDetailBelong"></span>
	                    		</div>
	                    	</span>
	                    </li>
	                    <li class="row form-inline no-gutter">
                        	<span class="col-md-3">
	                    		<div class="form-group">
	                    			<label>仓库类型：</label>
	                    			<span id="depotDetailType"></span>
	                    		</div>
	                    	</span>
	                    </li>
	                    <li class="row form-inline no-gutter">
                        	<span class="col-md-3">
	                    		<div class="form-group">
	                    			<label>车位数：</label>
	                    			<span id="depotDetailCnt"></span>
	                    		</div>
	                    	</span>
	                    </li>
	                    <li class="row form-inline no-gutter">
                        	<span class="col-md-3">
	                    		<div class="form-group">
	                    			<label>仓库联系人：</label>
	                    			<span id="depotDetailContact"></span>
	                    		</div>
	                    	</span>
	                    </li>
	                    <li class="row form-inline no-gutter">
                        	<span class="col-md-3">
	                    		<div class="form-group">
	                    			<label>联系人电话：</label>
	                    			<span id="depotDetailPhone"></span>
	                    		</div>
	                    	</span>
	                    </li>
	                    <li class="row form-inline no-gutter">
                        	<span class="col-md-3">
	                    		<div class="form-group">
	                    			<label>备注：</label>
	                    			<span id="depotDetailRemark"></span>
	                    		</div>
	                    	</span>
	                    </li>
                    </ul>
                </div>
                <div id="tab2" class="tab-pane fade">
	                    <table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th></th>
									<th>车架号</th>
									<th>所属经销商</th>
									<th>合格证出厂日期</th>
									<th>品牌</th>
									<th>车辆型号</th>
									<th>评估价格</th>
									<th>合同编号</th>
								</tr>
							</thead>
							<tbody id="carsInfo">
							
							</tbody>
						</table>
						<div id="carTotalInfo"></div>
                </div>
            </div>
        </div>
	</div>
	</div>
	
</body>
</html>
<script src="${ctxStatic}/public/libs/jquery-1.9.1.min.js"></script>
<script src="${ctxStatic}/public/libs/bootstrap/js/bootstrap.min.js"></script>
<!-- build:js -->
<script src="${ctxStatic}/public/js/base.js"></script>
<script src="${ctxStatic}/public/js/list.js"></script>
<script src="${ctxStatic}/public/js/inventory/inventory.js"></script>
<script type="text/javascript" src="${ctxStatic}/My97DatePicker/WdatePicker.js"></script>
<!-- endbuild -->
