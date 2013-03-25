import supply.User
import supply.Menu
import grails.util.GrailsUtil
import supply.Role

class BootStrap {

    def init = { servletContext ->
        switch(GrailsUtil.environment){
        case "development":
            def jdoe = new User(login:"admin", password:"111111", name:"John Doe",type:"company")
            jdoe.save()
            
            def jdoe1 = new User(login:"store", password:"111111", name:"John Doe",type:"store")
            jdoe1.save()
        
            
            def list = ["Java", "Groovy", "JavaScript", "JavaScript", "Java", "Groovy", "JavaScript", "JavaScript", "Java", "Groovy", "JavaScript",, "Groovy", "JavaScript", "JavaScript", "Java", "Groovy", "JavaScript", "JavaScript", "Java", "Groovy", "JavaScript", "Groovy", "JavaScript", "JavaScript", "Java", "Groovy", "JavaScript", "JavaScript", "Java", "Groovy", "JavaScript", "Groovy", "JavaScript", "JavaScript", "Java", "Groovy", "JavaScript", "JavaScript", "Java", "Groovy", "JavaScript", "Groovy", "JavaScript", "JavaScript", "Java", "Groovy", "JavaScript", "JavaScript", "Java", "Groovy", "JavaScript"]
            def i =0 ;
            list.each{language->
                def jsmith = new User(login:language+i, password:"111111", name:language+i)
                i++;
                jsmith.save() 
            }
            
            
            
            
            //初始化菜单
            def m1 = new Menu(level: 1,menuid:"101", menuname:"订单管理", controller:"company",action:"orderManager",menutype:"company",sort:"1")
            def m2 = new Menu(level: 1,menuid:"102", menuname:"门店管理", controller:"company",action:"storeManager",menutype:"company",sort:"2")
            def m2_1 = new Menu(level: 2,menuid:"102101", menuname:"门店列表", controller:"user",action:"companyStoreList",menutype:"company",sort:"1")
            def m2_2 = new Menu(level: 2,menuid:"102102", menuname:"分配门店账号", controller:"user",action:"companyStoreCreate",menutype:"company",sort:"2")
            def m3 = new Menu(level: 1,menuid:"103", menuname:"商品管理", controller:"company",action:"orderManager",menutype:"company",sort:"3")
            
            def companyrole = new Role(rolename:"company");
            companyrole.addToMenus(m1);
            companyrole.addToMenus(m2);
            companyrole.addToMenus(m2_1);
            companyrole.addToMenus(m2_2);
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
