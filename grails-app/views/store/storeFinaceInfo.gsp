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
            <li ><a href="storeInfo">门店基本资料</a></li>
            <li class=""><a href="storeAddress">门店收货地址</a></li>
            <li class="active"><a href="storeFinaceInfo">采购财务记录</a></li>
          </ul>
        </div><!--/.well -->
      </div><!--/span-->
      <div class="span9">
        <div id="legend" class="">


          <legend class="">
            采购财务记录

          </legend>


        </div>




        <table class="table table-hover">
          <thead>
            <tr>
              <th>时间</th>
              <th>收入</th>
              <th>支出</th>
              <th>余额</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>2013-03-21 15:04:47</td>
              <td>1.87</td>
              <td></td>
              <td>957.77</td>
            </tr>
            <tr>
              <td>2013-03-21 13:30:45</td>
              <td></td>
              <td>23.96</td>
              <td>955.90</td>
            </tr>
            <tr>
              <td>2013-03-21 13:29:52</td>
              <td></td>
              <td>20.14  </td>
              <td>979.86</td>            
            </tr>
            <tr>
              <td>2013-03-21 12:35:27</td>
              <td>1000.00</td>
              <td></td>
              <td>1000.00</td>            
            </tr>
          </tbody>
        </table>
        <div class="pagination pagination-right">
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

