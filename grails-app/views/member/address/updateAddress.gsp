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

          <g:form data-validate="parsley" class="form-horizontal" controller="member" action="doUpdateAddress" method="post">
            <g:hiddenField name="id" value="${address?.id}" />
            <fieldset>
              <div id="legend" class="">
                <legend class="">修改收货地址</legend>
              </div>

              <g:if test="${flash.message}">
                <div class="alert alert-error">
                  <button type="button" class="close" data-dismiss="alert">&times;</button>
                  <strong>${flash.message}</strong>
                </div>
              </g:if>

              <div class="control-group">

                <!-- Text input-->
                <label class="control-label" for="input01">收货人姓名<font color="red">&nbsp;*</font></label>
                <div class="controls">
                  <input value="${address?.person_name}" name="person_name" data-error-message="收货人姓名不能为空" data-required="true" value="" type="text" placeholder="请输入收货人姓名" class="input-xlarge">
                  <p class="help-block"></p>
                </div>
              </div>


              <div class="control-group">

                <!-- Text input-->
                <label class="control-label" for="input01">选择地区<font color="red">&nbsp;*</font></label>
                <div class="controls" id="areaSelect">
                  <area:areaSeclect id="${address?.area_id}" controller="area" action="areaSelect" update="areaSelect"/> 
                  <p class="help-block"></p>
                </div>
              </div>

              <div class="control-group">

                <!-- Text input-->
                <label class="control-label" for="input01">详细地址<font color="red">&nbsp;*</font></label>
                <div class="controls">
                  <input value="${address.address}" data-error-message="门店地址不能为空" data-required="true" type="text" name="address" placeholder="请输入门店地址" class="input-xlarge">
                  <p class="help-block"></p>
                </div>
              </div>

              
              
              <div class="control-group">

                <!-- Text input-->
                <label class="control-label" for="input01">联系电话<font color="red">&nbsp;*</font></label>
                <div class="controls">
                  <input value="${address.telphone}" data-type="number" data-type-number-message="联系电话格式不正确" data-required-message="联系电话不能为空" data-required="true" type="text" name="telphone" placeholder="请输入联系电话" class="input-xlarge">
                  <p class="help-block"></p>
                </div>
              </div>
              
              
              <div class="control-group">

                <!-- Text input-->
                <label class="control-label" for="input01">是否设为默认收货地址</label>
                <div class="controls">
                  
                  <g:radioGroup name="id_default"
                                labels="['是','否']"
                                values="[1,0]"
                                value="${address.id_default}">
                  ${it.label} ${it.radio}
                  </g:radioGroup>
                  
                  
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

