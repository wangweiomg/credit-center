<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1,,maximum-scale=1,user-scalable=no">
    <!--上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！-->
    <title>汽车金融业务系统</title>
    <meta name="keywords" content="#">
    <meta name="description" content="#">
    <meta name="author" content="#">
    <link rel="shortcut icon" href="${ctx}static/public/favicon.ico">
    <link rel="stylesheet" href="${ctx}static/public/libs/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctx}static/public/libs/bootstrap/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="${ctx}static/public/css/style-main.min.css"><!--[if lt IE 9]>
    <script src="/libs/html5shiv.min.js"></script>
    <![endif]-->
</head>
<body>
<div id="wrap">
    <header id="header">
        <h1><a href="javascript:;">汽车金融业务系统</a></h1>
        <ul class="links pull-right">
            <li><i class="ico ico-avotar"></i></li>
            <li>你好，</li>
            <li class="dropdown"><a href="javascript:;" data-toggle="dropdown" title="个人信息" class="dropdown-toggle">周林<i class="caret"></i></a>
                <ul class="dropdown-menu">
                    <li><a href="javascript:;">修改密码</a></li>
                    <li><a href="javascript:;">退出</a></li>
                </ul>
            </li>
        </ul>
    </header>
    <article id="container" class="clearfix">
        <section id="section">
            <iframe src="${ctx}home/list" width="100%" height="100%" frameborder="0" id="iframe"></iframe>
        </section>
        <aside id="aside">
            <div id="accordion" class="panel-group">
                <dl class="panel panel-default">
                    <dt role="tab" class="panel-heading active">
                        <h4 data-href="${ctx}home/list" role="button" data-toggle="collapse" data-parent="#accordion" href="#" aria-expanded="false" aria-controls="" class="panel-title noBody collapsed"><i class="ico ico-home"></i>首页</h4>
                    </dt>
                </dl>
                <dl class="panel panel-default">
                    <dt role="tab" class="panel-heading">
                        <h4 data-href="user/list.html" role="button" data-toggle="collapse" data-parent="#accordion" href="#11" aria-expanded="false" aria-controls="11" class="panel-title collapsed"><i class="ico ico-user"></i>客户管理</h4>
                    </dt>
                    <dd id="11" role="tabpanel" class="panel-collapse collapse panel-collapse collapse">
                        <div class="panel-body"><a data-href="user/list.html" href="javascript:;">客户列表</a><a data-href="user/list.html" href="javascript:;">客户列表</a>
                        </div>
                    </dd>
                </dl>
                <dl class="panel panel-default">
                    <dt role="tab" class="panel-heading">
                        <h4 data-href="user/list.html" role="button" data-toggle="collapse" data-parent="#accordion" href="#22" aria-expanded="false" aria-controls="22" class="panel-title collapsed"><i class="ico ico-car"></i>车辆管理</h4>
                    </dt>
                    <dd id="22" role="tabpanel" class="panel-collapse collapse panel-collapse collapse">
                        <div class="panel-body"><a data-href="user/list.html" href="javascript:;">车辆列表</a><a data-href="user/list.html" href="javascript:;">审核中车辆</a>
                        </div>
                    </dd>
                </dl>
                <dl class="panel panel-default">
                    <dt role="tab" class="panel-heading">
                        <h4 data-href="user/list.html" role="button" data-toggle="collapse" data-parent="#accordion" href="#" aria-expanded="false" aria-controls="" class="panel-title noBody collapsed"><i class="ico ico-house"></i>仓库管理</h4>
                    </dt>
                </dl>
                <dl class="panel panel-default">
                    <dt role="tab" class="panel-heading">
                        <h4 data-href="user/list.html" role="button" data-toggle="collapse" data-parent="#accordion" href="#33" aria-expanded="false" aria-controls="33" class="panel-title collapsed"><i class="ico ico-money"></i>资金管理</h4>
                    </dt>
                    <dd id="33" role="tabpanel" class="panel-collapse collapse panel-collapse collapse">
                        <div class="panel-body"><a data-href="user/list.html" href="javascript:;">贷款申请</a><a data-href="${ctx}loan/pending/list" href="javascript:;">待放款</a><a data-href="${ctx}loan/repayment/list" href="javascript:;">还款中</a><a data-href="${ctx}loan/cleared/list" href="javascript:;">已结清</a><a data-href="${ctx}/fundFlow/list" href="javascript:;">资金流向</a>
                        </div>
                    </dd>
                </dl>
                <dl class="panel panel-default">
                    <dt role="tab" class="panel-heading">
                        <h4 data-href="user/list.html" role="button" data-toggle="collapse" data-parent="#accordion" href="#44" aria-expanded="false" aria-controls="44" class="panel-title collapsed"><i class="ico ico-book"></i>档案管理</h4>
                    </dt>
                    <dd id="44" role="tabpanel" class="panel-collapse collapse panel-collapse collapse">
                        <div class="panel-body"><a data-href="user/list.html" href="javascript:;">待归档</a><a data-href="user/list.html" href="javascript:;">部分归档</a><a data-href="user/list.html" href="javascript:;">已归档</a>
                        </div>
                    </dd>
                </dl>
                <dl class="panel panel-default">
                    <dt role="tab" class="panel-heading">
                        <h4 data-href="user/list.html" role="button" data-toggle="collapse" data-parent="#accordion" href="#55" aria-expanded="false" aria-controls="55" class="panel-title collapsed"><i class="ico ico-safe"></i>风险管理</h4>
                    </dt>
                    <dd id="55" role="tabpanel" class="panel-collapse collapse panel-collapse collapse">
                        <div class="panel-body"><a data-href="${ctx}warn/loanlist" href="javascript:;">预警</a><a data-href="${ctx}urge/list" href="javascript:;">催收</a>
                        </div>
                    </dd>
                </dl>
                <dl class="panel panel-default">
                    <dt role="tab" class="panel-heading">
                        <h4 data-href="${ctx}inventory/findByPage" role="button" data-toggle="collapse" data-parent="#accordion" href="#" aria-expanded="false" aria-controls="" class="panel-title noBody collapsed"><i class="ico ico-house2"></i>人工盘库</h4>
                    </dt>
                </dl>
                <dl class="panel panel-default">
                    <dt role="tab" class="panel-heading">
                        <h4 data-href="user/list.html" role="button" data-toggle="collapse" data-parent="#accordion" href="#66" aria-expanded="false" aria-controls="66" class="panel-title collapsed"><i class="ico ico-sys"></i>系统管理</h4>
                    </dt>
                    <dd id="66" role="tabpanel" class="panel-collapse collapse panel-collapse collapse">
                        <div class="panel-body"><a data-href="user/list.html" href="javascript:;">用户管理</a><a data-href="user/list.html" href="javascript:;">角色及权限配置</a><a data-href="user/list.html" href="javascript:;">营业部管理</a><a data-href="user/list.html" href="javascript:;">产品配置</a>
                        </div>
                    </dd>
                </dl>
            </div>
        </aside><a href="javascript:;" id="slideBtn">&nbsp;</a>
    </article>
    <footer id="footer">Copyright © 2012-2017 backend-core - Powered By JeeSite V1.0.0</footer>
</div>
</body>
</html>
<script src="${ctx}static/public/libs/jquery-1.9.1.min.js"></script>
<script src="${ctx}static/public/libs/bootstrap/js/bootstrap.min.js"></script>
<!-- build:js -->
<script src="${ctx}static/public/js/base.js"></script>
<script src="${ctx}static/public/js/list.js"></script>
<!-- endbuild -->
