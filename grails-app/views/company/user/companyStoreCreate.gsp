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
        <div class="span3">
          <div class="well sidebar-nav">
            <g:render template="/layouts/leftmenu"/>
          </div><!--/.well -->
        </div><!--/span-->
        <div class="span9">

          <g:form data-validate="parsley" class="form-horizontal" controller="user" action="doCompanyStoreCreate" method="post">
            <fieldset>
              <div id="legend" class="">
                <legend class="">分配门店账号</legend>
              </div>

              <g:if test="${flash.message}">
                <div class="alert alert-error">
                  <button type="button" class="close" data-dismiss="alert">&times;</button>
                  <strong>${flash.message}</strong>
                </div>
              </g:if>

              <div class="control-group">

                <!-- Text input-->
                <label class="control-label" for="input01">门店名称</label>
                <div class="controls">
                  <input data-error-message="门店名称不能为空" data-required="true" type="text" name="store_name" placeholder="请输入门店名称" class="input-xlarge">
                  <p class="help-block"></p>
                </div>
              </div>

              <div class="control-group">

                <!-- Text input-->
                <label class="control-label" for="input01">门店地址</label>
                <div class="controls">
                  <input type="text" name="address" placeholder="请输入门店地址" class="input-xlarge">
                  <p class="help-block"></p>
                </div>
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
                <label class="control-label"></label>

                <!-- Button -->
                <div class="controls">
                  <button type="submit" class="btn btn-primary">提交</button>
                </div>
              </div>

            </fieldset>
          </g:form>

        </div><!--/span-->
      </div><!--/row-->


      <g:render template="/layouts/company_footer"/>

    </div> <!-- /container -->

  </body>

</html>

