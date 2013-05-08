package supply

import grails.converters.JSON
class MenuTagLib {

    
//    属    性
//描    述
//actionName
//正在执行的操作名称
//actionUri
//正在执行的操作的URI
//controllerName
//正在执行的控制器名称
//controllerUri
//正在执行的控制器的URI
//flash
//作用于flash范围的flash对象
//log
//org.apache.commons.logging.Log的实例（实际类型为org.apache.commons.logging.impl.Log4JLogger）
//params
//请求参数的一个映射（Map）集合
//request
//一个HttpServletRequest实例
//response
//一个HttpServletResponse实例
//session
//一个HttpSession实例
//servletContext
//一个ServletContext实例
    
    def roleService 
    
    def firstmenu = {
        
        println(controllerName)
        println(actionName)
        def curMenu = Menu.findByControllerAndAction(controllerName,actionName);
        println(curMenu)
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
        
        def curMenu = Menu.findByControllerAndAction(controllerName,actionName);
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
