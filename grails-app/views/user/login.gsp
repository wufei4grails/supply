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

    <g:form class="form-signin" action="authenticate" method="post">
      <h2 class="form-signin-heading">企业全程供应链管理平台</h2>
      <g:if test="${flash.message}">
        <div class="alert alert-error">
          <button type="button" class="close" data-dismiss="alert">&times;</button>
          <strong>${flash.message}</strong>
        </div>
      </g:if>

      <input id="login" name="login" type="text" class="input-block-level" placeholder="请输入用户名">
      <input id="password" name="password" type="password" class="input-block-level" placeholder="请输入密码">
      <input name="valiCode" style="width: 40%" type="text" class="input-block-level" placeholder="请输入验证码">
      <jcaptcha:jpeg name="imageCaptcha" id="imageCaptcha" style="width: 40%;margin-bottom: 10px;" width="10px;"/>

      <a href="javascript:void(0)" onclick="changeCode()">看不清?</a>
      <button class="btn btn-large btn-primary" type="submit">登录</button>
      <a href="store/login">门店入口</a>
    </g:form>

  </div> <!-- /container -->
  <style type="text/css">
    body {
      padding-top: 40px;
      padding-bottom: 40px;
      background-color: #f5f5f5;
    }

    .form-signin {
      max-width: 400px;
      padding: 19px 29px 29px;
      margin: 0 auto 20px;
      background-color: #fff;
      border: 1px solid #e5e5e5;
      -webkit-border-radius: 5px;
      -moz-border-radius: 5px;
      border-radius: 5px;
      -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
      -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
      box-shadow: 0 1px 2px rgba(0,0,0,.05);
    }
    .form-signin .form-signin-heading,
    .form-signin .checkbox {
      margin-bottom: 10px;
    }
    .form-signin input[type="text"],
    .form-signin input[type="password"] {
      font-size: 16px;
      height: auto;
      margin-bottom: 15px;
      padding: 7px 9px;
    }

  </style>
  <script>
    function changeCode(){
      document.getElementById("imageCaptcha").src="/jcaptcha/jpeg/imageCaptcha?id="+ new Date();
    }
  </script>

</body>

</html>

