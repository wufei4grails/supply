package supply

class Store {

    static constraints = {
        address(blank:true,nullable:true)
        area_id(nullable:true)
        contact_person(blank:true,nullable:true)
        contact_phone(blank:true,nullable:true)
    }
    static hasMany = [ users : User ]
    
    String store_name
    String address
    String contact_person
    String contact_phone
    String store_type;//company,store
    String area_id
    Date dateCreated
    Date lastUpdated
}
