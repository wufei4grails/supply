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
			  <g:form onSubmit="return pubOrder(this);" data-validate="parsley" class="form-horizontal" controller="shopping" action="payOrder" method="post"  >
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
				      <g:hiddenField  name="goods_id" value="${buyPOJO.goods.id}" />
				      <g:hiddenField  name="price" value="${buyPOJO.goods.price}" />
				      <g:hiddenField  name="num" value="${buyPOJO.num}" />
					
				      <tr class="goods">
					<td>
					
					  <g:img width="50px;" height="50px;"  uri="${buyPOJO.goods.img}"/>
			<g:link controller="shopping" action="buyGoodsDetail" id="${buyPOJO.goods.id}">${buyPOJO.goods.goods_name}</g:link></td>
					<td>${buyPOJO.goods.goods_sn}</td>
					<td class="price">${buyPOJO.goods.price}
					
					</td>
					<td class="num">${buyPOJO.num}
					</td>
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
                          <td>
			
			<g:hiddenField class="totalPrice" name="amount" value="" />
			<g:hiddenField class="address" name="address" value="" />
			<g:hiddenField class="area_id" name="area_id" value="" />
			<g:hiddenField class="telphone" name="telphone" value="" />
			<g:hiddenField class="person_name" name="person_name" value="" />
			  <button type="submit" class="btn btn-primary pull-right"><i class="icon-tags icon-white"></i>提交订单</button>
			  
			  </td>
                        </tr>
                      </tbody>
                    </table>
				  </g:form>
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
					<input onclick="checkRadio(this)" value="${address.person_name}"  class="radioinput" type="radio" name="optionsRadios"  person_name="${address.person_name}"  address="${address.address}" area_id="${address.area_id}" telphone="${address.telphone}" <g:if test="${address.is_default=='1'}">checked</g:if> >
				 ${address.person_name} ${address.address} ${address.telphone}
			       </label>
			</g:each>
			      
			
                        <!--<a  href="javascript:void(0)" >[新增收货地址]</a>-->
                      </div>


<g:formRemote  name="doAjaxAddAddress" onSuccess="doAjaxAddAddressSuccess(data)" data-validate="parsley" class="form-horizontal" url="[controller: 'member', action: 'doAjaxAddAddress']"  method="post">
	<g:hiddenField name="is_default" value="1" />
	<fieldset>
		<div class="control-group">

                <!-- Text input-->
                <label class="control-label" for="input01">收货人姓名<font color="red">&nbsp;*</font></label>
                <div class="controls">
                  <input name="person_name" data-error-message="收货人姓名不能为空" data-required="true" value="" type="text" placeholder="请输入收货人姓名" class="input-xlarge">
                  <p class="help-block"></p>
                </div>
              </div>
		<div class="control-group">

                <!-- Text input-->
                <label class="control-label" for="input01">选择地区<font color="red">&nbsp;*</font></label>
                <div class="controls" id="areaSelect">
                  <area:areaSeclect id="" controller="area" action="areaSelect" update="areaSelect"/> 
                  <p class="help-block"></p>
                </div>
              </div>

              <div class="control-group">

                <!-- Text input-->
                <label class="control-label" for="input01">详细地址<font color="red">&nbsp;*</font></label>
                <div class="controls">
                  <input value="${session.loginPOJO.store.address}" data-error-message="门店地址不能为空" data-required="true" type="text" name="address" placeholder="请输入门店地址" class="input-xlarge">
                  <p class="help-block"></p>
                </div>
              </div>

              
              
              <div class="control-group">

                <!-- Text input-->
                <label class="control-label" for="input01">联系电话<font color="red">&nbsp;*</font></label>
                <div class="controls">
                  <input value="${session.loginPOJO.store.contact_phone}" data-type="number" data-type-number-message="联系电话格式不正确" data-required-message="联系电话不能为空" data-required="true" type="text" name="telphone" placeholder="请输入联系电话" class="input-xlarge">
                  <p class="help-block"></p>
                </div>
              </div>
		<div class="control-group">
                <label class="control-label"></label>

                <!-- Button -->
                <div class="controls">
                  <button type="submit" class="btn btn-primary">保存收货人信息</button>
                </div>
              </div>
	</fieldset>

	</g:formRemote>
	
                    </div>

                    <div id="defaultAddress">
                      <div class="row-fluid">
                        <div class="span2">收货人姓名：</div>
                        <div class="span10" id="person_name"></div>
                      </div>
                      <div class="row-fluid">
                        <div class="span2">选择地区：</div>
                        <div class="span10"></div>
                      </div>
                      <div class="row-fluid">
                        <div class="span2">详细地址：</div>
                        <div class="span10" id="address"></div>
                      </div>
                      <div class="row-fluid">
                        <div class="span2">联系电话：</div>
                        <div class="span10" id="telphone"></div>
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
	    
	  function doAjaxAddAddressSuccess(data){
		  
		  if(data=="0"){
			  
		  }else{
			alert("修改收货人信息成功,请重新确认订单!");
			 window.top.location.reload()  
		  }
		
	  }
	    
	    
	  setDefaultAddress()
	  function setDefaultAddress(){
		  
		  $(".radioinput:checked").each(function(){
			  
			  var person_name = $(this).attr("person_name");
			  var address =  $(this).attr("address");
			  var telphone = $(this).attr("telphone");
			  setAddress(person_name,address,telphone);
		  })
		  
	  }
	  
	  function pubOrder(o){
		  var f = false
		  $(".radioinput:checked").each(function(){
			  
			$(o).find(".person_name").val($(this).attr("person_name"));
			
			$(o).find(".address").val($(this).attr("address"));
			$(o).find(".telphone").val($(this).attr("telphone"));
			$(o).find(".area_id").val($(this).attr("area_id"));
			$(o).find(".totalPrice").val($("#totalPrice").html());
			f = true;
			
		})
		if(!f){
			alert("请先填写收货地址信息，再提交订单！")
			return false;
		}else{
			return true; 
		}
		
		 
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

