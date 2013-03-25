package supply

class Role {

    static constraints = {
    }
    
    String rolename;//company,store
    static hasMany = [menus:Menu]
}
