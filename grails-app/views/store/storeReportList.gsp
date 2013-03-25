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
      <div class="span3">
        <div class="well sidebar-nav">
          <ul class="nav nav-list">
            <!--<li class="nav-header">Sidebar</li>-->
            <li class="active"><a href="storeReportList">门店销售统计报表</a></li>
          </ul>
        </div><!--/.well -->
      </div><!--/span-->
      <div class="span9">
        <div id="legend" class="">
          <legend class="">
            2013年度中粮蜀山店销售统计报表
            
            
            <div class="btn-group" style="float: right;margin-right: 5px;">
              <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                历史报表
                <span class="caret"></span>
              </a>
              <ul class="dropdown-menu">
                <li><a href="#">2013年</a></li>
                <li><a href="#">2012年</a></li>
                <li><a href="#">2011年</a></li>
                <li><a href="#">2010年</a></li>
              </ul>
            </div>
          </legend>

        </div>


        <ul id="myTab" class="nav nav-tabs">
          <li class="active"><a href="#one" data-toggle="tab">第一季度</a></li>
          <li class=""><a href="#two" data-toggle="tab">第二季度</a></li>
          <li class=""><a href="#three" data-toggle="tab">第三季度</a></li>
          <li class=""><a href="#foure" data-toggle="tab">第四季度</a></li>
        </ul>
        <div id="myTabContent" class="tab-content">
          <div class="tab-pane fade active in" id="one">
            <table class="table table-hover">
              <thead>
                <tr>
                  <th>商品名称</th>
                  <th>商品编号</th>
                  <th>价格</th>
                  <th>数量</th>
                  <th>小计</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>东北大米</td>
                  <td>g0112</td>
                  <td>100</td>
                  <td>2</td>
                  <td>200</td>
                </tr>
                <tr>
                  <td>武昌湖大闸蟹</td>
                  <td>g0115</td>
                  <td>1898</td>
                  <td>1</td>
                  <td>1898</td>
                </tr>
                <tr>
                  <td></td>
                  <td></td>
                  <td>总计</td>
                  <td>3</td>
                  <td>2098</td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="tab-pane fade" id="two">
            <table class="table table-hover">
              <thead>
                <tr>
                  <th>商品名称</th>
                  <th>商品编号</th>
                  <th>价格</th>
                  <th>数量</th>
                  <th>小计</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>东北大米</td>
                  <td>g0112</td>
                  <td>100</td>
                  <td>2</td>
                  <td>200</td>
                </tr>
                <tr>
                  <td>武昌湖大闸蟹</td>
                  <td>g0115</td>
                  <td>1898</td>
                  <td>1</td>
                  <td>1898</td>
                </tr>
                <tr>
                  <td></td>
                  <td></td>
                  <td>总计</td>
                  <td>3</td>
                  <td>2098</td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="tab-pane fade" id="three">
            <table class="table table-hover">
              <thead>
                <tr>
                  <th>商品名称</th>
                  <th>商品编号</th>
                  <th>价格</th>
                  <th>数量</th>
                  <th>小计</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>东北大米</td>
                  <td>g0112</td>
                  <td>100</td>
                  <td>2</td>
                  <td>200</td>
                </tr>
                <tr>
                  <td>武昌湖大闸蟹</td>
                  <td>g0115</td>
                  <td>1898</td>
                  <td>1</td>
                  <td>1898</td>
                </tr>
                <tr>
                  <td></td>
                  <td></td>
                  <td>总计</td>
                  <td>3</td>
                  <td>2098</td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="tab-pane fade" id="foure">
            <table class="table table-hover">
              <thead>
                <tr>
                  <th>商品名称</th>
                  <th>商品编号</th>
                  <th>价格</th>
                  <th>数量</th>
                  <th>小计</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>东北大米</td>
                  <td>g0112</td>
                  <td>100</td>
                  <td>2</td>
                  <td>200</td>
                </tr>
                <tr>
                  <td>武昌湖大闸蟹</td>
                  <td>g0115</td>
                  <td>1898</td>
                  <td>1</td>
                  <td>1898</td>
                </tr>
                <tr>
                  <td></td>
                  <td></td>
                  <td>总计</td>
                  <td>3</td>
                  <td>2098</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>


      </div><!--/span-->
    </div><!--/row-->


    <g:render template="/layouts/company_footer"/>

  </div> <!-- /container -->

</body>

</html>

