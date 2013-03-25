import supply.User
import supply.Menu
import grails.util.GrailsUtil
import supply.Role
import supply.Store

class BootStrap {

    def init = { servletContext ->
        switch(GrailsUtil.environment){
        case "development":
            def jdoe = new User(login:"admin", password:"111111", name:"John8888888888 Doe",user_type:"company")
            jdoe.save()
            
            def jdoe1 = new User(login:"store", password:"111111", name:"John7777777 Doe",user_type:"store")
            jdoe1.save()
        
            
            def list = ["Java", "Groovy", "JavaScript", "JavaScript", "Java", "Groovy", "JavaScript", "JavaScript", "Java", "Groovy", "JavaScript",, "Groovy", "JavaScript", "JavaScript", "Java", "Groovy", "JavaScript", "JavaScript", "Java", "Groovy", "JavaScript", "Groovy", "JavaScript", "JavaScript", "Java", "Groovy", "JavaScript", "JavaScript", "Java", "Groovy", "JavaScript", "Groovy", "JavaScript", "JavaScript", "Java", "Groovy", "JavaScript", "JavaScript", "Java", "Groovy", "JavaScript", "Groovy", "JavaScript", "JavaScript", "Java", "Groovy", "JavaScript", "JavaScript", "Java", "Groovy", "JavaScript"]
            def i =0 ;
            list.each{language->
                def u = new User(login:language+i, password:"111111", name:language+i,user_type:"store")
                i++;
                u.save() 
            }
            
            
            
            def storelist = ["s1","s1","s1","s1","s1","s1","s1","s1","s1","s1","s1","s1","s1","s1","s1","s1","s1","s1","s1","s1","s1","s1","s1","s1","s1","s1","s1","s1","s1","s1","s1","s1","s1","s1","s1","s1"]
            def j =0;
            storelist.each{store->
                def storeDB = new Store(store_name:store+j,address:"2323",store_type:"store")
                j++;
                storeDB.save()
            }
            
            
            
            
            
            //初始化菜单
            def m1 = new Menu(level: 1,menuid:"101", menuname:"订单管理", controller:"company",action:"orderManager",menutype:"company",sort:"3")
            def m1_1 = new Menu(level: 2,menuid:"101101", menuname:"订单列表", controller:"order",action:"companyOrderList",menutype:"company",sort:"3")
            def m1_1_1 = new Menu(level: 3,menuid:"101101101", menuname:"查看订单", controller:"order",action:"companyOrderDetail",menutype:"company",sort:"3")
            
            
            
            def m2 = new Menu(level: 1,menuid:"102", menuname:"门店管理", controller:"company",action:"storeManager",menutype:"company",sort:"2")
            def m2_1 = new Menu(level: 2,menuid:"102101", menuname:"门店列表", controller:"user",action:"companyStoreList",menutype:"company",sort:"1")
            def m2_2 = new Menu(level: 2,menuid:"102102", menuname:"分配门店账号", controller:"user",action:"reqCompanyStoreCreate",menutype:"company",sort:"2")
            def m2_2_1 = new Menu(level: 3,menuid:"102102101", menuname:"分配门店账号", controller:"user",action:"doCompanyStoreCreate",menutype:"company",sort:"2")
            
            
            def m3 = new Menu(level: 1,menuid:"103", menuname:"商品管理", controller:"company",action:"orderManager",menutype:"company",sort:"1")
            
            def companyrole = new Role(rolename:"company");
            companyrole.addToMenus(m1);
            companyrole.addToMenus(m1_1)
            companyrole.addToMenus(m1_1_1)
            companyrole.addToMenus(m2);
            companyrole.addToMenus(m2_1);
            companyrole.addToMenus(m2_2);
            companyrole.addToMenus(m2_2_1);
            companyrole.addToMenus(m3);
            companyrole.save();
            
            
            
            break

        case "production":
            break
        }

    }
    def destroy = {
    }
}
