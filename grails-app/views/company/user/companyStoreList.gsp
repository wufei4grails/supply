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

    <g:render template="/layouts/header"/>


    <div class="row-fluid">
      <div class="span3">
        <div class="well sidebar-nav">
          <g:render template="/layouts/leftmenu"/>
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
            <g:each in="${storeInstanceList}" status="i" var="store">
              <tr>
              <td>${fieldValue(bean: store, field: "store_name")}</td>
              <td>${fieldValue(bean: store, field: "contact_person")}</td>
              <td>${fieldValue(bean: store, field: "contact_phone")}</td>
              <td>${fieldValue(bean: store, field: "address")}</td>
              <!--<td>查看</td>-->
            </tr>
            </g:each>
            
          </tbody>
        </table>
        <div  class="pagination pagination-right new-pagination">
          <util:remotePaginate controller="user" action="companyStoreList" total="${storeInstanceTotal}" update="page" />
        </div>
      </div><!--/span-->
    </div><!--/row-->


    <g:render template="/layouts/footer"/>

  </div> <!-- /container -->

</body>

</html>

