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
                    && !actionName.equals('companyLogin')
                    && !actionName.equals('storeLogin')
                    && !actionName.equals('jpeg')) {//验证码
                    redirect(controller: 'login',action:'companyLogin')
                    return false
                }
                    
            }
        }
    }
}

