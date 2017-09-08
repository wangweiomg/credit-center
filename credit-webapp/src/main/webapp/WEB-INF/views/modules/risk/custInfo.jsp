<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1,,maximum-scale=1,user-scalable=no">
    <title>经销商信息</title>
    <meta name="keywords" content="#">
    <meta name="description" content="#">
    <meta name="author" content="#">
</head>
<body>
<div id="detail" class="tab-pane">
			<div class="sui-steps-round">
				<div class="finished">
					<div class="wrap">
						<div class="round">1</div>
						<div class="bar"></div>
					</div>
					<label><strong>新增客户</strong><br>业务专员（李苗苗）</label>
				</div>
				<div class="current">
					<div class="wrap">
						<div class="round">1</div>
						<div class="bar"></div>
					</div>
					<label><strong>新增客户</strong><br>业务专员（李苗苗）</label>
				</div>
				<div class="todo">
					<div class="wrap">
						<div class="round">1</div>
						<div class="bar"></div>
					</div>
					<label><strong>新增客户</strong><br>业务专员（李苗苗）</label>
				</div>
				<div class="todo last">
					<div class="wrap">
						<div class="round">3</div>
					</div>
					<label><strong>新增客户</strong><br>业务专员（李苗苗）</label>
				</div>
			</div>
			<div class="content">
				<ul class="nav nav-pills">
					<li class="active"><a href="#cust_tab1" id="t_cust_tab1" data-toggle="tab"> 客户信息</a></li>
					<li><a href="#cust_tab2" id="t_cust_tab2" data-toggle="tab">公司经营信息</a></li>
					<li><a href="#cust_tab3" id="t_cust_tab3" data-toggle="tab">附件</a></li>
				</ul>
				<div class="tab-content">
					<div id="cust_tab1" class="tab-pane fade active in">
						<h5>
							<strong>实际控制人/担保人信息</strong>
						</h5>
						<ul class="list-unstyled">
							<li class="row form-inline no-gutter"><span class="col-md-4">
									<div class="form-group">
										<label>姓&emsp;&emsp;名：</label> 
										<span id='cusName1'>${custInfo.pernInfo.cusName }</span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>&emsp;&emsp;性别：</label>
										 <span id="gender1">${custInfo.pernInfo.gender }</span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>民族：</label> 
										<span id="nation1">${custInfo.pernInfo.nation }</span>
									</div>
							</span></li>
							<li class="row form-inline no-gutter"><span class="col-md-4">
									<div class="form-group">
										<label>家庭地址：</label> 
										<span id="homeAddr1">${custInfo.pernInfo.homeAddr }</span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>&emsp;&emsp;身份证号：</label> 
										<span id="idCardNo1">${custInfo.pernInfo.idCardNo }</span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>工作单位：</label> 
										<span id="jobAddr1">${custInfo.pernInfo.jobAddr }</span>
									</div>
							</span></li>
							<li class="row form-inline no-gutter"><span class="col-md-4">
									<div class="form-group">
										<label>从业时间：</label> 
										<span id="jobTime1">${custInfo.pernInfo.jobTime }</span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>&emsp;&emsp;职务：</label> 
										<span id="duty1">${custInfo.pernInfo.duty }</span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>本人联系电话：</label> 
										<span id="phone1">${custInfo.pernInfo.phone }</span>
									</div>
							</span></li>
							<li class="row form-inline no-gutter">
							<span class="col-md-4">
									<div class="form-group">
										<label>办公电话：</label> 
										<span id="offPhone1">${custInfo.pernInfo.offPhone }</span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>&emsp;&emsp;工作联系人：</label> 
										<span id="jobContact1">${custInfo.pernInfo.jobContact }</span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>工作联系人联系电话：</label> 
										<span id="jobContPhone1">${custInfo.pernInfo.jobContPhone }</span>
									</div>
							</span></li>
							<li class="row form-inline no-gutter">
							<span class="col-md-4">
									<div class="form-group">
										<label>家庭联系人：</label> 
										<span id="mateName1">${custInfo.othContInfo.mateName }</span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>&emsp;&emsp;身份证号：</label> 
										<span id="mateIdCard1">${custInfo.othContInfo.mateIdCard }</span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>家庭联系人联系电话1：</label> 
										<span id="matePhone">${custInfo.othContInfo.matePhone }</span>
									</div>
							</span></li>
							<li class="row form-inline no-gutter">
							<span class="col-md-4">
									<div class="form-group">
										<label>与本人关系：</label> 
										<span id="relationship1">${custInfo.othContInfo.relationship }</span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>&emsp;&emsp;子女情况：</label> 
										<span id="children1">${custInfo.othContInfo.children }</span></li>
						</ul>
						<h5>
							<strong>担保信息</strong>
						</h5>
						<ul class="list-unstyled">
							<li class="row form-inline no-gutter">
							<span class="col-md-4">
									<div class="form-group">
										<label>担保人/公司：</label>
										 <span id='dbCompany1'>${custInfo.assuInfo.dbCompany }</span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>担保人配偶/公司法定代表人：</label> 
										<span id="dbCorporation1">${custInfo.assuInfo.dbCorporation }</span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>联系电话：</label> <span id="dbPhone1">${custInfo.assuInfo.dbPhone }</span>
									</div>
							</span></li>
						</ul>
						<h5>
							<strong>经销商授权信息</strong>
						</h5>
						<ul class="list-unstyled">
							<li class="row form-inline no-gutter">
							<span class="col-md-4">
									<div class="form-group">
										<label>产品类型：</label> 
										<span id='pdType1'>${custInfo.dealInfo.pdType }</span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>利率：</label> 
										<span id="rate1">${custInfo.dealInfo.rate }</span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>最大总金额：</label> 
										<span id="maxMoney1">${custInfo.dealInfo.maxMoney }</span>
									</div>
							</span></li>
						</ul>
					</div>
					<div id="cust_tab2" class="tab-pane fade">
						<!-- <h5><strong>公司经营信息</strong></h5> -->
						<ul class="list-unstyled">
							<li class="row form-inline no-gutter">
							<span class="col-md-4">
									<div class="form-group">
										<label>注册名称：</label> 
										<span></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>&emsp;&emsp;注册资金：</label>
										 <span>${custInfo.pernInfo.cusName }</span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>法人代表：</label> 
										<span>${custInfo.pernInfo.cusName }</span>
									</div>
							</span></li>
							<li class="row form-inline no-gutter">
							<span class="col-md-4">
									<div class="form-group">
										<label>注册时间：</label> 
										<span>${custInfo.pernInfo.cusName }</span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>&emsp;&emsp;经济类型：</label> 
										<span>${custInfo.pernInfo.cusName }</span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>法人身份证号：</label> 
										<span>${custInfo.pernInfo.cusName }</span>
									</div>
							</span></li>
							<li class="row form-inline no-gutter">
							<span class="col-md-4">
									<div class="form-group">
										<label>注册类型：</label> 
										<span>${custInfo.pernInfo.cusName }</span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>&emsp;&emsp;机构细分：</label> 
										<span>${custInfo.pernInfo.cusName }</span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>企业出资人经济成份：</label> 
										<span>${custInfo.pernInfo.cusName }</span>
									</div>
							</span></li>
							<li class="row form-inline no-gutter">
							<span class="col-md-4">
									<div class="form-group">
										<label>注册地址：</label> <span>${custInfo.pernInfo.cusName }</span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>&emsp;&emsp;关联类型：</label> 
										<span>${custInfo.pernInfo.cusName }</span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>进出口标识：</label>
										 <span>${custInfo.pernInfo.cusName }</span>
									</div>
							</span></li>
							<li class="row form-inline no-gutter">
							<span class="col-md-4">
									<div class="form-group">
										<label>组织机构代码：</label> 
										<span>${custInfo.pernInfo.cusName }</span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>&emsp;&emsp;企业特征：</label>
										 <span>${custInfo.pernInfo.cusName }</span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>单位电话：</label> 
										<span>${custInfo.pernInfo.cusName }</span>
									</div>
							</span></li>
							<li class="row form-inline no-gutter"><span class="col-md-4">
									<div class="form-group">
										<label>登记注册号：</label> 
										<span>${custInfo.pernInfo.cusName }</span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>&emsp;&emsp;企业性质：</label> 
										<span>${custInfo.pernInfo.cusName }</span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>财务部电话：</label>
										 <span>${custInfo.pernInfo.cusName }</span>
									</div>
							</span></li>
							<li class="row form-inline no-gutter"><span class="col-md-4">
									<div class="form-group">
										<label>税务登记证号：</label> 
										<span>${custInfo.pernInfo.cusName }</span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>&emsp;&emsp;行业分类：</label> 
										<span>${custInfo.pernInfo.cusName }</span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>通讯地址：</label> 
										<span>${custInfo.pernInfo.cusName }</span>
									</div>
							</span></li>
							<li class="row form-inline no-gutter"><span class="col-md-4">
									<div class="form-group">
										<label>贷款卡号：</label> 
										<span>${custInfo.pernInfo.cusName }</span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>&emsp;&emsp;行政区划：</label>
										 <span>${custInfo.pernInfo.cusName }</span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>邮编：</label> 
										<span>${custInfo.pernInfo.cusName }</span>
									</div>
							</span></li>
							<li class="row form-inline no-gutter">
							<span class="col-md-4">
									<div class="form-group">
										<label>登记开始日期：</label> 
										<span>${custInfo.pernInfo.cusName }</span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>&emsp;&emsp;登记到期日期：</label> 
										<span>${custInfo.pernInfo.cusName }</span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>职工总数：</label>
										 <span>${custInfo.pernInfo.cusName }</span>
									</div>
							</span></li>
							<li class="row form-inline no-gutter">
							<span class="col-md-4">
									<div class="form-group">
										<label>办公用房情况：</label> 
										<span>${custInfo.pernInfo.cusName }</span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>&emsp;&emsp;房产价值：
										</label> <span></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>车位数：</label> 
										<span>${custInfo.pernInfo.cusName }</span>
									</div>
							</span></li>
							<li class="row form-inline no-gutter">
							<span class="col-md-4">
									<div class="form-group">
										<label>月均销量：</label> 
										<span>${custInfo.pernInfo.cusName }</span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>&emsp;&emsp;月均销售额：</label>
										 <span>${custInfo.pernInfo.cusName }</span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>填表当天库存：</label> 
										<span>${custInfo.pernInfo.cusName }</span>
									</div>
							</span></li>
							<li class="row form-inline no-gutter">
							<span class="col-md-4">
									<div class="form-group">
										<label>最大库存量：</label> 
										<span>${custInfo.pernInfo.cusName }</span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>&emsp;&emsp;月均库存量：</label> 
										<span>${custInfo.pernInfo.cusName }</span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>视频监控端口：</label> 
										<span>${custInfo.pernInfo.cusName }</span>
									</div>
							</span></li>
							<li class="row form-inline no-gutter">
							<span class="col-md-4">
									<div class="form-group">
										<label>停车场/库地址：</label> 
										<span>${custInfo.pernInfo.cusName }</span>
									</div>
							</span><span class="col-md-4"> </span></li>
						</ul>
					</div>
					<div id="cust_tab3" class="tab-pane fade">098754erh</div>
				</div>
			</div>
			<table id="operation-history" width="100%" class="bg-info font12">
				<thead>
					<tr>
						<th width="15%">操作记录</th>
						<th width="15%">操作人</th>
						<th>操作时间</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>活期</td>
						<td>业务专员（李苗苗)</td>
						<td>2017-07-12</td>
					</tr>
				</tbody>
			</table>
			<div style="padding-top: 10px;"></div>
		</div>
</body>
</html>
<script>
$("#t_tab1").click(function(){
	$("#tab1").addClass(" active ");
	$("#tab2").removeClass(" active ");
	$("#tab3").removeClass(" active ");
});
$("#t_tab2").click(function(){
	$("#tab2").addClass(" active ");
	$("#tab1").removeClass(" active ");
	$("#tab3").removeClass(" active ");
});
$("#t_tab3").click(function(){
	$("#tab3").addClass(" active ");
	$("#tab2").removeClass(" active ");
	$("#tab1").removeClass(" active ");
});
</script>