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
            <li class="active"><a href="storeAddress">门店收货地址</a></li>
            <li ><a href="storeFinaceInfo">采购财务记录</a></li>
          </ul>
        </div><!--/.well -->
      </div><!--/span-->
      <div class="span9">

        <form class="form-horizontal">
          <fieldset>
            <div id="legend" class="">
              <legend class="">新增收货地址</legend>
            </div>
            <div class="control-group">

              <!-- Text input-->
              <label class="control-label" for="input01">收货人姓名</label>
              <div class="controls">
                <input type="text" placeholder="请输入收货人姓名" class="input-large">
                <p class="help-block"></p>
              </div>
            </div>

            <div class="control-group">

              <!-- Text input-->
              <label class="control-label" for="input01">省份</label>
              <div class="controls">
                <select style="width:100px;">
                  <option>安徽</option>
                  <option>上海</option>
                  <option>北京</option>
                  <option>山东</option>
                  <option>湖南</option>
                </select>
                <select style="width:100px;">
                  <option>合肥</option>
                  <option>安庆</option>
                  <option>淮南</option>
                </select>
                <select style="width:100px;">
                  <option>高新区</option>
                  <option>政务区</option>
                  <option>蜀山区</option>
                </select>
                <p class="help-block"></p>
              </div>
            </div>
            <div class="control-group">

              <!-- Text input-->
              <label class="control-label" for="input01">地址</label>
              <div class="controls">
                <input type="text" placeholder="请输入地址" class="input-xlarge">
                <p class="help-block"></p>
              </div>
            </div>
            
            
            <div class="control-group">

              <!-- Text input-->
              <label class="control-label" for="input01">手机号码</label>
              <div class="controls">
                <input type="text" placeholder="请输入手机号码" class="input-large">
                <p class="help-block"></p>
              </div>
            </div>
            
            <div class="control-group">

              <!-- Text input-->
              <label class="control-label" for="input01">固定电话</label>
              <div class="controls">
                <input type="text" placeholder="请输入固定电话" class="input-large">
                <p class="help-block"></p>
              </div>
            </div>
            
            <div class="control-group">

              <!-- Text input-->
              <label class="control-label" for="input01">电子邮件</label>
              <div class="controls">
                <input type="text" placeholder="请输入电子邮件" class="input-large">
                <p class="help-block"></p>
              </div>
            </div>
            
            <div class="control-group">

              <!-- Text input-->
              <label class="control-label" for="input01">邮编</label>
              <div class="controls">
                <input type="text" placeholder="请输入邮编" class="input-large">
                <p class="help-block"></p>
              </div>
            </div>


            <div class="control-group">
              <label class="control-label"></label>

              <!-- Button -->
              <div class="controls">
                <button class="btn btn-primary">提交</button>
                <a href="storeAddress" class="btn btn-default">返回</a>
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

