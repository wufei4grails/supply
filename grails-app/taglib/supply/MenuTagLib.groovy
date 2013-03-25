package supply

import grails.converters.JSON
class MenuTagLib {

    def roleService 
    
    def firstmenu = {
        
        List menupath = request.forwardURI.tokenize('/');
        
        def controller = menupath.get(menupath.size()-2)
        def action = menupath.get(menupath.size()-1)
        def curMenu = Menu.findByControllerAndAction(controller,action);
        def cMenuId = curMenu.menuid[0..2]
        
        def user = session.loginPOJO.user
        List menulist = roleService.getFirstRoleMenu(user)
        
        def s = "";
        menulist.each{menu->
            //            println(menu.menuname+":"+menu.sort);
            def c = cMenuId == menu.menuid ? "active":""
            s = s + "<li class="+c+"><a href="+request.getContextPath()+"/"+menu.controller+"/"+menu.action+">"+menu.menuname+"</a></li>"
        }
        out << s;  

        
    }
    
    
    def secondmenu = {
        
        List menupath = request.forwardURI.tokenize('/');
        
        def controller = menupath.get(menupath.size()-2)
        def action = menupath.get(menupath.size()-1)
        def curMenu = Menu.findByControllerAndAction(controller,action);
        def cMenuId = curMenu.menuid[0..5]
        
        def user = session.loginPOJO.user
        List menulist = roleService.getSecondRoleMenu(user,curMenu)
        
        def s = "";
        menulist.each{menu->
            //            println(menu.menuname+":"+menu.sort);
            def c = cMenuId == menu.menuid ? "active":""
            s = s + "<li class="+c+"><a href="+request.getContextPath()+"/"+menu.controller+"/"+menu.action+">"+menu.menuname+"</a></li>"
        }
        out << s;  
    }
 }
