import supply.User
import supply.Menu
import grails.util.GrailsUtil
import supply.Role
import supply.Store
import supply.GoodsCategory
import supply.Goods

class BootStrap {

    def init = { servletContext ->
        switch(GrailsUtil.environment){
        case "development":
            
            
            //初始化菜单
	    def m0 = new Menu(level: 1,menuid:"100", menuname:"企业首页", controller:"company",action:"indexManager",menutype:"company",sort:"100")
	    def m0_1 = new Menu(level: 2,menuid:"100101", menuname:"信息中心", controller:"company",action:"allInfo",menutype:"company",sort:"100")
	    def m0_2 = new Menu(level: 2,menuid:"100102", menuname:"修改密码", controller:"user",action:"reqNewPassword",menutype:"company",sort:"90")
	    def m0_2_1 = new Menu(level: 3,menuid:"100102101", menuname:"修改密码", controller:"user",action:"doNewPassword",menutype:"company",sort:"100")
			
            def m1 = new Menu(level: 1,menuid:"101", menuname:"订单管理", controller:"order",action:"companyOrderManager",menutype:"company",sort:"3")
            def m1_1 = new Menu(level: 2,menuid:"101101", menuname:"订单列表", controller:"order",action:"companyOrderList",menutype:"company",sort:"3")
            def m1_1_1 = new Menu(level: 3,menuid:"101101101", menuname:"查看订单", controller:"order",action:"companyOrderDetail",menutype:"company",sort:"3")
            def m1_1_2 = new Menu(level: 3,menuid:"101101102", menuname:"修改订单金额", controller:"order",action:"companyUpdateOrderAmount",menutype:"company",sort:"3")
            def m1_1_3 = new Menu(level: 3,menuid:"101101103", menuname:"企业发货", controller:"order",action:"companyShipOrder",menutype:"company",sort:"3")
            
            
            def m2 = new Menu(level: 1,menuid:"102", menuname:"门店管理", controller:"company",action:"storeManager",menutype:"company",sort:"2")
            def m2_1 = new Menu(level: 2,menuid:"102101", menuname:"门店列表", controller:"user",action:"companyStoreList",menutype:"company",sort:"1")
            def m2_2 = new Menu(level: 2,menuid:"102102", menuname:"分配门店账号", controller:"user",action:"reqCompanyStoreCreate",menutype:"company",sort:"2")
            def m2_2_1 = new Menu(level: 3,menuid:"102102101", menuname:"分配门店账号", controller:"user",action:"doCompanyStoreCreate",menutype:"company",sort:"2")
            
            
            def m3 = new Menu(level: 1,menuid:"103", menuname:"商品管理", controller:"company",action:"goodsManager",menutype:"company",sort:"1")
            def m3_1 = new Menu(level: 2,menuid:"103101", menuname:"商品分类管理", controller:"goods",action:"categoryManager",menutype:"company",sort:"1")
            def m3_2 = new Menu(level: 2,menuid:"103102", menuname:"发布商品", controller:"goods",action:"reqAddGoods",menutype:"company",sort:"2")
            def m3_3 = new Menu(level: 2,menuid:"103103", menuname:"商品列表", controller:"goods",action:"reqGoodsList",menutype:"company",sort:"3")
            def m3_4 = new Menu(level: 3,menuid:"103104", menuname:"修改商品", controller:"goods",action:"reqUpdateGoods",menutype:"company",sort:"3")
            
            
            
            def companyrole = new Role(rolename:"company");
	    companyrole.addToMenus(m0);
            companyrole.addToMenus(m0_1)
	    companyrole.addToMenus(m0_2)
	    companyrole.addToMenus(m0_2_1)
			
            companyrole.addToMenus(m1);
            companyrole.addToMenus(m1_1)
            companyrole.addToMenus(m1_1_1)
            companyrole.addToMenus(m1_1_2)
	    companyrole.addToMenus(m1_1_3)
            companyrole.addToMenus(m2);
            companyrole.addToMenus(m2_1);
            companyrole.addToMenus(m2_2);
            companyrole.addToMenus(m2_2_1);
            companyrole.addToMenus(m3);
            companyrole.addToMenus(m3_1);
            companyrole.addToMenus(m3_2);
            companyrole.addToMenus(m3_3);
            companyrole.addToMenus(m3_4);
            //            companyrole.save();
            
            
            def companyStore = new Store(store_name:"企业",store_type:"company",address:"");
            def admin = new User(login:"admin", password:"111111".encodeAsPassword(),name:"wufei",user_type:"company")
            admin.addToRoles(companyrole)
            companyStore.addToUsers(admin)
            companyStore.save()
            
           
            //门店菜单，角色，权限数据初始化
            def m4 = new Menu(level: 1,menuid:"104", menuname:"门店信息管理", controller:"member",action:"memberManager",menutype:"store",sort:"9")
            def m4_1 = new Menu(level: 2,menuid:"104101", menuname:"门店基本资料", controller:"member",action:"reqStoreInfo",menutype:"store",sort:"1")
            def m4_2 = new Menu(level: 2,menuid:"104102", menuname:"门店收货地址", controller:"member",action:"reqAddressList",menutype:"store",sort:"2")
            def m4_2_1 = new Menu(level: 3,menuid:"104102101", menuname:"添加新收货地址", controller:"member",action:"reqAddAddress",menutype:"store",sort:"1")
            def m4_2_2 = new Menu(level: 3,menuid:"104102102", menuname:"修改收货地址", controller:"member",action:"reqUpdateAddress",menutype:"store",sort:"1")
            //采购商品流程
            def m5 = new Menu(level: 1,menuid:"105", menuname:"采购商品", controller:"shopping",action:"shoppingManager",menutype:"store",sort:"8")
            def m5_1 = new Menu(level: 2,menuid:"105101", menuname:"采购商品", controller:"shopping",action:"shoppingGoodsList",menutype:"store",sort:"8")
            def m5_2 = new Menu(level: 3,menuid:"105101101", menuname:"查看商品", controller:"shopping",action:"buyGoodsDetail",menutype:"store",sort:"8")
	    def m5_3 = new Menu(level: 3,menuid:"105101102", menuname:"直接购买跳转购物车", controller:"shopping",action:"gotoCart",menutype:"store",sort:"8")
            def m5_4 = new Menu(level: 3,menuid:"105101103", menuname:"跳转购物车", controller:"shopping",action:"reqCart",menutype:"store",sort:"8")
	    def m5_5 = new Menu(level: 3,menuid:"105101104", menuname:"填写核对订单信息", controller:"shopping",action:"checkOrder",menutype:"store",sort:"8")
	    def m5_6 = new Menu(level: 3,menuid:"105101105", menuname:"订单提交", controller:"shopping",action:"payOrder",menutype:"store",sort:"8")
	    def m5_7 = new Menu(level: 3,menuid:"105101106", menuname:"订单提交成功,显示支付页面", controller:"shopping",action:"reqPayOrder",menutype:"store",sort:"8")
	    def m5_8 = new Menu(level: 3,menuid:"105101107", menuname:"订单支付成功,显示支付成功提示页面", controller:"alipay",action:"alireturn",menutype:"store",sort:"8")
	//订单管理
            def m6 = new Menu(level: 1,menuid:"106", menuname:"订单管理", controller:"order",action:"storeOrderManager",menutype:"store",sort:"8")
	    def m6_1 = new Menu(level: 2,menuid:"106101", menuname:"采购订单列表", controller:"order",action:"storeOrderList",menutype:"store",sort:"8")
	    def m6_1_1 = new Menu(level: 3,menuid:"106101101", menuname:"查看采购订单详情", controller:"order",action:"storeOrderDetail",menutype:"store",sort:"8")
            def m6_1_2 = new Menu(level: 3,menuid:"106101102", menuname:"订单收货确认", controller:"order",action:"storeConfirmOrder",menutype:"store",sort:"8")
	    def m6_2 = new Menu(level: 2,menuid:"106102", menuname:"销售订单列表", controller:"order",action:"storeSaleOrderList",menutype:"store",sort:"7")
	    def m6_2_1 = new Menu(level: 3,menuid:"106102101", menuname:"查看销售订单详情", controller:"order",action:"storeSaleOrderDetail",menutype:"store",sort:"8")
			
	    def m7 = new Menu(level: 1,menuid:"107", menuname:"库存", controller:"stock",action:"stockManger",menutype:"store",sort:"1")
	    def m7_1 = new Menu(level: 2,menuid:"107101", menuname:"查看库存", controller:"stock",action:"list",menutype:"store",sort:"2")
	    def m7_1_1 = new Menu(level: 3,menuid:"107101101", menuname:"查看库存明细", controller:"stock",action:"stocklog",menutype:"store",sort:"2")
	    
			
			
			
	    def s0 = new Menu(level: 1,menuid:"108", menuname:"门店首页", controller:"store",action:"indexManager",menutype:"store",sort:"100")
	    def s0_1 = new Menu(level: 2,menuid:"108101", menuname:"信息中心", controller:"store",action:"allInfo",menutype:"store",sort:"100")
	    def s0_2 = new Menu(level: 2,menuid:"108102", menuname:"修改密码", controller:"user",action:"reqNewStorePassword",menutype:"store",sort:"90")
	    def s0_2_1 = new Menu(level: 3,menuid:"108102101", menuname:"修改密码", controller:"user",action:"doNewSotrePassword",menutype:"store",sort:"100")
		
			
	    def m9 = new Menu(level: 1,menuid:"109", menuname:"收银台", controller:"sale",action:"saleManger",menutype:"store",sort:"2")
	    def m9_1 = new Menu(level: 2,menuid:"109101", menuname:"收银台", controller:"sale",action:"saleGoodsList",menutype:"store",sort:"2")
	    def m9_1_1 = new Menu(level: 3,menuid:"109101101", menuname:"出售", controller:"sale",action:"saleGoodsD",menutype:"store",sort:"2")
	    
			
	    def m10 = new Menu(level: 1,menuid:"110", menuname:"商品库", controller:"goods",action:"storeGoodsManger",menutype:"store",sort:"1")
	    def m10_1 = new Menu(level: 2,menuid:"110101", menuname:"商品库列表", controller:"goods",action:"reqStoreGoodsList",menutype:"store",sort:"2")
	    def m10_1_1 = new Menu(level: 3,menuid:"110101101", menuname:"修改商品", controller:"goods",action:"reqUpdateStoreGoods",menutype:"store",sort:"2")
	    def m10_1_2 = new Menu(level: 3,menuid:"110101102", menuname:"修改商品", controller:"goods",action:"doUpdateStoreGoods",menutype:"store",sort:"2")
			
            def storerole = new Role(rolename:"store");
	    storerole.addToMenus(s0);
	    storerole.addToMenus(s0_1);
	    storerole.addToMenus(s0_2);
	    storerole.addToMenus(s0_2_1);
			
			
            storerole.addToMenus(m4);
            storerole.addToMenus(m4_1);
            storerole.addToMenus(m4_2);
            storerole.addToMenus(m4_2_1);
            storerole.addToMenus(m4_2_2);
            storerole.addToMenus(m5);
            storerole.addToMenus(m5_1);
            storerole.addToMenus(m5_2);
	    storerole.addToMenus(m5_3);
	    storerole.addToMenus(m5_4);
	    storerole.addToMenus(m5_5);
	    storerole.addToMenus(m5_6);
	    storerole.addToMenus(m5_7);
	    storerole.addToMenus(m5_8);
	    storerole.addToMenus(m6);
            storerole.addToMenus(m6_1);
	    storerole.addToMenus(m6_1_1);
	    storerole.addToMenus(m6_1_2);
	    storerole.addToMenus(m6_2);
	    storerole.addToMenus(m6_2_1);
	    storerole.addToMenus(m7);
            storerole.addToMenus(m7_1);
	    storerole.addToMenus(m7_1_1);
	    storerole.addToMenus(s0);
            storerole.addToMenus(s0_1);
	    storerole.addToMenus(s0_2);
	    storerole.addToMenus(s0_2_1);
	    
	    storerole.addToMenus(m9);
	    storerole.addToMenus(m9_1);
	    storerole.addToMenus(m9_1_1);
	    
	    storerole.addToMenus(m10);
	    storerole.addToMenus(m10_1);
	    storerole.addToMenus(m10_1_1);
	    storerole.addToMenus(m10_1_2);
			
            def store = new Store(store_name:"门店测试",store_type:"store",address:"");
            def member = new User(login:"test", password:"111111".encodeAsPassword(),name:"testname",user_type:"store")
            member.addToRoles(storerole)
            store.addToUsers(member)
            store.save()
            
            
            
            
            
            
            def root = new GoodsCategory(name:"root");
            def c1 = new GoodsCategory(name:"蔬菜");
            def c2 = new GoodsCategory(name:"水果");
            def c2_1 = new GoodsCategory(name:"南方水果");
            def c2_2 = new GoodsCategory(name:"北方水果");
//            c2.addToChildren(c2_1)
//            c2.addToChildren(c2_2)
            
//            root.addToChildren(c1)
            root.addToChildren(c2)
            root.save()
            
            
            def goodsArray = ["精品樱桃礼盒66","精品樱桃礼盒77","精品樱桃礼盒88","精品樱桃礼盒8","精品樱桃礼盒7","精品樱桃礼盒6","精品樱桃礼盒","精品樱桃礼盒","精品樱桃礼盒","精品樱桃礼盒","精品樱桃礼盒5","精品樱桃礼盒4","精品樱桃礼盒3","精品樱桃礼盒2","精品樱桃礼盒1","精品樱桃礼盒","精品樱桃礼盒"]
            
            goodsArray.each{
                def goods = new Goods(store_id:"1",goods_name:it,goods_sn:"9088",c_id:"2",price:100.00,status:"on",img:"/attached/image/20130421/20130421181931_791.jpg")
                goods.save()
            }
            
            
            
            //            def sto = ['aa','aa','aa','aa','aa','aa','aa','aa','aa','aa','aa','aa','aa','aa','aa','aa','aa']
            //            
            //            sto.each{
            //                def companyStore1 = new Store(store_name:"企业1",store_type:"company",address:"");
            //                companyStore1.save();
            //            }
            
            
            
            
            
           
            
            
            break

        case "production":
            break
        }

    }
    def destroy = {
    }
}
