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
        <g:render template="/member/shopping/buyGoodsCategory"/>
        <div class="span9">


          <div class="row-fluid">
            <div id="legend" class="span12">
              <ul class="breadcrumb">
                <li >
                  <a href="#">1.我的购物车</a>
                  <span class="divider">/</span>
                </li>
                <li >
                  <a href="#" >2.填写核对订单信息</a>
                  <span class="divider">/</span>
                </li>
                <li >
                  <a href="#">3.提交订单</a>
                  <span class="divider">/</span>
                </li>
                <li >
                  <a href="#">4.支付订单</a>
                  <span class="divider">/</span>
                </li>
                <li >
                  <a href="#" style="color: gray">5.等待收货</a>
                </li>

              </ul>

            </div>



          </div>

          <div class="row-fluid">
            <div class="span12">
              <div class="alert alert-success">
                <h3>订单支付成功，请您耐心等待，我们将尽快为您配货发货！</h3>
                <p>订单号：${shoppingOrder.order_sn}</p>
                <p>金额：${shoppingOrder.amount}元</p>
              
	      <g:link class="btn btn-large btn-primary" controller="order" action="storeOrderDetail" id="${shoppingOrder.id}">
     查看订单
</g:link>
	      
	      </div>
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
      function updateAddress(){
        $("#updateAddress").show();
        $("#defaultAddress").hide();
        $("#closeUpdateAddressButton").show();
        $("#updateAddressButton").hide();
      }

      function closeUpdateAddress(){
$("#updateAddress").hide();
$("#defaultAddress").show();
$("#closeUpdateAddressButton").hide();
$("#updateAddressButton").show();

}
</script>

</body>

</html>

