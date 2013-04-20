package supply

class Address implements Comparable{

    static constraints = {
        area_id(nullable:true)
    }
    
    int compareTo(obj) {
        dateCreated.compareTo(obj.dateCreated)
    }
    static belongsTo = [store:Store]
    
    String area_id
    String address
    String telphone
    String person_name //收货人名字
    String id_default;//0 不是 1：是
    
    Date dateCreated
    Date lastUpdated
}
