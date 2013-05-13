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
	<style>
		.dropdown-menu li{
			height:40px;
		}
		
		
	</style>
  <div class="container" id="page">
	<r:require modules="pin"/>
	<r:require modules="bootstrapSwitch"/>
	
    <g:render template="/layouts/header"/>


    <div class="row-fluid">
      <div class="span3">
<!--        <div class="well sidebar-nav">
           <g:render template="/layouts/leftmenu"/>
        </div>-->
	<div class="btn-group" id="saletable">
           <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu" style="display: block; position: static; margin-bottom: 5px; width: 231px;z-index: 1000">
		   <li  >
			   <a style="height:40px;font-size: 1.5em;" onclick="catchsaletabledetail()" tabindex="-1" href="javascript:void(0)">收银台<i id="hand"  style="float:right;" class="icon-hand-right"></i></a>
		
			
			<ul id="saletabledetail" class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu" style="display: none; position: absolute;top:0px;left:232px; margin-bottom: 5px; width: 300px;z-index: 1000">
				<li><a tabindex="-1" href="#">购买数量</a></li>
				<li class="divider"></li>
				<li class="salegoodsnum"><input onchange="totalAmount()" style="margin-left: 10px;" class="span6" type="text" ></li>
				<li class="divider"></li>
				<li class="salegoodsnum"><input onchange="totalAmount()" style="margin-left: 10px;" class="span6" type="text" ></li>
				<li class="divider"></li>
				<li class="salegoodsnum"><input onchange="totalAmount()" style="margin-left: 10px;" class="span6" type="text" ></li>
				<li class="divider"></li>
				<li>
					<span id="rightAmount" style="float:left;margin-left:10px;">合计：100</span>
					
					<input style="float:right;margin-right: 10px;" type="submit" class="btn btn-primary" value="确认出售">
				
				</li>
			    </ul>
		
		</li>
		<li class="divider"></li>
                <li class="salegoods"><a  href="#">精品樱桃礼盒6<span style="float: right;" class="label label-important" onclick="delGoods(this)">删除</span>
				<br/><span class="saleprice">30.00</span><span class="salefina"><i  class="icon-remove "></i><span class="salenum">1</span></span>  </a></li>
		<li class="divider"></li>
                <li class="salegoods">
			<a  href="#">精品樱桃礼盒5<span style="float: right;" class="label label-important" onclick="delGoods(this)">删除</span>
				<br/>
				<span class="saleprice">40.00</span><span class="salefina"><i  class="icon-remove "></i><span class="salenum">2</span></span></a></li>
		<li class="divider"></li>
                <li class="salegoods">
			<a  href="#">精品樱桃礼盒3 <span style="float: right;" class="label label-important" onclick="delGoods(this)">删除</span><br/><span class="saleprice">50.00</span><span class="salefina"><i  class="icon-remove "></i><span class="salenum">3</span>
				</span>
			</a>
		</li>
		<li class="divider"></li>
		<li>
			<span id="leftAmount" style="float:left;margin-left:20px;">合计：100</span>
			<input id="leftsubmit" style="float:right;margin-right: 10px;" type="submit" class="btn btn-primary" value="确认出售"></li>
            </ul>
	</div>
		
      </div><!--/span-->
      <div class="span9">
        <div id="legend" class="">
          <legend class="">收银<span class="label label-info">提示:通过选择售出按钮将待售商品加入到左侧收银台结算</span></legend>
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
  <script>
  
	jQuery("#saletable").pin();
	
	
	function catchsaletabledetail(){
		jQuery("#saletabledetail").toggle();
		
		
		if(jQuery("#saletabledetail").is(":hidden")){
			jQuery("#hand").removeClass("icon-hand-left");
			jQuery("#hand").addClass("icon-hand-right");
			
			jQuery("#leftsubmit").show();
			jQuery("#leftAmount").show();
			jQuery(".salefina").show();
			
			
			jQuery("#saletabledetail input").each(function(i,d){
	//			alert(i)
	//			alert(jQuery(d).html())

				jQuery(".salenum:eq("+i+")").html(jQuery(d).val())

			});
			
		}else{
			jQuery("#hand").removeClass("icon-hand-right");
			jQuery("#hand").addClass("icon-hand-left");
			
			jQuery("#leftsubmit").hide();
			jQuery("#leftAmount").hide();
			jQuery(".salefina").hide();
		}
		
		
		jQuery(".salenum").each(function(i,d){
//			alert(i)
//			alert(jQuery(d).html())
			
			jQuery("#saletabledetail input:eq("+i+")").val(jQuery(d).html())
			
		});
		
//		alert(jQuery("#saletabledetail").is(":hidden"))
	}
	
	function delGoods(o){
		var li = jQuery(o).parents("li");
		var i = jQuery(".salegoods").index(li);
		li.next().remove();
		li.remove();
		jQuery(".salegoodsnum:eq("+i+")").next().remove();
		jQuery(".salegoodsnum:eq("+i+")").remove();
		
		totalAmount();
	}
	
	function totalAmount(){
		var totalPrice = 0.00 ;
		jQuery(".saleprice").each(function(i,d){
			var saleprice = jQuery(d).html();
			var salenum = jQuery("#saletabledetail input:eq("+i+")").val();
			
			var re = /^[1-9]+[0-9]*]*$/;       //判断正整数 /^[1-9]+[0-9]*]*$/   
			if (!re.test(salenum)){
			   alert("请输入有效数量！");

			   jQuery("#saletabledetail input:eq("+i+")").focus();
			   return false;
			} 
		
		
			totalPrice = parseFloat(totalPrice) + parseFloat(saleprice*salenum);
		});
		jQuery("#leftAmount").html("合计："+totalPrice.toFixed(2));
		jQuery("#rightAmount").html("合计："+totalPrice.toFixed(2));
	}
  </script>
</body>

</html>

