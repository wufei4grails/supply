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
          <legend class="">采购订单列表</legend>
        </div></fieldset>
	<g:form class="form-inline" name="myForm" action="storeOrderList" >
        
          订单编号：<input value='${params.order_sn}' type="text" name="order_sn" class="input-small" placeholder="订单编号">
          状态：
	  <!--waitpay,waitship,waitconfirm,success,notpayclose,notshipclose-->
	  <g:select class="input-medium" value="${params.status}" name="status" optionKey="status" optionValue="queryShow" from="${[[status:"",queryShow:"全部"],[status:"waitpay",queryShow:"未付款"],[status:"waitship",queryShow:"已付款，等待发货"],[status:"waitconfirm",queryShow:"已发货，等待收货确认"],[status:"success",queryShow:"已完成"],[status:"notpayclose",queryShow:"付款超时取消"],[status:"notshipclose",queryShow:"发货超时取消"]]}" />



          <button type="submit" class="btn">搜索</button>
        </g:form>


        <table class="table table-hover">
          <thead>
            <tr>
              <th>订单号</th>
              <th>金额</th>
              <th>状态</th>
              <th>下单时间</th>
              <th>操作</th>
            </tr>
          </thead>
          <tbody>
		  <g:each in="${orderList}" status="i" var="order">
			  <tr>
				<td>${order.order_sn}</td>
				<td>${order.amount}</td>
				<td><order:orderStatusDic status="${order.status}"/></td>
				<td>${order.dateCreated}</td>
				<td>
					<g:link controller="order" action="storeOrderDetail" id="${order.id}">查看</g:link>
					<g:if test="${order.status=='waitpay'}">
					<g:link controller="shopping" action="reqPayOrder" params="[order_sn: order.order_sn]">付款</g:link>
					</g:if>
				</td>
			      </tr>
			  
		  </g:each>
            
          </tbody>
        </table>
        <div class="pagination pagination-right new-pagination">
          <g:if test="${orderTotal != 0}">
                <util:remotePaginate total="${orderTotal}"  params="${params}" controller="order" action="storeOrderList"  update="page" />
           </g:if>
            
            <span class="currentStep">共${orderTotal}条数据</span>
        </div>
      </div><!--/span-->
    </div><!--/row-->


    <g:render template="/layouts/company_footer"/>

  </div> <!-- /container -->

</body>

</html>

