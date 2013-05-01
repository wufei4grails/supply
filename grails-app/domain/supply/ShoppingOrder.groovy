package supply

class ShoppingOrder {

	static constraints = {
	}
    
	static hasMany = [ orderGoods : OrderGoods ]
	
	String order_sn;
	String amount;
	String buy_user;
	String area_id
	String address
	String telphone
	String person_name //收货人名字
	String status;//waitpay,waitship,waitconfirm,success,notpayclose,notshipclose
	Long payTime
	Date dateCreated
	Date lastUpdated
}
