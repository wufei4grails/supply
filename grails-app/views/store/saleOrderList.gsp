<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta name="layout" content="main"/>

</head>
<body>

  <div class="container">

    <g:render template="/layouts/store_header"/>


    <div class="row-fluid">
      <div class="span3">
        <div class="well sidebar-nav">
          <ul class="nav nav-list">
            <!--<li class="nav-header">Sidebar</li>-->
            <li class=""><a href="orderList">采购订单列表</a></li>
            <li class="active"><a href="saleOrderList">门店销售记录</a></li>
          </ul>
        </div><!--/.well -->
      </div><!--/span-->
      <div class="span9">
        <div id="legend" class="">
          <legend class="">门店销售记录</legend>
        </div>

<!--        <form class="form-inline">
          订单编号：<input type="text" class="input-small" placeholder="订单编号">
          门店：<input type="text" class="input-small" placeholder="门店">
          状态：
          <select class="input-medium">
            <option>未付款</option>
            <option>已付款</option>
            <option>已发货，等待收货确认</option>
            <option>已完成</option>
            <option>付款超时取消</option>
            <option>发货超时取消</option>
          </select>
          <button type="submit" class="btn">搜索</button>
        </form>-->


        <table class="table table-hover">
          <thead>
            <tr>
              <th>商品</th>
              <th>价格</th>
              <th>数量</th>
              <th>总计</th>
              <th>时间</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>普装南汇甜瓜</td>
              <td>100</td>
              <td>2</td>
              <td>200</td>
              <td>2013-3-8 13:34:33</td>
            </tr>
            <tr>
              <td>普装南汇甜瓜</td>
              <td>100</td>
              <td>2</td>
              <td>200</td>
              <td>2013-3-8 13:34:33</td>
            </tr>
            <tr>
              <td>普装南汇甜瓜</td>
              <td>100</td>
              <td>2</td>
              <td>200</td>
              <td>2013-3-8 13:34:33</td>
            </tr>
          </tbody>
        </table>
        <div class="pagination pagination-right">
          <ul>
            <li><a href="#">上一页</a></li>
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li><a href="#">下一页</a></li>
          </ul>
        </div>
      </div><!--/span-->
    </div><!--/row-->


    <g:render template="/layouts/company_footer"/>

  </div> <!-- /container -->

</body>

</html>

