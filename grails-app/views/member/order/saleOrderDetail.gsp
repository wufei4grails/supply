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
        <ul id="myTab" class="nav nav-tabs">
          <li class="active"><a href="#home" data-toggle="tab">订单信息</a></li>
          <li class=""><a href="#profile" data-toggle="tab">商品信息</a></li>
        </ul>
        <div id="myTabContent" class="tab-content">
          <div class="tab-pane fade active in" id="home">
            <form class="form-horizontal">
              <fieldset>
                <div class="control-group">

                  <!-- Text input-->
                  <label class="control-label" for="input01">订单号</label>
                  <div class="controls">
                    <p class="help-block text-center" >${saleOrder.order_sn}</p>
                  </div>
                </div>

<!--                <div class="control-group">

                   Text input
                  <label class="control-label" for="input01">门店</label>
                  <div class="controls">
                    <p class="help-block text-center" >中粮蜀山店</p>
                  </div>
                </div>-->

<!--                <div class="control-group">
                  <label class="control-label" for="input01">状态</label>
                  <div class="controls">
                    <p class="help-block text-center" >
			<order:orderStatusDic status="${saleOrder.status}"/>
		    </p>
                  </div>
                </div>-->

                <div class="control-group">
                  <!-- Text input-->
                  <label class="control-label" for="input01">金额</label>
                  <div class="controls">
                    <p class="help-block text-center" >${saleOrder.amount}</p>
                    <!--<a style="margin-left:5px;" href="#updatePrice" role="button" class="btn" data-toggle="modal">修改金额</a>-->
                  </div>
                </div>


                <div class="control-group">
                  <!-- Text input-->
                  <label class="control-label" for="input01">下单时间</label>
                  <div class="controls">
                    <p class="help-block text-center" >${saleOrder.dateCreated}</p>
                  </div>
                </div>








              </fieldset>
            </form>
          </div>
          <div class="tab-pane fade" id="profile">
		 
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
		      
		      <g:each in="${orderGoods}" status="i" var="goods">
			      <tr >
				<td>${goods.goods.goods_name}</td>
				<td>${goods.goods.goods_sn}</td>
				<td>${goods.price}</td>
				<td class="num">${goods.num}</td>
				<td class="amount">${goods.price * goods.num}</td>
			      </tr>
		      </g:each>
		      
                <tr>
                  <td></td>
                  <td></td>
                  <td>总计</td>
                  <td class="total_num">3</td>
                  <td class="total_amount">2098</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>



      </div><!--/span-->
    </div><!--/row-->
<g:form   id="${shoppingOrder?.id}" class="form-horizontal waitconfirm" controller="order" action="storeConfirmOrder" method="post">
	    
	    
	</g:form>

    <g:render template="/layouts/company_footer"/>

  </div> <!-- /container -->

  <style>
    .text-center{
      float: left;
      padding-top: 5px;
    }
  </style>
  <script>
	  $(document).ready(function(){
		  var num = "0";
		  jQuery(".num").each(function(){
			  num = parseInt(num) + parseInt(jQuery(this).html());
		  });
		  jQuery(".total_num").html(num);
		  
		  var amount = "0";
		  jQuery(".amount").each(function(){
			  amount = parseInt(amount) + parseInt(jQuery(this).html());
		  });
		  jQuery(".total_amount").html(amount);
	  });
  </script>
</body>

</html>

