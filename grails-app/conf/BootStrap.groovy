import supply.User
import supply.Menu
import grails.util.GrailsUtil
import supply.Role
import supply.Store
import supply.GoodsCategory

class BootStrap {

    def init = { servletContext ->
        switch(GrailsUtil.environment){
        case "development":
            
            
            //初始化菜单
            def m1 = new Menu(level: 1,menuid:"101", menuname:"订单管理", controller:"company",action:"orderManager",menutype:"company",sort:"3")
            def m1_1 = new Menu(level: 2,menuid:"101101", menuname:"订单列表", controller:"order",action:"companyOrderList",menutype:"company",sort:"3")
            def m1_1_1 = new Menu(level: 3,menuid:"101101101", menuname:"查看订单", controller:"order",action:"companyOrderDetail",menutype:"company",sort:"3")
            
            
            
            def m2 = new Menu(level: 1,menuid:"102", menuname:"门店管理", controller:"company",action:"storeManager",menutype:"company",sort:"2")
            def m2_1 = new Menu(level: 2,menuid:"102101", menuname:"门店列表", controller:"user",action:"companyStoreList",menutype:"company",sort:"1")
            def m2_2 = new Menu(level: 2,menuid:"102102", menuname:"分配门店账号", controller:"user",action:"reqCompanyStoreCreate",menutype:"company",sort:"2")
            def m2_2_1 = new Menu(level: 3,menuid:"102102101", menuname:"分配门店账号", controller:"user",action:"doCompanyStoreCreate",menutype:"company",sort:"2")
            
            
            def m3 = new Menu(level: 1,menuid:"103", menuname:"商品管理", controller:"company",action:"goodsManager",menutype:"company",sort:"1")
            def m3_1 = new Menu(level: 2,menuid:"103101", menuname:"商品分类管理", controller:"goods",action:"categoryManager",menutype:"company",sort:"1")
            
            def companyrole = new Role(rolename:"company");
            companyrole.addToMenus(m1);
            companyrole.addToMenus(m1_1)
            companyrole.addToMenus(m1_1_1)
            companyrole.addToMenus(m2);
            companyrole.addToMenus(m2_1);
            companyrole.addToMenus(m2_2);
            companyrole.addToMenus(m2_2_1);
            companyrole.addToMenus(m3);
            companyrole.addToMenus(m3_1);
//            companyrole.save();
            
            
            def companyStore = new Store(store_name:"企业",store_type:"company",address:"");
            def admin = new User(login:"admin", password:"111111",name:"wufei",user_type:"company")
            
            admin.addToRoles(companyrole)
            
            companyStore.addToUsers(admin)
            companyStore.save()
            
            
            def root = new GoodsCategory(name:"root");
            root.save()
            
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
