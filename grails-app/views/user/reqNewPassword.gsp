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

          <g:form data-validate="parsley" class="form-horizontal" controller="user" action="doNewPassword" method="post">
            <fieldset>
              <div id="legend" class="">
                <legend class="">修改密码</legend>
              </div>

              <g:if test="${flash.message}">
                <div class="alert alert-error">
                  <button type="button" class="close" data-dismiss="alert">&times;</button>
                  <strong>${flash.message}</strong>
                </div>
              </g:if>

              <div class="control-group">

                <!-- Text input-->
                <label class="control-label" for="input01">旧密码<font color="red">&nbsp;*</font></label>
                <div class="controls">
                  <input data-error-message="旧密码不能为空" data-required="true" type="password" name="oldPassword" placeholder="请输入旧密码" class="input-xlarge">
                  <p class="help-block"></p>
                </div>
              </div>

		<div class="control-group">

                <!-- Text input-->
                <label class="control-label" for="input01">新密码<font color="red">&nbsp;*</font></label>
                <div class="controls">
                  <input  data-required-message="密码不能为空"  data-required="true" type="password" id="password" name="password" placeholder="请输入密码" class="input-xlarge">
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

