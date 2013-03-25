package supply

class Menu {

    static constraints = {
        menutype(inList: ['company','store'])  
    }
    static hasMany = [roles:Role]
    static belongsTo = Role
    
    String menuid
    String menuname
    String controller
    String action
    int sort
    String menutype
    int level
}
