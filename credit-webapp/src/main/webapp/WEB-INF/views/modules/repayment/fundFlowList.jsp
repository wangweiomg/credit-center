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
    <li class="active"><a href="#home" data-toggle="tab"> 资金流向列表</a></li>
    <%--<li><a href="#profile" data-toggle="tab">新增客户</a></li>--%>
</ul>
<div id="tab-content" class="tab-content">
    <div id="home" class="tab-pane fade active in">
        <div class="alert alert-block">
            <div class="content">
                <label for="out" class="col-sm-2 control-label">累计放款：</label>
                <h2 id="out" >${amountTotal.releaseAmountTotal} 元</h2>
            </div>
            <div class="content">
                <label for="in" class="col-sm-2 control-label">累计收款：</label>
                <h2 id="in" >${amountTotal.incomeAmountTotal} 元</h2>
            </div>
        </div>
        <div class="alert alert-danger">
            <form class="form-inline" method="get" action="/fundFlow/list">
                <div class="form-group">
                    <select class="form-control" name="productType">
                        <option>产品类型</option>
                        <option>定期</option>
                        <option>活期</option>
                    </select>
                </div>
                <div class="form-group">
                    <select class="form-control" name="productType">
                        <option>资金操作</option>
                        <option>放款</option>
                        <option>还款</option>
                    </select>
                </div>
                <div class="form-group">
                    <select class="form-control" name="productType">
                        <option>资金类型</option>
                        <option>本金</option>
                        <option>利息</option>
                        <option>逾期罚息</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="sdate">时间:</label>
                    <input id="sdate" name="applyTimeStart" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,maxDate:'#F{$dp.$D(\'edate\')}'})" />
                    -
                    <input id="edate" name="applyTimeEnd" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,minDate:'#F{$dp.$D(\'sdate\')}',startDate:'#F{$dp.$D(\'sdate\',{d:+1})}'})" />
                </div>


                <button type="submit" class="btn btn-primary">查询</button>
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
                <th>时间</th>
                <th>产品类型</th>
                <th>资金操作</th>
                <th>合同金额</th>
                <th>资金类型</th>
                <th>备注</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${result.paging.list}" var="fundFlow" varStatus="status">
                <tr>
                    <th scope="row">${status.index + 1}</th>
                    <td><a href="javascript:;" class="add-tab" onclick="showTabConent('${fundFlow.customerCode}', '${fundFlow.loanNo}')">${fundFlow.loanNo}</a></td>
                    <td><fmt:formatDate value="${fundFlow.operateTime}" pattern="yyyy-MM-dd"/></td>
                    <td>${fundFlow.productName}</td>
                    <td>${fundFlow.operateType}</td>
                    <td>${fundFlow.contractAmount}</td>
                    <td>${fundFlow.fundType}</td>
                    <td>${fundFlow.remark}</td>
                </tr>

            </c:forEach>

            </tbody>
        </table>
        <nav>
            <ul class="pagination">
                <li><a href="${ctx}loan/list/1?pageNum=1">首页</a></li>
                <c:if test="${result.paging.pageNum > 1}">
                    <li><a href="${ctx}loan/list/1?pageNum=${result.paging.pageNum - 1}" aria-label="Previous">&laquo;</a></li>
                    <li><a href="${ctx}loan/list/1?pageNum=${result.paging.pageNum - 1}">${result.paging.pageNum - 1}</a></li>
                </c:if>
                <li class="active"><a href="javascript:;">${result.paging.pageNum}</a></li>

                <c:if test="${result.paging.pageNum + 1 <= result.paging.pageCount}">
                    <li><a href="${ctx}loan/list/1?pageNum=${result.paging.pageNum + 1}">${result.paging.pageNum + 1}</a></li>
                    <li><a href="${ctx}loan/list/1?pageNum=${result.paging.pageNum + 1}" aria-label="Next">&raquo;</a></li>
                </c:if>
                <li><a href="${ctx}loan/list/1">最后一页</a></li>
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
        <div class="sui-steps-round" hidden="hidden">
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
                <li class="active"><a href="#tab1" data-toggle="tab"> 客户信息</a></li>
                <li><a href="#tab2" data-toggle="tab">公司经营信息</a></li>
                <li><a href="#tab5" data-toggle="tab">贷款车辆&入库情况</a></li>
                <li><a href="#tab4" data-toggle="tab">贷款记录</a></li>
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
                            <th style="text-align: center">文件</th>
                        </tr>
                        <tr>
                            <td><span id="attachName1"></span></td>
                            <td><a href="" id="attachUrl1">查看</a></td>
                        </tr>
                    </table>
                </div>
                <div id="tab4" class="tab-pane fade">
                    <table class="table table-bordered table-striped">
                        <tr>
                            <th style="text-align: center">合同编号</th>
                            <th style="text-align: center">贷款申请时间</th>
                            <th style="text-align: center">贷款金额</th>
                            <th style="text-align: center">放款时间</th>
                            <th style="text-align: center">贷款状态</th>
                            <th style="text-align: center">贷款结清时间</th>
                        </tr>
                    </table>
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
                    <table class="table table-bordered table-striped">
                        <tr>
                            <th style="text-align: center">合同</th>
                        </tr>
                    </table>
                </div>
                <div id="tab7" class="tab-pane fade">
                    <!--放款信息-->
                    <h5><strong>放款信息</strong></h5>
                    <ul class="list-unstyled">
                        <li class="row form-inline no-gutter">
                            <span class="col-md-3">
                                <div class="form-group">
                                    <label>放宽金额：</label> <span>田玉华</span>
                                </div>
							</span>
                        </li>
                        <li class="row form-inline no-gutter"><span class="col-md-3">
                                <div class="form-group">
                                    <label>放款时间：</label> <span>田玉华</span>
                                </div>
							</span>
                        </li>
                        <li class="row form-inline no-gutter"><span class="col-md-3">
                                <div class="form-group">
                                    <label>放款人：</label> <span>田玉华</span>
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
    </div><!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">还款确认</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label  class="col-sm-4 control-label">还款类型：</label>
                            <div class="col-sm-6">
                                <select class="form-control">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">当期应还款金额：</label>
                            <div class="col-sm-6">
                                <label class="control-label">带入值</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">还款时间：</label>
                            <div class="col-sm-6">
                                <select class="form-control">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">实际还款金额：</label>
                            <div class="col-sm-6">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="带入值可修改">
                                    <div class="input-group-addon">元</div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">还款凭证附件：</label>
                            <div class="col-sm-6">
                                <label><input type="file" class="hidden"><span class="btn btn-default">选择文件</span></label>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">确认还款</button>
                    <button type="button" class="btn btn-info">取消</button>
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

    /**
     *获得进件模块
     * 客户信息、公司经营信息、贷款记录、附件
     * @param code
     */
    function selectDetail(code){
        $.get("/api/customer/" + code,
            function(data){
                console.log(data);
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

    // 点击合同编号链接，显示内容
    function showTabConent(custcode, loanNo) {
        selectDetail(custcode);
        setCarInfo(loanNo);

    }
</script>
