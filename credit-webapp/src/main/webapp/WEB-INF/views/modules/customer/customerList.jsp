<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
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
    <link rel="stylesheet" href="${ctxStatic}/public/libs/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctxStatic}/public/libs/bootstrap/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="${ctxStatic}/public/css/style-main.min.css"><!--[if lt IE 9]>
    <script src="/libs/html5shiv.min.js"></script>
    <![endif]-->


</head>
<body>
<input type="hidden" value="贷款详情" id="addTabTitle">
<ul id="nav-tabs" class="nav nav-tabs">
    <li class="active"><a href="#home" data-toggle="tab"> 还款中列表</a></li>
    <%--<li><a href="#profile" data-toggle="tab">新增客户</a></li>--%>
</ul>
<div id="tab-content" class="tab-content">
    <div id="home" class="tab-pane fade active in">
        <div class="alert alert-success alert-dismissible" hidden="hidden" role="alert" id="mySuccess">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong>Warning!</strong> Better check yourself, you're not looking too good.
        </div>
        <div class="alert alert-danger">
            <form class="form-inline" method="get" action="/loan/repayment/list">
                <div class="form-group">
                    <select class="form-control" name="customerCode">
                        <option value="">经销商</option>
                        <c:forEach items="${customerList}" var="customer">
                            <option value="${customer.customerCode}">${customer.customerName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="合同编号" name="loanNo"/>
                </div>
                <div class="form-group">
                    <label for="sdate">放款时间:</label>
                    <input id="sdate" name="lendTimeStart" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,maxDate:'#F{$dp.$D(\'edate\')}'})" />
                    -
                    <input id="edate" name="lendTimeEnd" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,minDate:'#F{$dp.$D(\'sdate\')}',startDate:'#F{$dp.$D(\'sdate\',{d:+1})}'})" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="还款码" name="repaymentCode"/>
                </div>
                <div class="form-group">
                    <select class="form-control" name="deadline">
                        <option value="">当期还款期限</option>
                        <option value="1">当天</option>
                        <option value="3">3天内</option>
                        <option value="7">7天内</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary">查询</button>
                <button class="btn btn-primary" id="batchRepayment">批量还款</button>
            </form>
        </div>
        <table class="table table-bordered table-striped">
            <thead>
            <tr>
                <th><input type="checkbox" id="checkAll"></th>
                <th width="40" class="text-center bg-primary dropdown"><a href="javascript:;" id="custom-dropdown" class="ico ico-menu"></a>
                    <ul id="custom-menu" class="dropdown-menu">
                        <li class="title"><a href="javascript:;">自定义列表</a></li>
                        <li class="checkbox"><a href="javascript:;">
                            <label>
                                <input type="checkbox" checked>全部
                            </label></a><a href="javascript:;">
                            <label>
                                <input type="checkbox" checked>任务
                            </label></a><a href="javascript:;">
                            <label>
                                <input type="checkbox" checked>产品类型
                            </label></a><a href="javascript:;">
                            <label>
                                <input type="checkbox" checked>提交时间
                            </label></a><a href="javascript:;">
                            <label>
                                <input type="checkbox" checked>提交人
                            </label></a></li>
                        <li class="divider"></li>
                        <li class="footer text-center">
                            <button class="btn btn-primary">确定</button>
                            <button class="btn btn-info">取消</button>
                        </li>
                    </ul>
                </th>
                <th>合同编号</th>
                <th>经销商名称</th>
                <th>贷款车数量</th>
                <th>评估车辆金额</th>
                <th>合同金额</th>
                <th>产品类型</th>
                <th>利息</th>
                <th>贷款周期</th>
                <th>当期还款时间</th>
                <th>当期需还款金额</th>
                <th>还款码</th>
                <th>账号开户名</th>
                <th>当期状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${result.paging.list}" var="loan" varStatus="status">
                <tr>
                    <td><input type="checkbox" value="${loan.tid}" name="batchRepaymentCheckbox"></td>
                    <th scope="row">${status.index + 1}</th>
                    <td><a href="javascript:;" class="add-tab" onclick="showTabConent('${loan.customerCode}', '${loan.loanNo}', '${loan.tid}')">${loan.loanNo}</a></td>
                    <td>${loan.customerName}</td>
                    <td>${loan.loanCarCount}</td>
                    <td>${loan.carEvaluateAmount}</td>
                    <td>${loan.contractAmount}</td>
                    <td>${loan.productName}</td>
                    <td>${loan.rate}</td>
                    <td>${loan.loanPeriod}</td>
                    <td>当期还款时间</td>
                    <td>当期需还款金额</td>
                    <td>${loan.repaymentCode}</td>
                    <td>${loan.accountName}</td>
                    <td>${loan.status}</td>
                    <td>
                        <a href="#" data-toggle="modal" data-target="#myModal-repay" onclick="setRepayValues(${loan.tid}, 10000)">还款</a>
                        <%--<a href="#detail" class="add-tab">部分结清申请</a>
                        <a href="#submitArchives" class="add-tab">提交档案</a>--%>
                        <a href="#" data-toggle="modal" data-target="#myModal-cleared" onclick="setCleardValues('${loan.customerName}', '${loan.loanNo}', ${loan.tid})">结清</a>
                    </td>
                </tr>

            </c:forEach>

            </tbody>
        </table>
        <nav>
            <ul class="pagination">
                <li><a href="${ctx}loan/repayment/list?pageNum=1">首页</a></li>
                <c:if test="${result.paging.pageNum > 1}">
                    <li><a href="${ctx}loan/repayment/list?pageNum=${result.paging.pageNum - 1}" aria-label="Previous">&laquo;</a></li>
                    <li><a href="${ctx}loan/repayment/list?pageNum=${result.paging.pageNum - 1}">${result.paging.pageNum - 1}</a></li>
                </c:if>
                <li class="active"><a href="javascript:;">${result.paging.pageNum}</a></li>

                <c:if test="${result.paging.pageNum + 1 <= result.paging.pageCount}">
                    <li><a href="${ctx}loan/repayment/list?pageNum=${result.paging.pageNum + 1}">${result.paging.pageNum + 1}</a></li>
                    <li><a href="${ctx}loan/repayment/list?pageNum=${result.paging.pageNum + 1}" aria-label="Next">&raquo;</a></li>
                </c:if>
                <li><a href="${ctx}loan/repayment/list?pageNum=${result.paging.pageCount}">最后一页</a></li>
            </ul><span style="line-height:34px;"> &emsp;共${result.paging.pageCount}页</span>
        </nav>
    </div>
    <div id="profile" class="tab-pane fade">
        <dl id="dl_form" class="dl_form">
            <dt>
                <div class="sui-steps">
                    <div class="wrap">
                        <div class="current">
                            <label><span class="round">1</span><span>填写客户信息</span></label><i class="triangle-right-bg"></i><i class="triangle-right"></i>
                        </div>
                    </div>
                    <div class="wrap">
                        <div class="todo">
                            <label><span class="round">2 </span><span>填写企业经营信息</span></label><i class="triangle-right-bg"></i><i class="triangle-right"></i>
                        </div>
                    </div>
                    <div class="wrap">
                        <div class="todo">
                            <label><span class="round">3</span><span>上传附件</span></label>
                        </div>
                    </div>
                </div>
            </dt>
            <div style="border:1px solid #ddd;padding:10px 20px;">
                <dd>
                    <h5><strong>实际控制人/担保人信息</strong></h5>
                    <ul class="list-unstyled">
                        <li class="row form-inline"><span class="col-md-3">
                                <div class="form-group">
                                <label>配偶姓名：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>身份证号：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>联系电话：</label>
                                <input type="text" class="form-control" >
                                </div></span></li>
                        <li class="row form-inline"><span class="col-md-3">
                                <div class="form-group">
                                <label>配偶姓名：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>身份证号：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>联系电话：</label>
                                <input type="text" class="form-control" >
                                </div></span></li>
                        <li class="row form-inline"><span class="col-md-3">
                                <div class="form-group">
                                <label>配偶姓名：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>身份证号：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>联系电话：</label>
                                <input type="text" class="form-control" >
                                </div></span></li>
                        <li class="row form-inline"><span class="col-md-3">
                                <div class="form-group">
                                <label>配偶姓名：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>身份证号：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>联系电话：</label>
                                <input type="text" class="form-control" >
                                </div></span></li>
                        <li class="row form-inline"><span class="col-md-3">
                                <div class="form-group">
                                <label>配偶姓名：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>身份证号：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>联系电话：</label>
                                <input type="text" class="form-control" >
                                </div></span></li>
                    </ul>
                    <h5><strong>实际控制人/担保人信息</strong></h5>
                    <ul class="list-unstyled">
                        <li class="row form-inline"><span class="col-md-3">
                                <div class="form-group">
                                <label>配偶姓名：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>身份证号：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>联系电话：</label>
                                <input type="text" class="form-control" >
                                </div></span></li>
                        <li class="row form-inline"><span class="col-md-3">
                                <div class="form-group">
                                <label>配偶姓名：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>身份证号：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>联系电话：</label>
                                <input type="text" class="form-control" >
                                </div></span></li>
                        <li class="row form-inline"><span class="col-md-3">
                                <div class="form-group">
                                <label>配偶姓名：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>身份证号：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>联系电话：</label>
                                <input type="text" class="form-control" >
                                </div></span></li>
                        <li class="row form-inline"><span class="col-md-3">
                                <div class="form-group">
                                <label>配偶姓名：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>身份证号：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>联系电话：</label>
                                <input type="text" class="form-control" >
                                </div></span></li>
                        <li class="row form-inline"><span class="col-md-3">
                                <div class="form-group">
                                <label>配偶姓名：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>身份证号：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>联系电话：</label>
                                <input type="text" class="form-control" >
                                </div></span></li>
                    </ul>
                    <h5><strong>实际控制人/担保人信息</strong></h5>
                    <ul class="list-unstyled">
                        <li class="row form-inline"><span class="col-md-3">
                                <div class="form-group">
                                <label>配偶姓名：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>身份证号：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>联系电话：</label>
                                <input type="text" class="form-control" >
                                </div></span></li>
                        <li class="row form-inline"><span class="col-md-3">
                                <div class="form-group">
                                <label>配偶姓名：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>身份证号：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>联系电话：</label>
                                <input type="text" class="form-control" >
                                </div></span></li>
                        <li class="row form-inline"><span class="col-md-3">
                                <div class="form-group">
                                <label>配偶姓名：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>身份证号：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>联系电话：</label>
                                <input type="text" class="form-control" >
                                </div></span></li>
                        <li class="row form-inline"><span class="col-md-3">
                                <div class="form-group">
                                <label>配偶姓名：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>身份证号：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>联系电话：</label>
                                <input type="text" class="form-control" >
                                </div></span></li>
                        <li class="row form-inline"><span class="col-md-3">
                                <div class="form-group">
                                <label>配偶姓名：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>身份证号：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>联系电话：</label>
                                <input type="text" class="form-control" >
                                </div></span></li>
                    </ul>
                    <h5><strong>实际控制人/担保人信息</strong></h5>
                    <ul class="list-unstyled">
                        <li class="row form-inline"><span class="col-md-3">
                                <div class="form-group">
                                <label>配偶姓名：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>身份证号：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>联系电话：</label>
                                <input type="text" class="form-control" >
                                </div></span></li>
                        <li class="row form-inline"><span class="col-md-3">
                                <div class="form-group">
                                <label>配偶姓名：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>身份证号：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>联系电话：</label>
                                <input type="text" class="form-control" >
                                </div></span></li>
                        <li class="row form-inline"><span class="col-md-3">
                                <div class="form-group">
                                <label>配偶姓名：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>身份证号：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>联系电话：</label>
                                <input type="text" class="form-control" >
                                </div></span></li>
                        <li class="row form-inline"><span class="col-md-3">
                                <div class="form-group">
                                <label>配偶姓名：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>身份证号：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>联系电话：</label>
                                <input type="text" class="form-control" >
                                </div></span></li>
                        <li class="row form-inline"><span class="col-md-3">
                                <div class="form-group">
                                <label>配偶姓名：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>身份证号：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>联系电话：</label>
                                <input type="text" class="form-control" >
                                </div></span></li>
                    </ul>
                </dd>
                <dd class="hidden">
                    <h5><strong>实际控制人/担保人信息</strong></h5>
                    <ul class="list-unstyled">
                        <li class="row form-inline"><span class="col-md-3">
                                <div class="form-group">
                                <label>配偶姓名：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>身份证号：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>联系电话：</label>
                                <input type="text" class="form-control" >
                                </div></span></li>
                        <li class="row form-inline"><span class="col-md-3">
                                <div class="form-group">
                                <label>配偶姓名：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>身份证号：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>联系电话：</label>
                                <input type="text" class="form-control" >
                                </div></span></li>
                        <li class="row form-inline"><span class="col-md-3">
                                <div class="form-group">
                                <label>配偶姓名：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>身份证号：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>联系电话：</label>
                                <input type="text" class="form-control" >
                                </div></span></li>
                        <li class="row form-inline"><span class="col-md-3">
                                <div class="form-group">
                                <label>配偶姓名：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>身份证号：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>联系电话：</label>
                                <input type="text" class="form-control" >
                                </div></span></li>
                        <li class="row form-inline"><span class="col-md-3">
                                <div class="form-group">
                                <label>配偶姓名：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>身份证号：</label>
                                <input type="text" class="form-control">
                                </div></span><span class="col-md-3">
                                <div class="form-group">
                                <label>联系电话：</label>
                                <input type="text" class="form-control" >
                                </div></span></li>
                    </ul>
                </dd>
                <dd class="hidden">
                    <form id="formFile">
                        <ul class="list-unstyled">
                            <li>
                                <select class="form-control">
                                    <option>附件名</option>
                                    <option>2</option>
                                    <option>新建</option>
                                </select>
                                <label>
                                    <input type="file" class="hidden"><span class="btn btn-default">选择文件</span>
                                </label>
                            </li>
                            <li><a href="javascript:;" id="addFile">+添加附件</a></li>
                        </ul>
                    </form>
                </dd>
            </div>
        </dl>
        <div class="text-center btns-tab"><a href="javascript:;" class="btn btn-primary btn-next">下一步</a></div>
        <div class="text-center hidden btns-tab"><a href="javascript:;" class="btn btn-info btn-prev">上一步</a><a href="javascript:;" class="btn btn-primary btn-next">下一步</a></div>
        <div class="text-center hidden btns-tab"><a href="javascript:;" class="btn btn-info btn-prev">上一步</a><a href="/user/list.html" data-href="" id="btnSubmit" class="btn btn-primary">提&emsp;交</a><a href="/user/list.html" class="btn btn-info">取&emsp;消</a>
            <p id="successText">信息已提交!</p>
        </div>
    </div>
    <div id="detail" class="tab-pane fade">
        <div class="content">
            <ul class="nav nav-pills">
                <li class="active"><a href="#tab1" data-toggle="tab"> 客户信息</a></li>
                <li><a href="#tab2" data-toggle="tab">公司经营信息</a></li>
                <li><a href="#tab5" data-toggle="tab">贷款车辆&入库情况</a></li>
                <li><a href="#tab4" data-toggle="tab">贷款信息</a></li>
                <li><a href="#tab6" data-toggle="tab">合同</a></li>
                <li><a href="#tab7" data-toggle="tab">放款信息</a></li>
                <li><a href="#tab8" data-toggle="tab">还款计划</a></li>
                <li><a href="#tab3" data-toggle="tab">附件</a></li>
            </ul>
            <div class="tab-content">
                <div id="tab1" class="tab-pane fade active in">
                    <h5>
                        <strong>实际控制人/担保人信息</strong>
                    </h5>
                    <ul class="list-unstyled">
                        <li class="row form-inline no-gutter"><span class="col-md-4">
									<div class="form-group">
										<label>姓&emsp;&emsp;名：</label>
										<span id='cusName1'></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>&emsp;&emsp;性别：</label>
										 <span id="gender1"></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>民族：</label>
										<span id="nation1"></span>
									</div>
							</span></li>
                        <li class="row form-inline no-gutter"><span class="col-md-4">
									<div class="form-group">
										<label>家庭地址：</label>
										<span id="homeAddr1"></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>&emsp;&emsp;身份证号：</label>
										<span id="idCardNo1"></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>工作单位：</label>
										<span id="jobAddr1"></span>
									</div>
							</span></li>
                        <li class="row form-inline no-gutter"><span class="col-md-4">
									<div class="form-group">
										<label>从业时间：</label>
										<span id="jobTime1"></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>&emsp;&emsp;职务：</label>
										<span id="duty1"></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>本人联系电话：</label>
										<span id="phone1"></span>
									</div>
							</span></li>
                        <li class="row form-inline no-gutter">
							<span class="col-md-4">
									<div class="form-group">
										<label>办公电话：</label>
										<span id="offPhone1"></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>&emsp;&emsp;工作联系人：</label>
										<span id="jobContact1"></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>工作联系人联系电话：</label>
										<span id="jobContPhone1"></span>
									</div>
							</span></li>
                        <li class="row form-inline no-gutter">
							<span class="col-md-4">
									<div class="form-group">
										<label>家庭联系人：</label>
										<span id="mateName1"></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>&emsp;&emsp;身份证号：</label>
										<span id="mateIdCard1"></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>家庭联系人联系电话1：</label>
										<span id="matePhone"></span>
									</div>
							</span></li>
                        <li class="row form-inline no-gutter">
							<span class="col-md-4">
									<div class="form-group">
										<label>与本人关系：</label>
										<span id="relationship1"></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>&emsp;&emsp;子女情况：</label>
										<span id="children1"></span></li>
                    </ul>
                    <h5>
                        <strong>担保信息</strong>
                    </h5>
                    <ul class="list-unstyled">
                        <li class="row form-inline no-gutter">
							<span class="col-md-4">
									<div class="form-group">
										<label>担保人/公司：</label>
										 <span id='dbCompany1'></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>担保人配偶/公司法定代表人：</label>
										<span id="dbCorporation1"></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>联系电话：</label> <span id="dbPhone1"></span>
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
										<span id='pdType1'></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>利率：</label>
										<span id="rate1"></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>最大总金额：</label>
										<span id="maxMoney1"></span>
									</div>
							</span></li>
                    </ul>
                </div>
                <div id="tab2" class="tab-pane fade">
                    <!-- <h5><strong>公司经营信息</strong></h5> -->
                    <ul class="list-unstyled">
                        <li class="row form-inline no-gutter">
							<span class="col-md-4">
									<div class="form-group">
										<label>注册名称：</label>
										<span id="regName1"></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>&emsp;&emsp;注册资金：</label>
										 <span id="regMoney1"></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>法人代表：</label>
										<span id="corporation1"></span>
									</div>
							</span></li>
                        <li class="row form-inline no-gutter">
							<span class="col-md-4">
									<div class="form-group">
										<label>注册时间：</label>
										<span></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>&emsp;&emsp;经济类型：</label>
										<span></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>法人身份证号：</label>
										<span id="legalIdCard1"></span>
									</div>
							</span></li>
                        <li class="row form-inline no-gutter">
							<span class="col-md-4">
									<div class="form-group">
										<label>注册类型：</label>
										<span></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>&emsp;&emsp;机构细分：</label>
										<span></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>企业出资人经济成份：</label>
										<span></span>
									</div>
							</span></li>
                        <li class="row form-inline no-gutter">
							<span class="col-md-4">
									<div class="form-group">
										<label>注册地址：</label>
										<span id="regAddr1"></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>&emsp;&emsp;关联类型：</label>
										<span></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>进出口标识：</label>
										 <span></span>
									</div>
							</span></li>
                        <li class="row form-inline no-gutter">
							<span class="col-md-4">
									<div class="form-group">
										<label>组织机构代码：</label>
										<span id="orgCode1"></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>&emsp;&emsp;企业特征：</label>
										 <span></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>单位电话：</label>
										<span id="workPhone1"></span>
									</div>
							</span></li>
                        <li class="row form-inline no-gutter"><span class="col-md-4">
									<div class="form-group">
										<label>登记注册号：</label>
										<span id="regCode1"></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>&emsp;&emsp;企业性质：</label>
										<span></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>财务部电话：</label>
										 <span id="financePhone1"></span>
									</div>
							</span></li>
                        <li class="row form-inline no-gutter"><span class="col-md-4">
									<div class="form-group">
										<label>税务登记证号：</label>
										<span id="admCode1"></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>&emsp;&emsp;行业分类：</label>
										<span></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>通讯地址：</label>
										<span id="postalAddr1"></span>
									</div>
							</span></li>
                        <li class="row form-inline no-gutter"><span class="col-md-4">
									<div class="form-group">
										<label>贷款卡号：</label>
										<span id="creditCard1"></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>&emsp;&emsp;行政区划：</label>
										 <span></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>邮编：</label>
										<span id="zipCode1"></span>
									</div>
							</span></li>
                        <li class="row form-inline no-gutter">
							<span class="col-md-4">
									<div class="form-group">
										<label>登记开始日期：</label>
										<span></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>&emsp;&emsp;登记到期日期：</label>
										<span></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>职工总数：</label>
										 <span id="empCount1"></span>
									</div>
							</span></li>
                        <li class="row form-inline no-gutter">
							<span class="col-md-4">
									<div class="form-group">
										<label>办公用房情况：</label>
										<span></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>&emsp;&emsp;房产价值：
										</label> <span id="houseWorth1"></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>车位数：</label>
										<span id="carportCnt1"></span>
									</div>
							</span></li>
                        <li class="row form-inline no-gutter">
							<span class="col-md-4">
									<div class="form-group">
										<label>月均销量：</label>
										<span id="monthAvgSales1"></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>&emsp;&emsp;月均销售额：</label>
										 <span id="monthAvgCnt1"></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>填表当天库存：</label>
										<span id="todayStock1"></span>
									</div>
							</span></li>
                        <li class="row form-inline no-gutter">
							<span class="col-md-4">
									<div class="form-group">
										<label>最大库存量：</label>
										<span id="maxStock1"></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>&emsp;&emsp;月均库存量：</label>
										<span id="monthAvgStock1"></span>
									</div>
							</span><span class="col-md-4">
									<div class="form-group">
										<label>视频监控端口：</label>
										<span></span>
									</div>
							</span></li>
                        <li class="row form-inline no-gutter">
							<span class="col-md-4">
									<div class="form-group">
										<label>停车场/库地址：</label>
										<span id="address1"></span>
									</div>
							</span><span class="col-md-4"> </span></li>
                    </ul>
                </div>
                <div id="tab3" class="tab-pane fade">
                    <table class="table table-bordered table-striped">
                        <tr>
                            <th style="text-align: center">附件名</th>
                            <th style="text-align: center">上传时间</th>
                            <th style="text-align: center">文件</th>
                        </tr>
                        <tr>
                            <c:forEach items="${fileList }" var="file">
                                <td><span id="attachName1">${file.attachName }</span></td>
                                <td><span id="attachAt">${file.attachAt }</span></td>
                                <td><a href="${file.attachUrl }" id="attachUrl1">查看</a></td>
                            </c:forEach>
                        </tr>
                    </table>
                </div>
                <div id="tab4" class="tab-pane fade">
                    <!--贷款信息-->
                    <h5><strong>贷款信息</strong></h5>

                </div>
                <div id="tab5" class="tab-pane fade">
                    <!--贷款车辆&入库情况-->
                    <h5><strong>合计车辆 X 台， 总评估价 X 元</strong></h5>
                    <table class="table table-bordered table-striped">
                        <tr>
                            <th style="text-align: center">车架号</th>
                            <th style="text-align: center">合格证出厂日期</th>
                            <th style="text-align: center">品牌</th>
                            <th style="text-align: center">车款</th>
                            <th style="text-align: center">评估价</th>
                            <th style="text-align: center">入库时间</th>
                            <th style="text-align: center">入库仓库</th>
                            <th style="text-align: center">绑定设备</th>
                            <th style="text-align: center">权证钥匙入库</th>
                            <th style="text-align: center">权证钥匙与车辆一致</th>
                            <th style="text-align: center">车辆情况确认</th>
                            <th style="text-align: center">入库人</th>
                            <th style="text-align: center">解绑设备</th>
                            <th style="text-align: center">权证 钥匙出库</th>
                            <th style="text-align: center">出库人</th>
                            <th style="text-align: center">出库时间</th>
                        </tr>
                    </table>
                </div>
                <div id="tab6" class="tab-pane fade">
                    <!--合同-->
                    <h5>
                        <strong>合同</strong>
                    </h5>
                    <ul class="list-unstyled">
                        <li class="row form-inline no-gutter"><span class="col-md-3">
                                <div class="form-group">
                                    <label>合同签订日期：</label> <span>田玉华</span>
                                </div>
                        </span></li>
                        <li class="row form-inline no-gutter"><span class="col-md-3">
                                <div class="form-group">
                                    <label>合同文件：</label> <span>田玉华</span>
                                </div>
                        </span></li>
                    </ul>
                </div>
                <div id="tab7" class="tab-pane fade">
                    <!--放款信息-->
                    <h5>
                        <strong>放款信息</strong>
                    </h5>
                    <ul class="list-unstyled">
                        <li class="row form-inline no-gutter">
                            <span class="col-md-3">
                                <div class="form-group">
                                    <label>放款金额：</label> <span id="tab-lendAmount"></span>
                                </div>
							</span>
                        </li>
                        <li class="row form-inline no-gutter"><span class="col-md-3">
                                <div class="form-group">
                                    <label>放款时间：</label> <span id="tab-lendTime"></span>
                                </div>
							</span>
                        </li>
                        <li class="row form-inline no-gutter"><span class="col-md-3">
                                <div class="form-group">
                                    <label>放款人：</label> <span id="tab-lendBy"></span>
                                </div>
							</span>
                        </li>
                    </ul>
                </div>
                <div id="tab8" class="tab-pane fade">
                    <!--还款计划-->
                    <h5><strong>还款计划</strong></h5>
                    <table class="table table-bordered table-striped">
                        <tr>
                            <th style="text-align: center">还款期数</th>
                            <th style="text-align: center">应还日期</th>
                            <th style="text-align: center">应还款利息 </th>
                            <th style="text-align: center">应还款本金 </th>
                            <th style="text-align: center">逾期罚息</th>
                            <th style="text-align: center">状态 </th>
                            <th style="text-align: center">已还款总金额</th>
                            <th style="text-align: center">剩余待还金额</th>
                            <th style="text-align: center">还款类型</th>
                            <th style="text-align: center">实际还款日期</th>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <table id="operation-history" width="100%" class="bg-info font12">
            <thead>
            <tr>
                <th width="15%">操作记录</th>
                <th width="15%">操作人</th>
                <th>操作时间</th>
                <th>备注</th>
            </tr>
            </thead>
            <tbody id="logcontent">
            <tr>
                <td>操作记录</td>
                <td>操作人</td>
                <td>操作时间</td>
                <td>备注</td>
            </tr>
            </tbody>
        </table>
    </div><!-- Modal -->
    <div class="modal fade" id="myModal-repay" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">还款确认</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="repayForm">
                        <input type="hidden" id="repayLoanId" name="loanId">
                        <div class="form-group">
                            <label  class="col-sm-4 control-label">还款类型：</label>
                            <div class="col-sm-6">
                                <select class="form-control" name="repaymentType">
                                    <option value="1">正常还款</option>
                                    <option value="2">提前还款</option>
                                    <option value="3">部分还款</option>
                                    <option value="4">逾期还款</option>
                                    <option value="5">处置还款</option>
                                    <option value="6">部分结清</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">当期应还款金额：</label>
                            <div class="col-sm-6">
                                <label class="control-label" id="expectAmount"></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">还款时间：</label>
                            <div class="col-sm-6">
                                <input id="" name="repaymentTime" class="Wdate" onfocus="WdatePicker({readOnly:true,maxDate:'%y-%M-%d'})" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">实际还款金额：</label>
                            <div class="col-sm-6">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="带入值可修改" id="actualAmount" name="actualAmount">
                                    <div class="input-group-addon">元</div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">还款凭证附件：</label>
                            <div class="col-sm-6">
                                <label><input type="file" name="file"></label>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal" id="confirmRepayBtn">确认还款</button>
                    <button type="button" class="btn btn-info"  data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 结清确认 -->
    <div class="modal fade" id="myModal-cleared" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">结清确认</h4>
                </div>
                <div class="modal-body">
                    <p class="text">
                        经销商&nbsp;<b id="clearedName"></b>&nbsp;的贷款合同编号&nbsp;<b id="clearedLoanNo"></b>&nbsp;的贷款已全部结清
                    </p>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="clearedTid">
                    <button type="button" class="btn btn-primary" data-dismiss="modal" id="confirmCleared">确认结清</button>
                    <button type="button" class="btn btn-info" data-dismiss="modal">取消</button>
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
<!-- endbuild -->
<!-- my97 -->
<script src="${ctxStatic}/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">

    // 全选
    $("#checkAll").click(function () {
        if($(this).prop('checked')){
            $('input[name="batchRepaymentCheckbox"]').prop("checked","checked");
        }else{
            $('input[name="batchRepaymentCheckbox"]').prop("checked","");
        }
    });

    $('input[name="batchRepaymentCheckbox"]').click(function () {
        if($(this).prop('checked')){
            $("#checkAll").prop("checked","checked");
        } else {
            $("#checkAll").prop("checked", "");
        }
    });

    // 批量还款
    $("#batchRepayment").click(function () {

        var tidArray = [];
        $('input[name="batchRepaymentCheckbox"]').each(function () {
            if($(this).prop('checked')) {
                tidArray.push($(this).val());
            }
        });
        if (tidArray.length > 0) {
            $.ajax({
                type:'GET',
                url:'/loan/repayment/' + tidArray.join(),
                success: function(data) {
                    alert(data.message);
                    alert(data.code);
                }
            });
        } else {
            //
        }
    });

    // 点击结清按钮，设置结清弹框内容
    function setCleardValues(name, loanNo, tid) {
        $("#clearedName").text(name);
        $("#clearedLoanNo").text(loanNo);
        $("#clearedTid").val(tid);
    }

    // 确认结清
    $("#confirmCleared").click(function () {

        var tid = $("#clearedTid").val();
        $.ajax({
            type:'GET',
            url:'/loan/cleared/'+tid,
            success: function(data){
                window.location.href='/loan/cleared/list'
            },
            error:function(){
                alert(123);
            }
        });
    });


    // 点击还款按钮，设置还款内容
    function setRepayValues(tid, amount){
        $("#repayLoanId").val(tid);
        $("#expectAmount").text(amount);
        $("#actualAmount").val(amount);
    }


    // 查询操作记录，并赋值
    function findOperateLog(tid) {
        $.ajax({
            url: '/logs/1/' + tid,
            type:'GET',
            success: function(data) {
                var array = data.data;

                $("#logcontent").empty();

                for(var i = 0; i < array.length; i++) {
                    var operateItem = "<td>" + array[i].operateItem + "<td>";
                    var operatorName = "<td>" + array[i].operatorName + "<td>";
                    var operateTime = "<td>" + array[i].operateTime + "<td>";
                    var remark = "<td>" + array[i].remark + "<td>";

                    var content = "<tr>" + operateItem + operatorName + operateTime + remark +"</tr>";

                    $("#logcontent").append(content);

                }

            }
        });
    }


    /**
     *获得进件模块
     * 客户信息、公司经营信息、贷款记录、附件
     * @param code
     */
    function selectDetail(code){
        $.get("/api/customer/" + code,
            function(data){
                $('#cusName1').text(data.pernInfo.cusName);
                $('#gender1').text(data.pernInfo.gender);
                $('#nation1').text(data.pernInfo.nation);
                $('#homeAddr1').text(data.pernInfo.homeAddr);
                $('#idCardNo1').text(data.pernInfo.idCardNo);
                $('#jobAddr1').text(data.pernInfo.jobAddr);
                $('#jobTime1').text(data.pernInfo.jobTime);
                $('#duty1').text(data.pernInfo.duty);
                $('#phone1').text(data.pernInfo.phone);
                $('#offPhone1').text(data.pernInfo.offPhone);
                $('#jobContact1').text(data.pernInfo.jobContact);
                $('#jobContPhone1').text(data.pernInfo.jobContPhone);
                $('#mateName1').text(data.othContInfo.mateName);
                $('#mateIdCard1').text(data.othContInfo.mateIdCard);
                $('#matePhone1').text(data.othContInfo.matePhone);
                $('#relationship1').text(data.othContInfo.relationship);
                $('#children1').text(data.othContInfo.children);
                $('#dbCompany1').text(data.assuInfo.dbCompany);
                $('#dbCorporation1').text(data.assuInfo.dbCorporation);
                $('#dbPhone1').text(data.assuInfo.dbPhone);
                $('#pdType1').text(data.dealInfo.pdType);
                $('#rate1').text(data.dealInfo.rate);
                $('#maxMoney1').text(data.dealInfo.maxMoney);
                $('#regName1').text(data.compInfo.regName);
                $('#regMoney1').text(data.compInfo.regMoney);
                $('#corporation1').text(data.compInfo.corporation);
                $('#legalIdCard1').text(data.compInfo.legalIdCard);
                $('#regAddr1').text(data.compInfo.regAddr);
                $('#orgCode1').text(data.compInfo.orgCode);
                $('#workPhone1').text(data.compInfo.workPhone);
                $('#regCode1').text(data.compInfo.regCode);
                $('#financePhone1').text(data.compInfo.financePhone);
                $('#admCode1').text(data.compInfo.admCode);
                $('#postalAddr1').text(data.compInfo.postalAddr);
                $('#creditCard1').text(data.compInfo.creditCard);
                $('#zipCode1').text(data.compInfo.zipCode);
                $('#empCount1').text(data.finaInfo.empCount);
                $('#houseWorth1').text(data.finaInfo.houseWorth);
                $('#carportCnt1').text(data.storInfo.carportCnt);
                $('#monthAvgSales1').text(data.finaInfo.monthAvgSales);
                $('#monthAvgCnt1').text(data.finaInfo.monthAvgCnt);
                $('#todayStock1').text(data.finaInfo.todayStock);
                $('#maxStock1').text(data.finaInfo.maxStock);
                $('#monthAvgStock1').text(data.finaInfo.monthAvgStock);
                $('#address1').text(data.storInfo.address);
                $('#attachName1').text(data.fileInfo.attachName);
                document.getElementById("attachUrl1").href=data.fileInfo.attachUrl;
                //$('#attachUrl').attr("attachUrl",data.fileInfo.attachUrl);
            });
    }


    /**
     * 获得进件模块
     * 车辆入库信息
     */
    function setCarInfo(loanNo) {
        var url = '/api/car/' + loanNo;
        $.get(url, function(data){
            console.log(data);
        });

    }

    // 设置放款信息
    function setLoanRelease(loanNo) {
        var url = '/loan/release/' + loanNo;
        $.get(url, function(data){
            var d = data.data;
            $("#tab-lendAmount").text(d.lendAmount);
            $("#tab-lendBy").text(d.createBy);
            $("#tab-lendTime").text(formatDateTime(d.lendTime));
        })

    }

    // 设置还款计划
    function setRepaymentPlan(loanNo) {
        var url = '/'
    }

    // 点击合同编号链接，显示内容
    function showTabConent(custcode, loanNo, tid) {
        selectDetail(custcode);
        setCarInfo(loanNo);

        // 查询操作记录
        findOperateLog(tid);

        // 设置放款信息
        setLoanRelease(loanNo);
        // 设置还款计划
        setRepaymentPlan(loanNo);
    }

    function formatDateTime(inputTime,type) {
        var date = new Date(inputTime);
        var y = date.getFullYear();
        var m = date.getMonth() + 1;
        m = m < 10 ? ('0' + m) : m;
        var d = date.getDate();
        d = d < 10 ? ('0' + d) : d;
        var h = date.getHours();
        h = h < 10 ? ('0' + h) : h;
        var minute = date.getMinutes();
        var second = date.getSeconds();
        minute = minute < 10 ? ('0' + minute) : minute;
        second = second < 10 ? ('0' + second) : second;
        //return y + '-' + m + '-' + d+' '+h+':'+minute+':'+second;
        return type==='hms'?(y + '-' + m + '-' + d+' '+h+':'+minute+':'+second):(y + '-' + m + '-' + d);
    }

</script>
