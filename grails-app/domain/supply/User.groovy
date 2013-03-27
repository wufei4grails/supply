package supply

class User {

    static constraints = {
        login(blank:false)
        password(password:true)
    }
    static hasMany = [roles:Role]
    static belongsTo = [store:Store]
    String login
    String password
    String name
    String user_type //用户类型(company,store)
    Date dateCreated
    Date lastUpdated
  
    String toString(){
        name
    }
}
