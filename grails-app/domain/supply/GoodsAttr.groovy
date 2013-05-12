package supply
import groovy.transform.AutoClone
@AutoClone
class GoodsAttr {

    static constraints = {
    }
    
    String goods_id
    String attr_name
    String attr_val
    Date dateCreated
    Date lastUpdated
}
