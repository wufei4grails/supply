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
									<td ><strong>采购订单</strong></td>
								<td></td>
								</tr>
								<tr >
										<td>未付款</td>
										<td>
<g:link controller="order" action="storeOrderList" params="[status: 'waitpay']">${waitpay}</g:link>

		</td>
									</tr>
									<tr>
										<td>已付款，等待发货</td>
										<td><g:link controller="order" action="storeOrderList" params="[status: 'waitship']">${waitship}</g:link></td>
									</tr>
									<tr>
										<td>已发货，等待收货确认</td>
										<td>
										<g:link controller="order" action="storeOrderList" params="[status: 'waitconfirm']">${waitconfirm}</g:link></td>
									</tr>
									<tr>
										<td>已完成</td>
										<td>
										<g:link controller="order" action="storeOrderList" params="[status: 'success']">${successCount}</g:link></td>
									</tr>
									
									<tr class='success'>
								<td ><strong>销售订单</strong></td>
								<td></td>
								</tr>
								<tr >
									<td>已售出</td>
										<td>
<g:link controller="order" action="storeSaleOrderList" >${sale}</g:link>

		</td>
									</tr>	
								<tr class='success'>
								<td ><strong class='tips' data-toggle="tooltip" data-placement="right" data-original-title="门店通过平台采购的商品将进入门店商品库，结合收银台功能可便利的销售">我的商品库<i class="icon-info-sign"></i></strong></td>
								<td></td>
								</tr>	
								
								
								<tr >
									<td>商品总数</td>
										<td>
<g:link controller="goods" action="reqStoreGoodsList" >${goodsCount}</g:link>

		</td>
									</tr>	
								
								
								</tbody>
							</table>
							
							
						</div>
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
				$('.tips').tooltip()
				
			})

			    var barChartData = {
				    labels : ["上架商品","下架商品"],
				    datasets : [
					    {
						    fillColor : "rgba(220,220,220,0.5)",
						    data : [65,1]
					    },
					    {
						    strokeColor : "rgba(151,187,205,1)",
						    data : [28,2]
					    }
				    ]
			
			    }

		    var myLine = new Chart(document.getElementById("canvas").getContext("2d")).Bar(barChartData);
	
		</script>

	</body>

</html>

