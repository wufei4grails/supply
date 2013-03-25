package supply

class LoginTagLib {
    def loginControl = {
        if(session.user){
            out << "欢迎您， ${session.user.name} "
            out << """[${link(action:"logout", controller:"user"){"退出"}}]"""
        } else {
            out << """[${link(action:"login", controller:"user"){"退出"}}]"""      
        }
    }
}
