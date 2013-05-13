package supply

//门店进货订单
class ShoppingOrder {

	static constraints = {
		company_id(blank:true,nullable:true)
		payTime(blank:true,nullable:true)
		shipTime(blank:true,nullable:true)
		confirmTime(blank:true,nullable:true)
	}
    
	static hasMany = [ orderGoods : OrderGoods ]
	
	String company_id;//企业id
	String store_id;//门店id
	String order_sn;
	String amount;
	String buy_user;
	String area_id
	String address
	String telphone
	String person_name //收货人名字
	String status;//waitpay,waitship,waitconfirm,success,notpayclose,notshipclose
	Long payTime
	Long shipTime
	Long confirmTime
	Date dateCreated
	Date lastUpdated
}
