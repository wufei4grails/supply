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
      <div class="span3">
        <div class="well sidebar-nav">
          <ul class="nav nav-list">
            <!--<li class="nav-header">Sidebar</li>-->
            <li class="active"><a href="storeInfo">门店基本资料</a></li>
            <li ><a href="storeAddress">门店收货地址</a></li>
            <li ><a href="storeFinaceInfo">采购财务记录</a></li>
          </ul>
        </div><!--/.well -->
      </div><!--/span-->
      <div class="span9">

        <form class="form-horizontal">
          <fieldset>
            <div id="legend" class="">
              <legend class="">门店基本资料</legend>
            </div>
            <div class="control-group">

              <!-- Text input-->
              <label class="control-label" for="input01">用户名</label>
              <div class="controls">
                <input type="text" placeholder="请输入用户名" class="input-xlarge">
                <p class="help-block"></p>
              </div>
            </div>

            <div class="control-group">

              <!-- Text input-->
              <label class="control-label" for="input01">密码</label>
              <div class="controls">
                <input type="text" placeholder="请输入密码" class="input-xlarge">
                <p class="help-block"></p>
              </div>
            </div>
            
            <div class="control-group">

              <!-- Text input-->
              <label class="control-label" for="input01">固定电话</label>
              <div class="controls">
                <input type="text" placeholder="请输入固定电话" class="input-xlarge">
                <p class="help-block"></p>
              </div>
            </div>
            
            <div class="control-group">

              <!-- Text input-->
              <label class="control-label" for="input01">手机号码</label>
              <div class="controls">
                <input type="text" placeholder="请输入手机号码" class="input-xlarge">
                <p class="help-block"></p>
              </div>
            </div>

            <div class="control-group">

              <!-- Text input-->
              <label class="control-label" for="input01">门店名称</label>
              <div class="controls">
                <input type="text" placeholder="请输入门店名称" class="input-xlarge">
                <p class="help-block"></p>
              </div>
            </div>

            <div class="control-group">

              <!-- Text input-->
              <label class="control-label" for="input01">门店地址</label>
              <div class="controls">
                <input type="text" placeholder="请输入门店地址" class="input-xlarge">
                <p class="help-block"></p>
              </div>
            </div>
            
            <div class="control-group">

              <!-- Text input-->
              <label class="control-label" for="input01">银行账号</label>
              <div class="controls">
                <input type="text" placeholder="请输入银行账号" class="input-xlarge">
                <p class="help-block"></p>
              </div>
            </div>
            
            
            <div class="control-group">

              <!-- Text input-->
              <label class="control-label" for="input01">银行开户人姓名</label>
              <div class="controls">
                <input type="text" placeholder="请输入银行开户人姓名" class="input-xlarge">
                <p class="help-block"></p>
              </div>
            </div>

            <div class="control-group">
              <label class="control-label"></label>

              <!-- Button -->
              <div class="controls">
                <button class="btn btn-primary">提交</button>
              </div>
            </div>

          </fieldset>
        </form>

      </div><!--/span-->
    </div><!--/row-->


    <g:render template="/layouts/company_footer"/>

  </div> <!-- /container -->

</body>

</html>

