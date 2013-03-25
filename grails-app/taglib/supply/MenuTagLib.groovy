package supply

import grails.converters.JSON
class MenuTagLib {

    def roleService 
    
    def secondMenu = {
//        
        def user = session.loginPOJO.user
        List menulist = roleService.getFirstRoleMenu(user)
        println(menulist as JSON)
//        List menupath = request.forwardURI.tokenize('/');
//        println(menupath.size())
//        println(menupath.get(menupath.size()-1))
//        
//        def controller = menupath.get(menupath.size()-2)
//        def action = menupath.get(menupath.size()-1)
//        
//        def curMenu = Menu.findByControllerAndAction(controller,action);
        
    }
}
