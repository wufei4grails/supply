package supply

class RoleService {

    def serviceMethod() {

    }
    
    //根据用户角色获取一级菜单
    def getFirstRoleMenu(User user){
        def m = Menu.createCriteria()
        def menulist = m.list(sort:"sort", order:"desc") {
                    
            and{
                roles {
                    and{
                        eq("rolename",user.user_type)
                    }
                        
                }
                eq("level",1)
            }
                    
                    
        }
        return menulist;
    }
    
    
    def getSecondRoleMenu(User user,Menu menu){
        def m = Menu.createCriteria()
        def menulist = m.list(sort:"sort", order:"desc") {
            like("menuid",menu.menuid[0..2]+"%")      
            and{
                roles {
                    and{
                        eq("rolename",user.user_type)
                    }
                        
                }
                eq("level",2)
                
            }
                    
                    
        }
        return menulist;
    }
}
