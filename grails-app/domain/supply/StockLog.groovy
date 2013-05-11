package supply

class StockLog {

    static constraints = {
    }
    Long num;//进出货数量
    Long actnum;//当前库存数量
    String Store_id
    String store_goods_id//门店商品id
    String stock_type;//in:进货out:出货
    
    String attach_sn //进货时关联门店进货订单sn，出货时关联销售订单sn
    String attach_id
    Date dateCreated
	Date lastUpdated
    
}
