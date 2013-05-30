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
      <g:render template="/layouts/header"/>


      <div class="row-fluid">
        <div class="span3">
				<div class="well sidebar-nav">
					<g:render template="/layouts/leftmenu"/>
				</div><!--/.well -->
			</div><!--/span-->
        <div class="span9">



          <div class="row-fluid">
		<div class="span12">
		    <table class="table table-striped">
								
								<tbody>
									
									
									<tr class='success'>
									<td ><strong>订单统计</strong></td>
								<td></td>
								</tr>
									
									<tr >
										<td>未付款</td>
										<td>
<g:link controller="order" action="companyOrderList" params="[status: 'waitpay']">${waitpay}</g:link>

		</td>
									</tr>
									<tr>
										<td>已付款，等待发货</td>
										<td><g:link controller="order" action="companyOrderList" params="[status: 'waitship']">${waitship}</g:link></td>
									</tr>
									<tr>
										<td>已发货，等待收货确认</td>
										<td>
										<g:link controller="order" action="companyOrderList" params="[status: 'waitconfirm']">${waitconfirm}</g:link></td>
									</tr>
									<tr>
										<td>已完成</td>
										<td>
										<g:link controller="order" action="companyOrderList" params="[status: 'success']">${successCount}</g:link></td>
									</tr>
									
									<tr class='success'>
									<td ><strong>企业商品</strong></td>
								<td></td>
								</tr>
								<tr>
									<td>上架商品</td>
									<td>
									<g:link controller="goods" action="reqGoodsList" params="[status: 'on']">${onGoodsCount}</g:link></td>
								</tr>
								<tr>
									<td>下架商品</td>
									<td>
									<g:link controller="goods" action="reqGoodsList" params="[status: 'off']">${offGoodsCount}</g:link></td>
								</tr>
									
								</tbody>
							</table>
		</div>
<!--		<div class="span6">
			<div id="container" style="height: 300px"></div>
		</div>-->
	</div>


	    </div><!--/span-->
	  </div><!--/row-->


      <g:render template="/layouts/company_footer"/>

    </div> <!-- /container -->
    <style>
      .goods-title{
        border-bottom: 1px solid rgba(0,0,0,0.2);
      }


      .img-polaroid{
        height: 250px;
      }

    </style>
    <script>
$(function () {
//    $('#container').highcharts({
//        chart: {
//            type: 'column'
//        },
//        title: {
//            text: '企业分类商品统计'
//        },
//        xAxis: {
//            categories: ['水果', '蔬菜', '山货']
//        },
//        yAxis: {
//            title: {
//                text: '数量'
//            }
//        },
//        series: [{
//            name: '分类',
//            data: [1, { y: 3, color: '#BF0B23'}, 4]
//        }
//      ],
//    });
    
    
    jQuery("tspan").each(function(){
        
        if(jQuery(this).text()=='Highcharts.com'){
          jQuery(this).remove();
        }
      
    });
    
});
	
	</script>

</body>

</html>

