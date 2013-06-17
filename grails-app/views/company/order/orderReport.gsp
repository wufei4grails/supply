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



    <div class="row-fluid">
      <div class="span12">
	      <fieldset>
        <div id="legend" class="">
          <legend class="">采购订单列表</legend>
        </div>
		      </fieldset>
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
				<td>${order.dateCreated.toString()[0..18]}</td>
				<td>
					<g:link controller="order" action="companyOrderDetail" id="${order.id}">查看</g:link>
				</td>
			      </tr>
			  
		  </g:each>
            
          </tbody>
        </table>
      </div><!--/span-->
    </div><!--/row-->


    <g:render template="/layouts/company_footer"/>

  </div> <!-- /container -->

</body>

</html>

