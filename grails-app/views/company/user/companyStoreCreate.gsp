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
                <label class="control-label" for="input01">门店名称<font color="red">&nbsp;*</font></label>
                <div class="controls">
                  <input data-error-message="门店名称不能为空" data-required="true" type="text" name="store_name" placeholder="请输入门店名称" class="input-xlarge">
                  <p class="help-block"></p>
                </div>
              </div>
              
              
              <div class="control-group">

                <!-- Text input-->
                <label class="control-label" for="input01">选择地区<font color="red">&nbsp;*</font></label>
                <div class="controls" id="areaSelect">
                  <area:areaSeclect id="0100102100" controller="area" action="areaSelect" update="areaSelect"/> 
                  <p class="help-block"></p>
                </div>
              </div>
              

              <div class="control-group">

                <!-- Text input-->
                <label class="control-label" for="input01">门店地址<font color="red">&nbsp;*</font></label>
                <div class="controls">
                  <input data-error-message="门店地址不能为空" data-required="true" type="text" name="address" placeholder="请输入门店地址" class="input-xlarge">
                  <p class="help-block"></p>
                </div>
              </div>
              
              
              <div class="control-group">

                <!-- Text input-->
                <label class="control-label" for="input01">联系人<font color="red">&nbsp;*</font></label>
                <div class="controls">
                  <input data-error-message="联系人不能为空" data-required="true" type="text" name="contact_person" placeholder="请输入联系人" class="input-xlarge">
                  <p class="help-block"></p>
                </div>
              </div>
              
              
              <div class="control-group">

                <!-- Text input-->
                <label class="control-label" for="input01">门店电话<font color="red">&nbsp;*</font></label>
                <div class="controls">
                  <input data-type="number" data-type-number-message="门店电话格式不正确" data-required-message="门店电话不能为空" data-required="true" type="text" name="contact_phone" placeholder="请输入门店电话" class="input-xlarge">
                  <p class="help-block"></p>
                </div>
              </div>


              <div class="control-group">
                <!-- Text input-->
                <label class="control-label" for="input01">用户名<font color="red">&nbsp;*</font></label>
                <div class="controls">
                  <input data-error-message="用户名不能为空" data-required="true" type="text" name="login" placeholder="请输入用户名" class="input-xlarge">
                  <p class="help-block"></p>
                </div>
              </div>

              <div class="control-group">

                <!-- Text input-->
                <label class="control-label" for="input01">密码<font color="red">&nbsp;*</font></label>
                <div class="controls">
                  <input data-minlength-message="密码至少需要6位数字" data-minlength="6"  data-required-message="密码不能为空"  data-required="true" type="password" id="password" name="password" placeholder="请输入密码" class="input-xlarge">
                  <p class="help-block"></p>
                </div>
              </div>
              
              
              <div class="control-group">

                <!-- Text input-->
                <label class="control-label" for="input01">再输入一次密码<font color="red">&nbsp;*</font></label>
                <div class="controls">
                  <input data-equalto-message="两次密码输入的不一致" data-required-message="密码不能为空" data-equalto="#password" data-required="true" type="password" id="repassword" name="repassword" placeholder="请输入密码" class="input-xlarge">
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

