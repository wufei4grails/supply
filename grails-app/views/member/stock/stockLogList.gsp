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
          <legend class="">${stock.goods_name}库存明细</legend>
        </div></fieldset>


        <table class="table table-hover">
          <thead>
            <tr>
              <th>时间</th>
	      <th>进出库</th>
              <th>数量</th>
              
	      <th>当前库存</th>
	      <th>订单</th>
            </tr>
          </thead>
          <tbody>
		  <g:each in="${stockLogList}" status="i" var="stocklog">
			  <tr>
				<td>${stocklog.dateCreated}</td>
				<td>
					<stock:stockType type="${stocklog.stock_type}"/>
				</td>
				<td>${stocklog.num}</td>
				
				<td>${stocklog.actnum}</td>
				<td>
				<g:if test="${stocklog.stock_type=='in'}">
					<g:link controller="order" action="storeOrderDetail" id="${stocklog.attach_id}">${stocklog.attach_sn}</g:link>
				</g:if>
				<g:if test="${stocklog.stock_type=='out'}">
					<g:link controller="order" action="storeSaleOrderDetail" id="${stocklog.attach_id}">${stocklog.attach_sn}</g:link>
				</g:if>
					
					</td>
			      </tr>
			  
		  </g:each>
            
          </tbody>
        </table>
        <div class="pagination pagination-right new-pagination">
          <g:if test="${stockLogTotal != 0}">
                <util:remotePaginate total="${stockLogTotal}"  params="${params}" controller="stock" action="stocklog"  update="page" />
           </g:if>
            
            <span class="currentStep">共${stockLogTotal}条数据</span>
        </div>
      </div><!--/span-->
    </div><!--/row-->


    <g:render template="/layouts/company_footer"/>

  </div> <!-- /container -->

</body>

</html>

