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

  <div class="container" id="page">

    <g:render template="/layouts/header"/>


    <div class="row-fluid">
      <g:render template="/member/shopping/buyGoodsCategory"/>
      <div class="span9">
        <g:render template="/member/shopping/buyGoodsNav"/>
        
        <g:each in="${goodsList}" status="i" var="goods">
          <g:if test="${i==0}">
            <div class="row-fluid">
          </g:if>
          <div title="${goods.goods_name}" class="span4 item">
            <div style="height:140px;">
              <g:link  action="buyGoodsDetail" id="${fieldValue(bean: goods, field: "id")}">
              <g:img class="img-rounded" uri="${goods.img}"/>
              </g:link>
            </div>
            
            <h4 style="height:40px;">${goods.goods_name.size()>16?goods.goods_name[0..9]:goods.goods_name}</h4>
            <p>价格：${goods.price}元</p>
            <p>
		    <g:link class="btn" action="buyGoodsDetail" id="${fieldValue(bean: goods, field: "id")}">采购 »</g:link>
          </div>
          
          <g:if test="${i%3==2}">
            </div>
            <div class="row-fluid">
          </g:if>
          <g:if test="${i==goodsList.size()-1}">
            </div>
          </g:if>
          
        </g:each>
        
        
        
        
      
        
        
        
        



        <div class="pagination pagination-right new-pagination">
          
          
           <g:if test="${goodsTotal != 0}">
                <util:remotePaginate total="${goodsTotal}"  params="${params}" controller="shopping" action="shoppingGoodsList"  update="page" />
           </g:if>
            
          <span class="currentStep">共${goodsTotal}条数据</span>
        </div>
      </div><!--/span-->
    </div><!--/row-->


    <g:render template="/layouts/company_footer"/>

  </div> <!-- /container -->
  <style>
    div .item{
      height: 280px;
      position: relative;
      display: inline-block;
      cursor:pointer;
      /*border: none;*/
    }
   div .item:hover {
     border:3px solid rgba(0,0,0,0.2);
   }  
    
    div .item img{
      max-height: 140px;
      
    }
  </style>

</body>

</html>

