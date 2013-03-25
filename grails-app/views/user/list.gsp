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

  <div class="container" id="page">

    <g:render template="/layouts/company_header"/>


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
        
        <g:form action="list" class="form-inline" >
          用户名：<input type="text" name="name" class="input-small" placeholder="用户名">
          <button type="submit" class="btn">搜索</button>
        </g:form>
        
        
        <table class="table table-hover">
          <thead>
            <tr>
              <th>用户名</th>
              <th>联系人</th>
              <th>联系电话</th>
              <th>地址</th>
              <!--<th>操作</th>-->
            </tr>
          </thead>
          <tbody >
          <g:each in="${userInstanceList}" status="i" var="userInstance">
            <tr>
              <td>${fieldValue(bean: userInstance, field: "name")}</td>
              <td>赵大国${userInstanceTotal}</td>
              <td>16789098765</td>
              <td>天柱路118＃</td>
              <!--<td>查看</td>-->
            </tr>
          </g:each>
          </tbody>
        </table>
        <div  class="pagination pagination-right new-pagination">
          <util:remotePaginate controller="user" action="list" total="${userInstanceTotal}"
                               update="page" />
      <!--<bs:paginate total="${userInstanceTotal}" />-->
        </div>
      </div><!--/span-->
    </div><!--/row-->


    <g:render template="/layouts/company_footer"/>

  </div> <!-- /container -->
  
</body>

</html>

