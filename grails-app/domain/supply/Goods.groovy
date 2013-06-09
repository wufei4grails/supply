package supply
import groovy.transform.AutoClone

@AutoClone
class Goods {

    static constraints = {
        history_id(blank:true,nullable:true)
        img(blank:true,nullable:true)
        goods_text(size: 0..65535,blank:true,nullable:true)
    }
    
    static transients = ['num']  //不记录到数据 库
    
    BigDecimal price;
    String store_id;//
    String goods_name;
    String goods_sn;
    String c_id;
    String goods_text;
    String status; //on off
    String img;//主图，用于列表页显示图片
    Long history_id;//一条商品记录开始是由企业发布的，
    //当门店第一次选购后商品表新增商品数据表示为门店自己的商品。
    //当门店多次采购后，根据此id判断是否之前已经从企业曾经采购过了，则不再新增数据
    Long num;//库存数量
    Date dateCreated
    Date lastUpdated
}
