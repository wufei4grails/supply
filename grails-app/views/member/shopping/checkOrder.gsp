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
            <div class="span12">
              <div class="tabbable tabs-left">
                <ul class="nav nav-tabs">
                  <li class="active"><a href="#lA" data-toggle="tab">商品清单</a></li>
                  <li class=""><a href="#lB" data-toggle="tab">收货人信息</a></li>
                </ul>
                <div class="tab-content">
                  <div class="tab-pane active" id="lA">
                    <table class="table table-hover" id="cart_table">
                      <thead>
                        <tr>
                          <th>商品名称</th>
                          <th>商品编号</th>
                          <th>价格</th>
                          <th width="20%">数量</th>
                        </tr>
                      </thead>
                      <tbody>
			      
			      <g:each in="${cartList}" status="i" var="buyPOJO">
				      <tr class="goods">
					<td>
					  <g:img width="50px;" height="50px;"  uri="${buyPOJO.goods.img}"/>
			<g:link controller="shopping" action="buyGoodsDetail" id="${buyPOJO.goods.id}">${buyPOJO.goods.goods_name}</g:link></td>
					<td>${buyPOJO.goods.goods_sn}</td>
					<td class="price">${buyPOJO.goods.price}</td>
					<td class="num">${buyPOJO.num}</td>
				      </tr>
				      
			      </g:each>
			      
			      
                        <tr class="info">
                          <td colspan="2" ></td>
                          <td  ></td>
                          <td >总计：¥<span id="totalPrice"></span></td>
                        </tr>
                        <tr> 
                          <td ></td>
                          <td  colspan="2" ></td>
                          <td><a href="payOrder" class="btn  btn-primary pull-right"><i class="icon-tags icon-white"></i>提交订单</a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div class="tab-pane" id="lB">
                    <div id="legend" class="">
                      <legend class="">收货人信息
                        <a id="updateAddressButton" href="javascript:void(0)" onclick="updateAddress()">[修改]</a>
                        <a id="closeUpdateAddressButton" href="javascript:void(0)" onclick="closeUpdateAddress()" style="display:none">[关闭]</a>
                      </legend>
                    </div>

                    <div id="updateAddress" style="display:none">

                      <div class="well">
			
			<g:each in="${addressList}" status="i" var="address">
				<label class="radio">
					<input onclick="checkRadio(this)" value="${address.person_name}" class="radioinput" type="radio" name="optionsRadios"  person_name="${address.person_name}" address="${address.address}" telphone="${address.telphone}" <g:if test="${address.is_default=='1'}">checked</g:if> >
				 ${address.person_name} ${address.address} ${address.telphone}
			       </label>
			</g:each>
			      
			
                        <a  href="javascript:void(0)" >[新增收货地址]</a>
                      </div>



                      <div class="row-fluid">
                        <div class="span2">收货人姓名：</div>
                        <div class="span10"><input type="text" placeholder="请输入收货人姓名" class="input-large"></div>
                      </div>
                      <div class="row-fluid">
                        <div class="span2">省份：</div>
                        <div class="span10">
                          <select style="width:100px;">
                            <option>安徽</option>
                            <option>上海</option>
                            <option>北京</option>
                            <option>山东</option>
                            <option>湖南</option>
                          </select>
                          <select style="width:100px;">
                            <option>合肥</option>
                            <option>安庆</option>
                            <option>淮南</option>
                          </select>
                          <select style="width:100px;">
                            <option>高新区</option>
                            <option>政务区</option>
                            <option>蜀山区</option>
                          </select>
                        </div>
                      </div>
                      <div class="row-fluid">
                        <div class="span2">地址：</div>
                        <div class="span10"><input type="text" placeholder="请输入地址" class="input-xlarge"></div>
                      </div>
                      <div class="row-fluid">
                        <div class="span2">手机号码：</div>
                        <div class="span10"><input type="text" placeholder="请输入手机号码" class="input-large"></div>
                      </div>
                      <div class="row-fluid">
                        <div class="span2">固定电话：</div>
                        <div class="span10"><input type="text" placeholder="请输入固定电话" class="input-large"></div>
                      </div>
                      <div class="row-fluid">
                        <div class="span2">电子邮件：</div>
                        <div class="span10"><input type="text" placeholder="请输入电子邮件" class="input-large"></div>
                      </div>
                      <div class="row-fluid">
                        <div class="span2">邮编：</div>
                        <div class="span10"><input type="text" placeholder="请输入邮编" class="input-large"></div>
                      </div>
                      <div class="row-fluid" style="margin-bottom:5px;">
                        <div class="span2"></div>
                        <div class="span10">
                          <button class="btn btn-primary">保存收货人信息</button>
                        </div>
                      </div>
                    </div>

                    <div id="defaultAddress">
                      <div class="row-fluid">
                        <div class="span2">收货人姓名：</div>
                        <div class="span10" id="person_name">吴飞</div>
                      </div>
                      <div class="row-fluid">
                        <div class="span2">省份：</div>
                        <div class="span10">安徽合肥市高新技术开发区</div>
                      </div>
                      <div class="row-fluid">
                        <div class="span2">地址：</div>
                        <div class="span10" id="address">安徽合肥市高新技术开发区香樟大道168号科技实业园C5栋2层</div>
                      </div>
                      <div class="row-fluid">
                        <div class="span2">联系电话：</div>
                        <div class="span10" id="telphone">13987898888</div>
                      </div>
                    </div>
                  </div>
                </div>
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
	  setDefaultAddress()
	  function setDefaultAddress(){
		  
		  $(".radioinput:checked").each(function(){
			  
			  var person_name = $(this).attr("person_name");
			  var address =  $(this).attr("address");
			  var telphone = $(this).attr("telphone");
			  setAddress(person_name,address,telphone);
		  })
		  
	  }  
	  
	    
	 function setAddress(person_name,address,telphone){
		 jQuery("#defaultAddress #person_name").html(person_name);
		 jQuery("#defaultAddress #address").html(address);
		 jQuery("#defaultAddress #telphone").html(telphone);
	 }  
	 
	 
	 function checkRadio(o){
		 var person_name = $(o).attr("person_name");
		var address =  $(o).attr("address");
		var telphone = $(o).attr("telphone");
		setAddress(person_name,address,telphone);
	 }
	 
	 initTotalPrice();
	 function initTotalPrice(){
		var totalPrice = 0.00 ;
		jQuery("#cart_table").find(".goods").each(function(){
			
			var price = jQuery(this).find(".price").html();
			var num = jQuery(this).find(".num").html();
			
			totalPrice = parseFloat(totalPrice) + parseFloat(price*num);
			
		});
		jQuery("#totalPrice").html(totalPrice.toFixed(2));
	}
	    
	    
      function updateAddress(){
        jQuery("#updateAddress").show();
        jQuery("#defaultAddress").hide();
        jQuery("#closeUpdateAddressButton").show();
        jQuery("#updateAddressButton").hide();
      }

      function closeUpdateAddress(){
		jQuery("#updateAddress").hide();
		jQuery("#defaultAddress").show();
		jQuery("#closeUpdateAddressButton").hide();
		jQuery("#updateAddressButton").show();

	}
</script>

</body>

</html>

