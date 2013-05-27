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
	      <fieldset>
		      <div id="legend" class="">
			      <legend class="">
				      收货地址列表
				      <g:link class="btn pull-right" action="reqAddAddress" >添加新收货地址</g:link>
			      </legend>

		      </div>
	      </fieldset>
        <g:if test="${flash.message}">
                <div class="alert alert-error">
                  <button type="button" class="close" data-dismiss="alert">&times;</button>
                  <strong>${flash.message}</strong>
                </div>
              </g:if>
        <table class="table table-hover">
          <thead>
            <tr>
              <th>收货人</th>
              <th>地区</th>
              <th>详细地址</th>
              <th>联系电话</th>
              <th>是否默认</th>
              <th>操作</th>
            </tr>
          </thead>
          <tbody>
            
            <g:each in="${addressList}" status="i" var="address">
              <tr id='${address.id}'>
                <td>${fieldValue(bean: address, field: "person_name")}</td>
                <td> <area:areaName id="${address.area_id}"/> </td>
                <td>${fieldValue(bean: address, field: "address")}</td>
                <td>${fieldValue(bean: address, field: "telphone")}</td>
                <td>
                  <g:if test="${address.is_default == '1'}">
                      是
                 </g:if>
                 <g:if test="${address.is_default == '0'}">
                      否
                 </g:if>
                </td>
                <td>
                  <g:link action="reqUpdateAddress" id="${fieldValue(bean: address, field: "id")}">修改</g:link>
                  <g:remoteLink before="return tip()" controller="member" action="delAddress"  id="${address.id}"  onComplete="delGoods(${address.id})">
                      删除
                      </g:remoteLink>
                </td>
              </tr>
            </g:each>
            
          </tbody>
        </table>
      </div><!--/span-->
    </div><!--/row-->


    <g:render template="/layouts/company_footer"/>

  </div> <!-- /container -->
  <script>
	  
	  function tip(){
		  
		  var f = confirm("是否确认删除收货地址");
		  if(!f){
			  return false;
		  }
	  }
	  
    function delGoods(o){
      jQuery("#"+o).remove();
      alert("收货地址已成功删除！");
    }
  </script>
</body>

</html>

