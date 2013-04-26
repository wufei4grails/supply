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
              <table class="table table-hover">
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
			<tr id='${buyPOJO.goods.id}'>
			<td>
				
				
			<g:img width="50px;" height="50px;"  uri="${buyPOJO.goods.img}"/>
			<g:link controller="shopping" action="buyGoodsDetail" id="${buyPOJO.goods.id}">${buyPOJO.goods.goods_name}</g:link>
			 </td>

			<td>${buyPOJO.goods.goods_sn}</td>
			<td>${buyPOJO.goods.price}</td>
			<td><input class="input-mini" type="text" value="${buyPOJO.num}"></td>
			<td>
			<g:formRemote id="removeGoods" name="removeGoods" on404="alert('not found!')" update="" onSuccess="jQuery('#'+data).remove()"
	url="[controller: 'shopping', action:'removeGoods']">
	    <g:hiddenField id="id" name="id" value="${buyPOJO.goods.id}" />
	    <input type="submit" class="btn" value="删除">
	</g:formRemote>	
				<!--<a href="#">删除</a>-->
			
			</td>
		      </tr>
		</g:each>
			
                  <tr class="info">
                    <td colspan="3" ></td>
                    <td  ></td>
                    <td>总计：¥1788.00</td>
                  </tr>
                  <tr > 
                    <td ></td>
                    <td  colspan="3" ></td>
                    <td><a href="checkOrder" class="btn  btn-primary pull-right"><i class="icon-gift icon-white"></i>立即结算</a></td>
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
  </body>

</html>

