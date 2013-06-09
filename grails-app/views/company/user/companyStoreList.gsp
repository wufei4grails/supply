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
		<fieldset> 
          <div id="legend" class="">
            <legend class="">门店列表</legend>
          </div>
		</fieldset>
            
            
            <g:form  class="form-inline" controller="user" action="companyStoreList" method="post">
           
            门店名称：<input value="${params.store_name}" type="text" name="store_name" class="input-small" >
            <button type="submit" class="btn">搜索</button>
        </g:form>
          <table class="table table-hover">
            <thead>
              <tr>
                <th>门店名称</th>
                <th>联系人</th>
                <th>联系电话</th>
                <th>地区</th>
                <th>地址</th>
                <th>创建时间</th>
              </tr>
            </thead>
            <tbody>
            <g:each in="${storeInstanceList}" status="i" var="store">
              <tr>
                <td>${fieldValue(bean: store, field: "store_name")}</td>
                <td>${fieldValue(bean: store, field: "contact_person")}</td>
                <td>${fieldValue(bean: store, field: "contact_phone")}</td>
                <td><area:areaName id="${fieldValue(bean: store, field: 'area_id').toString()}"/></td>
                <td>${fieldValue(bean: store, field: "address")}</td>
                <td>${fieldValue(bean: store, field: "dateCreated").toString()[0..18]}</td>
              </tr>
            </g:each>

            </tbody>
          </table>
          <div  class="pagination pagination-right new-pagination">
            <g:if test="${storeInstanceTotal != 0}">
                <util:remotePaginate total="${storeInstanceTotal}"  params="${params}" controller="user" action="companyStoreList"  update="page" />
           </g:if>
            
            <span class="currentStep">共${storeInstanceTotal}条数据</span>
<!--            <util:remoteSortableColumn params="${params}" property="store_name" title="门店名称" update="page" controller="user" action="companyStoreList"/>
            <util:remoteSortableColumn params="${params}" property="dateCreated" title="创建时间" update="page" controller="user" action="companyStoreList"/>-->
          </div>
        </div><!--/span-->
      </div><!--/row-->


      <g:render template="/layouts/footer"/>

    </div> <!-- /container -->

  </body>

</html>

