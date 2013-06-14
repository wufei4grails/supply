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

  <div class="container">
	  <r:require modules="bootstrapDatetimepicker"/>
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
		    门店销售统计报表
		  </legend>
		</div>
		</fieldset>
	      
	      <g:form controller='report' class="form-inline" name="myForm" action="storeOwnerSaleReport" >
    按时间统计：
    <input class='input-large datetime' name="start_time" type="text" value="${params.start_time}" readonly placeholder="起始时间">
    -
    <input class='input-large datetime' name="end_time" type="text" value="${params.end_time}" readonly placeholder="截止时间">
    


          <button type="submit" class="btn">搜索</button>
        </g:form>
	      
	      <table class="table table-hover">
              <thead>
                <tr>
                  <th>商品名称</th>
                  <th>商品编号</th>
                  <th>价格</th>
                  <th>数量</th>
                  <th>小计</th>
                </tr>
              </thead>
              <tbody>
		      <g:set var="num1" value="${0}" />
		      <g:set var="amount1" value="${0}" />
		      <g:each in="${orderGoodsList}" status="i" var="goods">
			      <g:set var="num1" value="${num1+goods.num}" />
			      <g:set var="amount1" value="${amount1+goods.amount}" />
			      <tr>
				<td>${goods.goods_name}</td>
				<td>${goods.goods_sn}</td>
				<td>${goods.avgprice}</td>
				<td>${goods.num}</td>
				<td>${goods.amount}</td>
			      </tr>
		      </g:each>
		      
			<tr>
			  <td></td>
			  <td></td>
			  <td>总计</td>
			  <td>${num1}</td>
			  <td>${amount1}</td>
			</tr>
              </tbody>
            </table>



      </div><!--/span-->
    </div><!--/row-->


    <g:render template="/layouts/company_footer"/>

  </div> <!-- /container -->
  <script>
	  $(document).ready(function(){
		 $(".datetime").datetimepicker({
			format: "yyyy-mm-dd",
			autoclose: true,
			todayBtn: true,
			pickerPosition: "bottom-left",
			minView:4,
			language:'zh-CN'
		    });
	  })
  </script>
</body>

</html>

