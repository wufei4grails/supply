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

    <g:form onSubmit="checkForm(this)" data-validate="parsley" class="form-signin" action="authenticate" method="post">
      <h2 class="form-signin-heading">猴坑茶业全程供应链管理平台</h2>
      <g:if test="${flash.message}">
        <div class="alert alert-error">
          <button type="button" class="close" data-dismiss="alert">&times;</button>
          <strong>${flash.message}</strong>
        </div>
      </g:if>

      <input data-error-message="用户名不能为空" data-required="true" id="login" name="login" type="text" class="input-block-level" placeholder="请输入用户名">
      <input data-error-message="密码不能为空" data-required="true" id="password" name="password" type="password" class="input-block-level" placeholder="请输入密码">
      <input maxlength="4" name="valiCode" style="width: 40%" type="text" class="input-block-level" placeholder="请输入验证码">
      <jcaptcha:jpeg name="imageCaptcha" id="imageCaptcha" style="width: 40%;margin-bottom: 10px;" width="10px;"/>

      <a href="javascript:void(0)" onclick="changeCode()">看不清?</a>
      <button data-loading-text="正在登录..." id="subbotton" class="btn btn-large btn-primary" type="submit">登录</button>
    </g:form>

  </div> <!-- /container -->
  <style type="text/css">

    .custom-error-message{
      padding: 5px;
      color: #b94a48;
      background-color: #f2dede;
      border-color: #eed3d7;
      list-style: none;
      height: 20px;
      margin-left: -25px;
      margin-top: -10px;
    }

    body {
      padding-top: 40px;
      padding-bottom: 40px;
      background-color: #f5f5f5;
    }

    .form-signin {
      max-width: 500px;
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
	function checkForm(o){
		var login = $(o).find("#login").val()
		var password = $(o).find("#password").val()
		if(login!=''&&password!=''){
			$('#subbotton').button('loading');
		}
		
	}
	  
    function changeCode(){
      document.getElementById("imageCaptcha").src="<%=request.getContextPath()%>/jcaptcha/jpeg/imageCaptcha?id="+ new Date();
    }
  </script>

</body>

</html>

