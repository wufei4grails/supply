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
        <g:render template="/member/shopping/buyGoodsNav"/>
        <div class="row-fluid">
          <div class="span5" style="margin-bottom:10px;">
		  <g:img class="img-polaroid" uri="${goods.img}"/>
          </div>
          <div class="span7">
            <h3 class="goods-title">${goods.goods_name}</h3>
            <h5>商品编号：${goods.goods_sn}</h5>
            <h5>价格：${goods.price}元</h5>
            <h5>数量：<input class="input-mini" type="text" ></h5>
            <a href="cartManager" class="btn btn-large btn-primary">立即采购</a>
            <a href="#" class="btn btn-large btn-warning">加入购物车</a>
          </div>
        </div>
        <div class="row-fluid">
          <div class="span12">
            <ul id="myTab" class="nav nav-tabs">
              <li class="active"><a href="#home" data-toggle="tab">商品描述</a></li>
              <li><a href="#profile" data-toggle="tab">商品属性</a></li>
	      <li><a href="#goodsimg" data-toggle="tab">商品图片</a></li>
            </ul>
            <div id="myTabContent" class="tab-content">
              <div class="tab-pane fade in active" id="home">
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
		    
		    
		<div class="tab-pane fade" id="goodsimg">
		      
			
			
			
			
			
			
<!--		<g:each in="${attachList}" status="i" var="attach">
<g:if test="${i==0}">
    <div class="row-fluid">
</g:if>
  <div class="span4">
<g:img  uri="${attach.url}"/>
  </div>
<g:if test="${i%3==2}">
    </div>
    <div class="row-fluid">
</g:if>
<g:if test="${i==attachList.size()-1}">
    </div>
</g:if>

</g:each>-->
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
</body>

</html>

