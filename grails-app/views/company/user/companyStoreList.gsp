<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta name="layout" content="main"/>
  <r:require modules="bootstrap"/>

</head>
<body>

  <div class="container">

    <g:render template="/layouts/header"/>


    <div class="row-fluid">
      <div class="span3">
        <div class="well sidebar-nav">
          <ul class="nav nav-list">
            <!--<li class="nav-header">Sidebar</li>-->
            <li class="active"><a href="storeList">门店列表</a></li>
            <li><a href="storeCreate">分配门店账号</a></li>
          </ul>
        </div><!--/.well -->
      </div><!--/span-->
      <div class="span9">
        <div id="legend" class="">
          <legend class="">门店列表</legend>
        </div>
        <table class="table table-hover">
          <thead>
            <tr>
              <th>门店名称</th>
              <th>联系人</th>
              <th>联系电话</th>
              <th>地址</th>
              <!--<th>操作</th>-->
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>中粮蜀山店</td>
              <td>赵大国</td>
              <td>16789098765</td>
              <td>天柱路118＃</td>
              <!--<td>查看</td>-->
            </tr>
            <tr>
              <td>中粮梦园店</td>
              <td>小沈阳</td>
              <td>13378765678</td>
              <td>天通路333＃</td>
              <!--<td>查看</td>-->
            </tr>
            <tr>
              <td>中粮政务店</td>
              <td>大脚婶</td>
              <td>13378765678</td>
              <td>习友路2234＃</td>
              <!--<td>查看</td>-->
            </tr>
            <tr>
              <td>中粮经开区店</td>
              <td>张良</td>
              <td>13378765678</td>
              <td>小文路234＃</td>
              <!--<td>查看</td>-->
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


    <g:render template="/layouts/footer"/>

  </div> <!-- /container -->

</body>

</html>

