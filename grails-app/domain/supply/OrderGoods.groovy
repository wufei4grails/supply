package supply

class OrderGoods {

	static constraints = {
	}
	
	static belongsTo = [shoppingOrder:ShoppingOrder]
    
	
	Goods goods;
	BigDecimal price;
	Long num;
	Date dateCreated
	Date lastUpdated
}
