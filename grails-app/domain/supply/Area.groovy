package supply

class Area {

    static constraints = {
        tag(nullable:true)
    }
    
    static mapping = { 
     
        table "area"
        version false 
        columns { 
            id column: "area_id"
        } 
    }
    
    
    String area_pid
    String level
    String area_name
    int sort_no
    String add_user
    Date add_time
    String tag
}
