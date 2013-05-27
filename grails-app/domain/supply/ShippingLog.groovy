package supply

class ShippingLog {

    static constraints = {
	    remark(blank:true,nullable:true)
	    operuser(blank:true,nullable:true)
    }
    
	
	Long order_id;
	String operuser;
	String remark;
	Date dateCreated
	Date lastUpdated
}
