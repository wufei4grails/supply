package supply
//门店库存表，
class Stock {

    static constraints = {
    }
    
	
	String store_id
	String goods_name
	String company_goods_id//对应企业商品id
	String store_goods_id//对应门店新生成的商品id
	BigDecimal price;
	Long num;
	Date dateCreated
	Date lastUpdated
}
