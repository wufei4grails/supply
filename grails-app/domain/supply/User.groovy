package supply

class User {

    static constraints = {
        login(blank:false)
        password(password:true)
    }
    
    String login
    String password
    String name
    String user_type //用户类型(company,store)
    
  
    String toString(){
        name
    }
}
