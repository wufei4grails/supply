package supply

class LoginController {

    def jcaptchaService
    def roleService 
    def index() { }
    
    def companyLogin(){
        render(view: "companyLogin")
    }
    
    def storeLogin(){
        render(view: "storeLogin")
    }
    
    
    
    
    
    def companyauthenticate = {
        //        if (!jcaptchaService.validateResponse("imageCaptcha", session.id, params.valiCode)){  
        //            flash.message = "验证码错误！"  
        //            redirect(action: "companyLogin", params: params)
        //            return
        //        } 
        //        println(request.post);
        //        println(request.forwardURI);
        
        
        //多线程发送邮件OK
//        Thread.start { 
//            sendMail{     
//                to "wufei1310@126.com"     
//                subject "Hello Fred"     
//                body 'How are you?' 
//            }
//        };
        
        def user = User.findByLoginAndPassword(params.login, params.password)
        
        if(user){
            def loginPOJO = new LoginPOJO();
            loginPOJO.user = user;
            session.loginPOJO = loginPOJO;
            flash.message = "Hello ${user.name}!"
                    
            if(user.user_type == "company"){
                
                redirect(controller:"company", action:"orderManager")
                return
            }
            if(user.user_type == "store"){
                flash.message = "门店账号不在此登陆."
                redirect(controller:"login",action: "companyLogin", params: params)
                return
            }
                    
                          
        }else{
            flash.message = "用户名${params.login}与密码不正确，请重新再试."
            redirect(action: "companyLogin", params: params)
            return
        }
        
          
    }
    
    
    def storeauthenticate = {
        //        if (!jcaptchaService.validateResponse("imageCaptcha", session.id, params.valiCode)){  
        //            flash.message = "验证码错误！"  
        //            redirect(action: "storeLogin", params: params)
        //            return
        //        } 
                
        def user = User.findByLoginAndPassword(params.login, params.password)
        if(user){
            def loginPOJO = new LoginPOJO();
            loginPOJO.user = user;
            session.loginPOJO = loginPOJO;
            session.user = user
            flash.message = "Hello ${user.name}!"
                    
            if(user.user_type == "store"){
                redirect(controller:"store", action:"orderManager")
                return
            }
            if(user.user_type == "company"){
                flash.message = "企业账号不在此登陆."
                redirect(controller:"login",action: "storeLogin", params: params)
                return
            }
                    
                          
        }else{
            flash.message = "用户名${params.login}与密码不正确，请重新再试."
            redirect(action: "storeLogin", params: params)
            return
        }
        
          
    }
    
    
    
    def logout = {
        flash.message = "Goodbye ${session.user.name}"
        session.user = null
        redirect(controller:"hello", action:"index")      
    } 
}
