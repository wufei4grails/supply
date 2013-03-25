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

    <g:render template="/layouts/company_header"/>


    <div class="row-fluid">
      <div class="span3">
        <div class="well sidebar-nav">
          <ul class="nav nav-list">
            <!--<li class="nav-header">Sidebar</li>-->
            <li><a href="goodsPub">发布新商品</a></li>
            <li ><a href="upGoodsList">上架商品列表</a></li>
            <li class="active"><a href="downGoodsList">下架商品列表</a></li>
            <li><a href="goodsCategoryList">商品分类列表</a></li>
          </ul>
        </div><!--/.well -->
      </div><!--/span-->
      <div class="span9">
        <div id="legend" class="">
          <legend class="">下架商品列表</legend>
        </div>

        <form class="form-inline">
          商品名称：<input type="text" class="input-small" placeholder="商品名称">
          商品编号：<input type="text" class="input-small" placeholder="商品编号">
          <button type="submit" class="btn">搜索</button>
        </form>


        <table class="table table-hover">
          <thead>
            <tr>
              <th>商品名称</th>
              <th>商品编号</th>
              <th>价格</th>
              <th>操作</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>东北大米</td>
              <td>g0112</td>
              <td>100</td>
              <td><a href="goodsUpdate">修改</a></td>
            </tr>
            <tr>
              <td>小南国黑米</td>
              <td>g0113</td>
              <td>500</td>
              <td><a href="goodsUpdate">修改</a></td>
            </tr>
            <tr>
              <td>望江银鱼</td>
              <td>g0114</td>
              <td>568</td>
              <td><a href="goodsUpdate">修改</a></td>
            </tr>
            <tr>
              <td>武昌湖大闸蟹</td>
              <td>g0115</td>
              <td>1898</td>
              <td><a href="goodsUpdate">修改</a></td>
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

