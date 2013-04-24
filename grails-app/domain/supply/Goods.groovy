package supply

class Goods {

    static constraints = {
        img(blank:true,nullable:true)
        goods_text(size: 0..65535,blank:true,nullable:true)
    }
    
    BigDecimal price;
    String goods_name;
    String goods_sn;
    String c_id;
    String goods_text;
    String status; //on off
    String img;//主图，用于列表页显示图片
    Date dateCreated
    Date lastUpdated
}
