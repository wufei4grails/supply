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
          <legend class="">门店库存</legend>
        </div></fieldset>
	<g:form class="form-inline" name="myForm" action="list" >
        
          商品：<input value='${params.goods_name}' type="text" name="goods_name" class="input-small" placeholder="商品名称">



          <button type="submit" class="btn">搜索</button>
        </g:form>


        <table class="table table-hover">
          <thead>
            <tr>
              <th>商品</th>
              <th>库存</th>
              <th>进库时间</th>
              <th>更新时间</th>
	      <th>明细</th>
              <!--<th>操作</th>-->
            </tr>
          </thead>
          <tbody>
		  <g:each in="${stockList}" status="i" var="stock">
			  <tr>
				<td>${stock.goods_name}</td>
				<td>${stock.num}</td>
				<td>${stock.dateCreated.toString()[0..18]}</td>
				<td>${stock.lastUpdated.toString()[0..18]}</td>
				<td>
					<g:link controller="stock" action="stocklog" params="[store_goods_id: stock.store_goods_id]">查看</g:link>
				</td>
			      </tr>
			  
		  </g:each>
            
          </tbody>
        </table>
        <div class="pagination pagination-right new-pagination">
          <g:if test="${stockTotal != 0}">
                <util:remotePaginate total="${stockTotal}"  params="${params}" controller="stock" action="list"  update="page" />
           </g:if>
            
            <span class="currentStep">共${stockTotal}条数据</span>
        </div>
      </div><!--/span-->
    </div><!--/row-->


    <g:render template="/layouts/company_footer"/>

  </div> <!-- /container -->

</body>

</html>

