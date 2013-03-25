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

    <g:render template="/layouts/company_header"/>


    <div class="row-fluid">
      <div class="span3">
        <div class="well sidebar-nav">
          <ul class="nav nav-list">
            <!--<li class="nav-header">Sidebar</li>-->
            <li class="active"><a href="sysParamList">系统参数配置</a></li>
          </ul>
        </div><!--/.well -->
      </div><!--/span-->
      <div class="span9">
        <div id="legend" class="">
          <legend class="">系统参数配置</legend>
        </div>



        <table class="table table-hover">
          <thead>
            <tr>
              <th>参数名称</th>
              <th>说明</th>
              <th>参数值</th>
              <th>操作</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>company_phone</td>
              <td>企业联系手机号码</td>
              <td><input value="13899998888" type="text" placeholder="" class="input-small"></td>
              <td><a href="#" class="btn btn-primary">修改</a></td>
            </tr>
            <tr>
              <td>pay_out_time</td>
              <td>付款超时取消时间(单位：小时)</td>
              <td><input value="24" type="text" placeholder="" class="input-small"></td>
              <td><a href="#" class="btn btn-primary">修改</a></td>
            </tr>
            <tr>
              <td>ship_out_time</td>
              <td>发货超时取消时间(单位：小时)</td>
              <td><input value="48" type="text" placeholder="" class="input-small"></td>
              <td><a href="#" class="btn btn-primary">修改</a></td>
            </tr>
          </tbody>
        </table>
      </div><!--/span-->
    </div><!--/row-->


    <g:render template="/layouts/company_footer"/>

  </div> <!-- /container -->

</body>

</html>

