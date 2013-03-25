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

      <g:render template="/layouts/store_header"/>


      <div class="row-fluid">
        <g:render template="/store/buyGoodsCategory"/>
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
                  <tr>
                    <td>
                      <img width="50px;" height="50px;" src="http://www.xiangxia.com/userfiles/image/5ba5b7a1-c262-4b64-8da3-feb702416882.jpg"/>
                      东北大米</td>

                    <td>g0112</td>
                    <td>100</td>
                    <td><input class="input-mini" type="text" ></td>
                    <td><a href="#">删除</a></td>
                  </tr>
                  <tr>
                    <td><img width="50px;" height="50px;" src="http://www.xiangxia.com/userfiles/image/5ba5b7a1-c262-4b64-8da3-feb702416882.jpg"/>
                      小南国黑米</td>

                    <td>g0113</td>
                    <td>500</td>
                    <td><input class="input-mini" type="text" ></td>
                    <td><a href="#">删除</a></td>
                  </tr>
                  <tr>
                    <td><img width="50px;" height="50px;" src="http://www.xiangxia.com/userfiles/image/5ba5b7a1-c262-4b64-8da3-feb702416882.jpg"/>
                      望江银鱼</td>

                    <td>g0114</td>
                    <td>568</td>
                    <td><input class="input-mini" type="text" ></td>
                    <td><a href="#">删除</a></td>
                  </tr>
                  <tr>
                    <td><img width="50px;" height="50px;" src="http://www.xiangxia.com/userfiles/image/5ba5b7a1-c262-4b64-8da3-feb702416882.jpg"/>
                      武昌湖大闸蟹</td>

                    <td>g0115</td>
                    <td>1898</td>
                    <td><input class="input-mini" type="text" ></td>
                    <td><a href="#">删除</a></td>
                  </tr>
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

