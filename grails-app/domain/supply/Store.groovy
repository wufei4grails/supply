package supply

class Store {

    SortedSet addresses
    
    static constraints = {
        address(blank:true,nullable:true)
        area_id(nullable:true)
        contact_person(blank:true,nullable:true)
        contact_phone(blank:true,nullable:true)
        contact_tel_phone(blank:true,nullable:true)
        bank_name(nullable:true)
        bank_account_name(nullable:true)
        bank_account_no(nullable:true)
    }
    static hasMany = [ users : User,addresses : Address ]
    
    String store_name
    String address
    String contact_person
    String contact_phone
    String contact_tel_phone //门店联系手机
    String store_type;//company,store
    String area_id
    
    String bank_name;
    String bank_account_name;
    String bank_account_no;
    
    Date dateCreated
    Date lastUpdated
}
