package supply

class RoleService {

    def serviceMethod() {

    }
    
    def getFirstRoleMenu(User user){
        def m = Menu.createCriteria()
        def menulist = m.list {
                    
            and{
                roles {
                    and{
                        eq("rolename",user.type)
                    }
                        
                }
                eq("level",1)
            }
                    
                    
        }
                
        menulist.each{menu->
            println(menu.menuname);
        }
        
        return menulist;
    }
}
