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
    <r:require modules="slicebox"/>

    <div class="row-fluid">
      <g:render template="/member/shopping/buyGoodsCategory"/>
      <div class="span9">
        <g:render template="/member/shopping/buyGoodsNav"/>
        <div class="row-fluid">
          <div class="span5" style="margin-bottom:10px;">
		  <g:img class="img-polaroid" uri="${goods.img}"/>
          </div>
          <div class="span7">
	<g:form onSubmit="return gotoCart(this)" name="shopping" action="gotoCart" >
	<g:hiddenField id="id" name="id" value="${goods.id}" />
            <h3 class="goods-title">${goods.goods_name}</h3>
            <h5>商品编号：${goods.goods_sn}</h5>
            <h5>价格：${goods.price}元</h5>
            <h5>数量：<input class="input-mini" name="num" id="num" type="text" ></h5>
            <input type="submit" class="btn btn-large btn-primary" value="立即采购">
            <input class="btn btn-large btn-warning" type="button" onclick="addCart(this)" value="加入购物车">
	</g:form>
	    
          </div>
        </div>
        <div class="row-fluid">
          <div class="span12">
            <ul id="myTab" class="nav nav-tabs">
              <li class="active"><a href="#goodsimg" data-toggle="tab">商品图片</a></li>
              <li ><a href="#home" data-toggle="tab">商品描述</a></li>
              <li><a href="#profile" data-toggle="tab">商品属性</a></li>
	      
            </ul>
            <div id="myTabContent" class="tab-content">
              <div class="tab-pane fade " id="home">
		${goods.goods_text}
              </div>
              <div class="tab-pane fade" id="profile">
		      
		<g:each in="${goodsAttrList}" status="i" var="goods">
			  <g:if test="${i==0}">
			    <div class="row-fluid">
			  </g:if>
			  <div class="span3">${goods.attr_name}:${goods.attr_val}</div>
			  <g:if test="${i%4==3}">
			    </div>
			    <div class="row-fluid">
			  </g:if>
			  <g:if test="${i==goodsAttrList.size()-1}">
			    </div>
			  </g:if>

		</g:each>
              </div>
		    
		    
		<div class="tab-pane fade in active" id="goodsimg">
		      
			
			<div class="wrapper" style="position: relative;">

				<ul id="sb-slider" class="sb-slider">
                                  
                                  <g:each in="${attachList}" status="i" var="attach">
                                    <li>
						<a href="javascript:void(0)" ><g:img  uri="${attach.url}"/></a>
						<!--<div class="sb-description">-->
							<!--<h3>Creative Lifesaver</h3>-->
						<!--</div>-->
					</li>
                                  </g:each>
                                  
                                  
<!--					<li>
						<a href="http://www.flickr.com/photos/strupler/2969141180" target="_blank"><img src="http://tympanus.net/Development/Slicebox/images/1.jpg" alt="image1"/></a>
						<div class="sb-description">
							<h3>Creative Lifesaver</h3>
						</div>
					</li>-->
				</ul>

				<div id="shadow" class="shadow"></div>

                                <div id="nav-arrows" class="nav-arrows" >
					<a href="#">Next</a>
					<a href="#">Previous</a>
				</div>

			</div><!-- /wrapper -->
			
			
			
			
              </div>
            </div>
          </div>
        </div>



      </div><!--/span-->
    </div><!--/row-->
    <g:formRemote id="addCart" name="addCart" on404="alert('not found!')" update="" onSuccess="addCartSuccess(data)"
	url="[controller: 'shopping', action:'addCart']">
	    <g:hiddenField id="id" name="id" value="${goods.id}" />
	    <g:hiddenField id="num" name="num" value="" />
	</g:formRemote>

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
	  
	  function gotoCart(o){
		var num = jQuery(o).find("#num").val();
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
	  }
	  
	  
	  function addCart(o){
		  
		  var num = jQuery(o).parents("form").find("#num").val();
		  if(!num){
			  alert("请输入订购数量！")
			  return false;
		  }
		  
		  
		 var re = /^[1-9]+[0-9]*]*$/;       //判断正整数 /^[1-9]+[0-9]*]*$/   
		if (!re.test(num)){
		   alert("请输入有效数量！");
		   
		   jQuery(o).parents("form").find("#num").focus();
		   return false;
		}
		  
		  jQuery("#addCart").find("#num").val(num)
		  jQuery("#addCart").submit();
	  }
	  function addCartSuccess(data){
//		  alert(data.num)
//		  alert(data.goods.goods_name)
		  alert(data.goods.goods_name+"加入购物车成功！")
		  window.top.location.reload()
	  }
  </script>
  
  <script type="text/javascript">
			$(function() {
				
				var Page = (function() {

					var $navArrows = $( '#nav-arrows' ).hide(),
						$shadow = $( '#shadow' ).hide(),
						slicebox = $( '#sb-slider' ).slicebox( {
							onReady : function() {

								$navArrows.show();
								$shadow.show();

							},
							orientation : 'r',
							cuboidsRandom : true,
							disperseFactor : 30
						} ),
						
						init = function() {

							initEvents();
							
						},
						initEvents = function() {

							// add navigation events
							$navArrows.children( ':first' ).on( 'click', function() {

								slicebox.next();
								return false;

							} );

							$navArrows.children( ':last' ).on( 'click', function() {
								
								slicebox.previous();
								return false;

							} );

						};

						return { init : init };

				})();

				Page.init();

			});
		</script>
  
</body>

</html>

