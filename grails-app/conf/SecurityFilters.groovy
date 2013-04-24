/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author wufei
 */
class SecurityFilters {
    def filters = {
        loginCheck(controller:'*', action:'*') {
            before = {
                if(!session.loginPOJO 
                    && !actionName.equals('login')
                    && !actionName.equals('jpeg')
                    && !actionName.equals('authenticate')
		    && !actionName.equals('upload')) {//验证码
                    redirect(controller: 'login',action:'login')
                    return false
                }
                    
            }
        }
    }
}
