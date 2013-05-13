package supply

class SaleOrderGoods {

	static constraints = {
	}
	
	static belongsTo = [saleOrder:SaleOrder]
    
	
	Goods goods;
	BigDecimal price;
	Long num;
	Date dateCreated
	Date lastUpdated
}
