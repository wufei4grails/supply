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
                  <a href="#" style="color: gray">2.填写核对订单信息</a>
                  <span class="divider">/</span>
                </li>
                <li >
                  <a href="#" style="color: gray">3.提交订单</a>
                  <span class="divider">/</span>
                </li>
                <li >
                  <a href="#" style="color: gray">4.支付订单</a>
                  <span class="divider">/</span>
                </li>
                <li >
                  <a href="#" style="color: gray">5.等待收货</a>
                </li>

              </ul>

            </div>



          </div>

          <div class="row-fluid">
            <div id="legend" class="span12">
              <table id="cart_table" class="table table-hover">
                <thead>
                  <tr>
                    <th  >商品名称</th>
                    <th>商品编号</th>
                    <th>价格</th>
                    <th>数量</th>
                    <th width="20%">操作</th>
                  </tr>
                </thead>
                <tbody>
		
		
			
		<g:each in="${cartList}" status="i" var="buyPOJO">
			<tr id='${buyPOJO.goods.id}' class="goods">
			<td>
				
				
			<g:img width="50px;" height="50px;"  uri="${buyPOJO.goods.img}"/>
			<g:link controller="shopping" action="buyGoodsDetail" id="${buyPOJO.goods.id}">${buyPOJO.goods.goods_name}</g:link>
			 </td>

			<td>${buyPOJO.goods.goods_sn}</td>
			<td class="price">${buyPOJO.goods.price}</td>
			<td> <input goods_id="${buyPOJO.goods.id}"  class="input-mini num" type="text" value="${buyPOJO.num}"></td>
			<td>

				<g:form onSubmit="" name="removeGoods" class="removeGoods" action="removeGoods" >
				
				<g:hiddenField id="id" name="id" value="${buyPOJO.goods.id}" />
	    <input type="submit" class="btn" value="删除">
	</g:form>	
				<!--<a href="#">删除</a>-->
			
			</td>
		      </tr>
		</g:each>
			
                  <tr class="info">
                    <td colspan="3" ></td>
                    <td  ></td>
                    <td>总计：¥<span id="totalPrice"></span></td>
                  </tr>
                  <tr > 
                    <td ></td>
                    <td  colspan="3" ></td>
                    <td>
			    
		  <g:if test="${cartList}">
			<g:link class="btn  btn-primary pull-right" controller="shopping" action="checkOrder"> <i class="icon-gift icon-white"></i>立即结算</a></g:link>
		  </g:if>
		  <g:else>
			  <g:link class="btn  btn-primary pull-right" controller="shopping" action="shoppingGoodsList"> <i class="icon-gift icon-white"></i>返回购物</a></g:link>
		</g:else>
			    
			    
		    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>



        </div><!--/span-->
      </div><!--/row-->
      

      <g:render template="/layouts/company_footer"/>
      <g:form onSubmit="" name="updateCart" class="updateCart" action="updateCart" >
	      <g:hiddenField id="id" name="id" value="" />
	    <g:hiddenField id="num" name="num" value="" />
      </g:form>
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
	 
	  
	  
	  
	function initTotalPrice(){
		var totalPrice = 0.00 ;
		jQuery("#cart_table").find(".goods").each(function(){
			
			var price = jQuery(this).find(".price").html();
			var num = jQuery(this).find(".num").val();
			
			totalPrice = parseFloat(totalPrice) + parseFloat(price*num);
			
		});
		jQuery("#totalPrice").html(totalPrice.toFixed(2));
	}
	
	
	$(document).ready(function(){
		initTotalPrice();
		
		jQuery(".num").change(function() {
			jQuery(".updateCart").find("#num").val(jQuery(this).val());
			jQuery(".updateCart").find("#id").val(jQuery(this).attr("goods_id"));
			
			
			var num = jQuery(this).val();
			if(!num){
				alert("请输入订购数量！")
				return false;
			}


		      var re = /^[1-9]+[0-9]*]*$/;       //判断正整数 /^[1-9]+[0-9]*]*$/   
		      if (!re.test(num)){
			 alert("请输入有效数量！");

			 jQuery(o).find("#num").focus();
			 return false;
		      }  
		
			jQuery(".updateCart").submit();
		});
	
	});	
  
  </script>
  </body>

</html>

