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
	<r:require modules="pin"/>
	<r:require modules="bootstrapSwitch"/>
	
    <g:render template="/layouts/header"/>


    <div class="row-fluid">
      <div class="span3">
        <div class="well sidebar-nav">
           <g:render template="/layouts/leftmenu"/>
        </div><!--/.well -->
	
	<div class="well sidebar-nav" style="z-index: 100000;width: 600px;">
           <ul class="nav nav-list">
  <li class=""><a href="/supply/sale/saleGoodsList">收银台</a></li>
</ul>

        </div>
      </div><!--/span-->
      <div class="span9">
        <div id="legend" class="">
          <legend class="">收银</legend>
        </div>
	<g:form class="form-inline" name="myForm" action="saleGoodsList" >
        
          商品：<input value='${params.goods_name}' type="text" name="goods_name" class="input-small" placeholder="商品">
	  


          <button type="submit" class="btn">搜索</button>
        </g:form>


        <table class="table table-hover">
          <thead>
            <tr>
              <th>商品</th>
              <th>商品编号</th>
              <th>价格</th>
	      <th>售出？</th>
              <!--<th>操作</th>-->
            </tr>
          </thead>
          <tbody>
		  <g:each in="${goodsList}" status="i" var="goods">
			  <tr>
				<td>${goods.goods_name}</td>
				<td>${goods.goods_sn}</td>
				<td>${goods.price}</td>
				<td>
					<div class="switch switch-large" data-on-label="<i class='icon-shopping-cart icon-white'></i>售出" data-off-label="<i class='icon-barcode'></i>待售" >
    <input type="checkbox"  />
</div>
				</td>
			      </tr>
			  
		  </g:each>
	  
            
          </tbody>
        </table>
        <div class="pagination pagination-right new-pagination">
          <g:if test="${goodsTotal != 0}">
                <util:remotePaginate total="${goodsTotal}"  params="${params}" controller="stock" action="list"  update="page" />
           </g:if>
            
            <span class="currentStep">共${goodsTotal}条数据</span>
        </div>
      </div><!--/span-->
    </div><!--/row-->


    <g:render template="/layouts/company_footer"/>

  </div> <!-- /container -->
  <style>
	  
	  .well{
		  opacity:1;
	  }
	  </style>
</body>

</html>

