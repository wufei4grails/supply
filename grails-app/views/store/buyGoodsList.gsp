<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta name="layout" content="main"/>
  <r:require modules="bootstrap"/>

</head>
<body>

  <div class="container">

    <g:render template="/layouts/store_header"/>


    <div class="row-fluid">
      <g:render template="/store/buyGoodsCategory"/>
      <div class="span9">
        <g:render template="/store/buyGoodsNav"/>
        <div class="row-fluid">
          <div class="span4">
            <img src="http://xiangxia.com/userfiles/image/8dc01a5f-69e5-4b4c-af08-d5aa039489b5.jpg" class="img-rounded">
            <h4>润庄大米,香甜美味</h4>
            <p>价格：100元</p>
            <p><a class="btn" href="buyGoodsDetail">采购 »</a></p>
          </div>
          <div class="span4">
            <img src="http://www.xiangxia.com/userfiles/image/5ba5b7a1-c262-4b64-8da3-feb702416882.jpg" class="img-rounded">
            <h4>普装南汇甜瓜</h4>
            <p>价格：95.00元</p>
            <p><a class="btn" href="buyGoodsDetail">采购 »</a></p>
          </div>
          <div class="span4">
            <img src="http://xiangxia.com/userfiles/image/c2f7e78e-12ba-44d4-b455-fa30dd119534.jpg" class="img-rounded">
            <h4>农科院蔬菜礼盒10样装</h4>
            <p>价格：140.00元</p>
            <p><a class="btn" href="buyGoodsDetail">采购 »</a></p>
          </div>
        </div>
        <div class="row-fluid">
          <div class="span4">
            <img src="http://xiangxia.com/userfiles/image/8dc01a5f-69e5-4b4c-af08-d5aa039489b5.jpg" class="img-rounded">
            <h4>润庄大米,香甜美味</h4>
            <p>价格：100元</p>
            <p><a class="btn" href="#buyGoodsDetail">采购 »</a></p>
          </div>
          <div class="span4">
            <img src="http://www.xiangxia.com/userfiles/image/5ba5b7a1-c262-4b64-8da3-feb702416882.jpg" class="img-rounded">
            <h4>普装南汇甜瓜</h4>
            <p>价格：95.00元</p>
            <p><a class="btn" href="#">采购 »</a></p>
          </div>
          <div class="span4">
            <img src="http://xiangxia.com/userfiles/image/c2f7e78e-12ba-44d4-b455-fa30dd119534.jpg" class="img-rounded">
            <h4>农科院蔬菜礼盒10样装</h4>
            <p>价格：140.00元</p>
            <p><a class="btn" href="#">采购 »</a></p>
          </div>
        </div>
        <div class="row-fluid">
          <div class="span4">
            <img src="http://xiangxia.com/userfiles/image/8dc01a5f-69e5-4b4c-af08-d5aa039489b5.jpg" class="img-rounded">
            <h4>润庄大米,香甜美味</h4>
            <p>价格：100元</p>
            <p><a class="btn" href="#">采购 »</a></p>
          </div>
          <div class="span4">
            <img src="http://www.xiangxia.com/userfiles/image/5ba5b7a1-c262-4b64-8da3-feb702416882.jpg" class="img-rounded">
            <h4>普装南汇甜瓜</h4>
            <p>价格：95.00元</p>
            <p><a class="btn" href="#">采购 »</a></p>
          </div>
          <div class="span4">
            <img src="http://xiangxia.com/userfiles/image/c2f7e78e-12ba-44d4-b455-fa30dd119534.jpg" class="img-rounded">
            <h4>农科院蔬菜礼盒10样装</h4>
            <p>价格：140.00元</p>
            <p><a class="btn" href="#">采购 »</a></p>
          </div>
        </div>
        <div class="row-fluid">
          <div class="span4">
            <img src="http://xiangxia.com/userfiles/image/8dc01a5f-69e5-4b4c-af08-d5aa039489b5.jpg" class="img-rounded">
            <h4>润庄大米,香甜美味</h4>
            <p>价格：100元</p>
            <p><a class="btn" href="#">采购 »</a></p>
          </div>
          <div class="span4">
            <img src="http://www.xiangxia.com/userfiles/image/5ba5b7a1-c262-4b64-8da3-feb702416882.jpg" class="img-rounded">
            <h4>普装南汇甜瓜</h4>
            <p>价格：95.00元</p>
            <p><a class="btn" href="#">采购 »</a></p>
          </div>
          <div class="span4">
            <img src="http://xiangxia.com/userfiles/image/c2f7e78e-12ba-44d4-b455-fa30dd119534.jpg" class="img-rounded">
            <h4>农科院蔬菜礼盒10样装</h4>
            <p>价格：140.00元</p>
            <p><a class="btn" href="#">采购 »</a></p>
          </div>
        </div>



        <div class="span12 pagination pagination-right">
          <ul>
            <li><a href="#">上一页</a></li>
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li><a href="#">下一页</a></li>
          </ul>
        </div>
      </div><!--/span-->
    </div><!--/row-->


    <g:render template="/layouts/company_footer"/>

  </div> <!-- /container -->
  

</body>

</html>

