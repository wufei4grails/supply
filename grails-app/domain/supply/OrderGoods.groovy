package supply

class OrderGoods {

	static constraints = {
	}
	
	static belongsTo = [shoppingOrder:ShoppingOrder]
    
	String goods_id;
	BigDecimal price;
	String num;
	Date dateCreated
	Date lastUpdated
}
