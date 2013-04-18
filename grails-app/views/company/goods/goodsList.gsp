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

  <div class="container" id="page">
<%
String baseUrl = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()
%>
    <g:render template="/layouts/header"/>


    <div class="row-fluid">
      <div class="span3">
        <div class="well sidebar-nav">
          <g:render template="/layouts/leftmenu"/>
        </div><!--/.well -->
      </div><!--/span-->
      <div class="span9">
        <div id="legend" class="">
          <legend class="">上架商品列表</legend>
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
            
            <g:each in="${goodsList}" status="i" var="goods">
              <tr>
                <td>${fieldValue(bean: goods, field: "goods_name")}</td>
                <td>${fieldValue(bean: goods, field: "goods_sn")}</td>
                <td>${fieldValue(bean: goods, field: "price")}</td>
                <td><g:link action="reqUpdateGoods" id="${fieldValue(bean: goods, field: "id")}">修改</g:link></td>
              </tr>
            </g:each>
            
          </tbody>
        </table>
        <div  class="pagination pagination-right new-pagination">
            <g:if test="${goodsTotal != 0}">
                <util:remotePaginate total="${goodsTotal}"  params="${params}" controller="goods" action="reqGoodsList"  update="page" />
           </g:if>
            
            <span class="currentStep">共${goodsTotal}条数据</span>
<!--            <util:remoteSortableColumn params="${params}" property="store_name" title="门店名称" update="page" controller="user" action="companyStoreList"/>
            <util:remoteSortableColumn params="${params}" property="dateCreated" title="创建时间" update="page" controller="user" action="companyStoreList"/>-->
          </div>
      </div><!--/span-->
    </div><!--/row-->


    <g:render template="/layouts/company_footer"/>

  </div> <!-- /container -->

</body>

</html>

