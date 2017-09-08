<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1,,maximum-scale=1,user-scalable=no">
    <title>车辆信息</title>
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
        <label><strong>新增车辆</strong><br>业务专员（李苗苗）</label>
        </div>
        <div class="current">
        <div class="wrap">
        <div class="round">2</div>
        <div class="bar"></div>
        </div>
        <label><strong>审核车辆</strong><br></label>
        </div>
        <div class="todo">
        <div class="wrap">
        <div class="round">3</div>
        <div class="bar"></div>
        </div>
        <label><strong>评估车辆</strong><br></label>
        </div>
        <div class="todo last">
        <div class="">
        <div class="round">4</div>
        </div>
        <label><strong>评估车辆审核</strong><br></label>
        </div>
        </div>
        <div class="content">
          <ul class="nav nav-pills">
            <li class="active"><a href="#tab1" data-toggle="tab"> 客户信息</a></li>
            <li><a href="#tab3" data-toggle="tab">附件</a></li>
          </ul>
          <div class="tab-content">
            <div id="tab1" class="tab-pane fade active in">
              <h5><strong>实际控制</strong></h5>
              <ul class="list-unstyled">
                <li class="row form-inline no-gutter"><span class="col-md-4">
                    <div class="form-group">
                    <label>所属经销商：</label>
                    <span id='custInfoId'>${carInfo.custInfoId }</span>
                    </div></span><span class="col-md-4">
                    <div class="form-group">
                    <label>&emsp;&emsp;钥匙编号：</label>
                    <span id='keyCode'>${carInfo.keyCode }</span>
                    </div></span><span class="col-md-4">
                <li class="row form-inline no-gutter"><span class="col-md-4">
                    <div class="form-group">
                    <label>车架号：</label>
                    <span id='carriageCode'>${carInfo.carriageCode }</span>
                    </div></span><span class="col-md-4">
                    <div class="form-group">
                    <label>&emsp;&emsp;钥匙数量：</label>
                    <span id='keyCnt'>${carInfo.keyCnt }</span>
                    </div></span><span class="col-md-4">
                <li class="row form-inline no-gutter"><span class="col-md-4">
                    <div class="form-group">
                    <label>发动机号：</label>
                    <span id='motorCode'>${carInfo.motorCode }</span>
                    </div></span><span class="col-md-4">
                    <div class="form-group">
                    <label>&emsp;&emsp;业务员：</label>
                    <span id='salesman'>${carInfo.salesman }</span>
                    </div></span><span class="col-md-4">
                <li class="row form-inline no-gutter"><span class="col-md-4">
                    <div class="form-group">
                    <label>合格证编号：</label>
                    <span id='cfNumber'>${carInfo.cfNumber }</span>
                    </div></span><span class="col-md-4">
                    <div class="form-group">
                    <label>&emsp;&emsp;业务员电话：</label>
                    <span id=salesmanPhone>${carInfo.salesmanPhone }</span>
                    </div></span><span class="col-md-4">
                <li class="row form-inline no-gutter"><span class="col-md-4">
                    <div class="form-group">
                    <label>合格证出厂日期：</label>
                    <span id='cfOutDate'>${carInfo.cfOutDate }</span>
                    </div></span><span class="col-md-4">
               <li class="row form-inline no-gutter"><span class="col-md-4">
                    <div class="form-group">
                    <label>车型：</label>
                    <span id='carBrand'>${carInfo.carBrand }</span>
                    </div></span><span class="col-md-4">
               <li class="row form-inline no-gutter"><span class="col-md-4">
                    <div class="form-group">
                    <label>颜色：</label>
                    <span id='color'>${carInfo.color }</span>
                    </div></span><span class="col-md-4">
				<li class="row form-inline no-gutter"><span class="col-md-4">
                    <div class="form-group">
                    <label>车型尺寸：</label>
                    <span id='length'>${carInfo.length }</span>
                    </div></span><span class="col-md-4">                                      
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
        <div style="padding-top: 10px;"></div>
      </div>
</body>
</html>