package supply

class LoginController {

    def jcaptchaService
    def roleService 
    def index() { }
    
    def login(){
        render(view: "login")
    }
    
    
    
    
    
    
    
    def authenticate = {
        if (!jcaptchaService.validateResponse("imageCaptcha", session.id, params.valiCode)){  
            flash.message = "验证码错误！"  
            forward(action: "login", params: params)
            return
        } 
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
		
        def user = User.findByLoginAndPassword(params.login, params.password.encodeAsPassword())
        
        if(user){
            def loginPOJO = new LoginPOJO();
            loginPOJO.user = user;
            loginPOJO.store = user.store;
            session.loginPOJO = loginPOJO;
            flash.message = "Hello ${user.name}!"
                    
            if(user.user_type == "company"){
                
                redirect(controller:"company", action:"indexManager")
                return
            }
            if(user.user_type == "store"){ 
                redirect(controller:"store", action:"indexManager")
                return
            }
                    
                          
        }else{
            flash.message = "用户名${params.login}与密码不正确，请重新再试."
            forward(action: "login", params: params)
            return
        }
        
          
    }
    
    
    
    
    
    
    def logout = {
        flash.message = "Goodbye ${session.loginPOJO.user.name}"
        session.loginPOJO.user = null
        redirect(controller:"login", action:"login")      
    } 
}
