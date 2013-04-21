package supply

class LoginTagLib {
    def loginControl = {
        if(session.loginPOJO){
            out << "欢迎您， ${session.loginPOJO.user.name} "
            out << """[${link(action:"logout", controller:"login"){"退出"}}]"""
        } else {
            out << """[${link(action:"login", controller:"login"){"进入系统"}}]"""      
        }
    }
}
