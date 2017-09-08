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
<input type="hidden" value="客户详情" id="addTabTitle">
<ul id="nav-tabs" class="nav nav-tabs">
    <li class="active"><a href="#home" data-toggle="tab"> 待放款列表</a></li>
    <%--<li><a href="#profile" data-toggle="tab">新增客户</a></li>--%>
</ul>
<div id="tab-content" class="tab-content">
    <div id="home" class="tab-pane fade active in">
        <div class="alert alert-danger" hidden="hidden">
            <form class="form-inline">
                <div class="form-group">
                    <select class="form-control">
                        <option>经销商</option>
                        <option>2</option>
                    </select>
                </div>
                <div class="form-group">
                    <select class="form-control">
                        <option>业务员</option>
                        <option>2</option>
                    </select>
                </div>
                <div class="form-group">
                    <select class="form-control">
                        <option>区域</option>
                        <option>2</option>
                    </select>
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
                <th>经销商名称</th>
                <th>贷款车数量</th>
                <th>评估车辆金额</th>
                <th>合同金额</th>
                <th>产品类型</th>
                <th>利息</th>
                <th>贷款周期</th>
                <th>待放款金额</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${result.paging.list}" var="loan" varStatus="status">
                <tr>
                    <th scope="row">${status.index + 1}</th>
                    <td><a href="javascript:;" class="add-tab">${loan.loanNo}</a></td>
                    <td>${loan.customerName}</td>
                    <td>${loan.loanCarCount}</td>
                    <td>${loan.carEvaluateAmount}</td>
                    <td>${loan.contractAmount}</td>
                    <td>${loan.productName}</td>
                    <td>${loan.rate}</td>
                    <td>${loan.loanPeriod}</td>
                    <td>${loan.contractAmount}</td>
                    <td><a href="#" data-toggle="modal" data-target="#myModal">放款</a></td>

                </tr>

            </c:forEach>

            </tbody>
        </table>
        <nav>
            <ul class="pagination">
                <li><a href="${ctx}loan/pending/list?pageNum=1">首页</a></li>
                <c:if test="${result.paging.pageNum > 1}">
                    <li><a href="${ctx}loan/pending/list?pageNum=${result.paging.pageNum - 1}" aria-label="Previous">&laquo;</a></li>
                    <li><a href="${ctx}loan/pending/list?pageNum=${result.paging.pageNum - 1}">${result.paging.pageNum - 1}</a></li>
                </c:if>
                <li class="active"><a href="javascript:;">${result.paging.pageNum}</a></li>

                <c:if test="${result.paging.pageNum + 1 <= result.paging.pageCount}">
                    <li><a href="${ctx}loan/pending/list?pageNum=${result.paging.pageNum + 1}">${result.paging.pageNum + 1}</a></li>
                    <li><a href="${ctx}loan/pending/list?pageNum=${result.paging.pageNum + 1}" aria-label="Next">&raquo;</a></li>
                </c:if>
                <li><a href="${ctx}loan/pending/list?pageNum=${result.paging.pageCount}">最后一页</a></li>
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
                <li class="active"><a href="#tab1" data-toggle="tab"> 客户信息</a></li>
                <li><a href="#tab2" data-toggle="tab">公司经营信息</a></li>
                <li><a href="#tab3" data-toggle="tab">附件</a></li>
            </ul>
            <div class="tab-content">
                <div id="tab1" class="tab-pane fade active in">
                    <h5><strong>实际控制</strong></h5>
                    <ul class="list-unstyled">
                        <li class="row form-inline no-gutter"><span class="col-md-3">
                    <div class="form-group">
                    <label>配偶姓名：</label>
                    <span>田玉华</span>
                    </div></span><span class="col-md-3">
                    <div class="form-group">
                    <label>身份证号：</label>
                    <span>田玉华</span>
                    </div></span><span class="col-md-3">
                    <div class="form-group">
                    <label>联系电话：</label>
                    <span>田玉华</span>
                    </div></span></li>
                        <li class="row form-inline no-gutter"><span class="col-md-3">
                    <div class="form-group">
                    <label>配偶姓名：</label>
                    <span>田玉华</span>
                    </div></span><span class="col-md-3">
                    <div class="form-group">
                    <label>身份证号：</label>
                    <span>田玉华</span>
                    </div></span><span class="col-md-3">
                    <div class="form-group">
                    <label>联系电话：</label>
                    <span>田玉华</span>
                    </div></span></li>
                        <li class="row form-inline no-gutter"><span class="col-md-3">
                    <div class="form-group">
                    <label>配偶姓名：</label>
                    <span>田玉华</span>
                    </div></span><span class="col-md-3">
                    <div class="form-group">
                    <label>身份证号：</label>
                    <span>田玉华</span>
                    </div></span><span class="col-md-3">
                    <div class="form-group">
                    <label>联系电话：</label>
                    <span>田玉华</span>
                    </div></span></li>
                        <li class="row form-inline no-gutter"><span class="col-md-3">
                    <div class="form-group">
                    <label>配偶姓名：</label>
                    <span>田玉华</span>
                    </div></span><span class="col-md-3">
                    <div class="form-group">
                    <label>身份证号：</label>
                    <span>田玉华</span>
                    </div></span><span class="col-md-3">
                    <div class="form-group">
                    <label>联系电话：</label>
                    <span>田玉华</span>
                    </div></span></li>
                        <li class="row form-inline no-gutter"><span class="col-md-3">
                    <div class="form-group">
                    <label>配偶姓名：</label>
                    <span>田玉华</span>
                    </div></span><span class="col-md-3">
                    <div class="form-group">
                    <label>身份证号：</label>
                    <span>田玉华</span>
                    </div></span><span class="col-md-3">
                    <div class="form-group">
                    <label>联系电话：</label>
                    <span>田玉华</span>
                    </div></span></li>
                    </ul>
                </div>
                <div id="tab2" class="tab-pane fade">
                    <h5><strong>实际控制</strong></h5>
                    <ul class="list-unstyled">
                        <li class="row form-inline no-gutter"><span class="col-md-3">
                    <div class="form-group">
                    <label>配偶姓名：</label>
                    <span>田玉华</span>
                    </div></span><span class="col-md-3">
                    <div class="form-group">
                    <label>身份证号：</label>
                    <span>田玉华</span>
                    </div></span><span class="col-md-3">
                    <div class="form-group">
                    <label>联系电话：</label>
                    <span>田玉华</span>
                    </div></span></li>
                        <li class="row form-inline no-gutter"><span class="col-md-3">
                    <div class="form-group">
                    <label>配偶姓名：</label>
                    <span>田玉华</span>
                    </div></span><span class="col-md-3">
                    <div class="form-group">
                    <label>身份证号：</label>
                    <span>田玉华</span>
                    </div></span><span class="col-md-3">
                    <div class="form-group">
                    <label>联系电话：</label>
                    <span>田玉华</span>
                    </div></span></li>
                    </ul>
                </div>
                <div id="tab3" class="tab-pane fade">098754erh</div>
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