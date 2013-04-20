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

          <g:form data-validate="parsley" class="form-horizontal" controller="member" action="doUpdateStoreInfo" method="post">
            <fieldset>
              <div id="legend" class="">
                <legend class="">门店基本资料</legend>
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
                  <input name="store_name" data-error-message="门店名称不能为空" data-required="true" value="${session.loginPOJO.store.store_name}" type="text" placeholder="请输入门店名称" class="input-xlarge">
                  <p class="help-block"></p>
                </div>
              </div>


              <div class="control-group">

                <!-- Text input-->
                <label class="control-label" for="input01">选择地区<font color="red">&nbsp;*</font></label>
                <div class="controls" id="areaSelect">
                  <area:areaSeclect id="${session.loginPOJO.store.area_id}" controller="area" action="areaSelect" update="areaSelect"/> 
                  <p class="help-block"></p>
                </div>
              </div>

              <div class="control-group">

                <!-- Text input-->
                <label class="control-label" for="input01">门店地址<font color="red">&nbsp;*</font></label>
                <div class="controls">
                  <input value="${session.loginPOJO.store.address}" data-error-message="门店地址不能为空" data-required="true" type="text" name="address" placeholder="请输入门店地址" class="input-xlarge">
                  <p class="help-block"></p>
                </div>
              </div>

              <div class="control-group">

                <!-- Text input-->
                <label class="control-label" for="input01">联系人<font color="red">&nbsp;*</font></label>
                <div class="controls">
                  <input value="${session.loginPOJO.store.contact_person}" data-error-message="联系人不能为空" data-required="true" type="text" name="contact_person" placeholder="请输入联系人" class="input-xlarge">
                  <p class="help-block"></p>
                </div>
              </div>
              
              
              <div class="control-group">

                <!-- Text input-->
                <label class="control-label" for="input01">门店电话<font color="red">&nbsp;*</font></label>
                <div class="controls">
                  <input value="${session.loginPOJO.store.contact_phone}" data-type="number" data-type-number-message="门店电话格式不正确" data-required-message="门店电话不能为空" data-required="true" type="text" name="contact_phone" placeholder="请输入门店电话" class="input-xlarge">
                  <p class="help-block"></p>
                </div>
              </div>
              
              <div class="control-group">

                <!-- Text input-->
                <label class="control-label" for="input01">门店联系手机<font color="red">&nbsp;*</font></label>
                <div class="controls">
                  <input value="${session.loginPOJO.store.contact_tel_phone}" data-type="number" data-type-number-message="门店联系手机格式不正确" data-required-message="门店联系手机不能为空" data-required="true" type="text" name="contact_tel_phone" placeholder="请输入门店联系手机" class="input-xlarge">
                  <p class="help-block"></p>
                </div>
              </div>


              <div class="control-group">

                <!-- Text input-->
                <label class="control-label" for="input01">开户银行</label>
                <div class="controls">
                  <input value="${session.loginPOJO.store.bank_name}" type="text" name="bank_name" placeholder="请输入开户银行" class="input-xlarge">
                  <p class="help-block"></p>
                </div>
              </div>


              <div class="control-group">
                <!-- Text input-->
                <label class="control-label" for="input01">银行账号</label>
                <div class="controls">
                  <input value="${session.loginPOJO.store.bank_account_no}" data-type="number" data-type-number-message="银行账号格式不正确" type="text" name="bank_account_no" placeholder="请输入银行账号" class="input-xlarge">
                  <p class="help-block"></p>
                </div>
              </div>


              <div class="control-group">

                <!-- Text input-->
                <label class="control-label" for="input01">银行开户人姓名</label>
                <div class="controls">
                  <input value="${session.loginPOJO.store.bank_account_name}" type="text" name="bank_account_name" placeholder="请输入银行开户人姓名" class="input-xlarge">
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

