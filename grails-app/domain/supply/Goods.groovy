package supply

class Goods {

    static constraints = {
        goods_text(size: 0..65535)
    }
    
    BigDecimal price;
    String goods_name;
    String goods_sn;
    String c_id;
    String goods_text;
    Date dateCreated
    Date lastUpdated
}
