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
	    
		googlevisualizationFilter(controller:"company",action:"googlevisualization"){
			before = {
				return true
			     }
		}
		
	logginFilter(controller:"runtimeLogging",action:"*") {
		before = {
		   return true
		}
	}
	// http://localhost:8080/<yourapp>/quartz/list 
	quartzFilter(controller:"quartz",action:"*") {
		before = {
		   return true
		}
	}
        loginCheck(controller:'*', action:'*') {
            before = {
                if(!session.loginPOJO 
		    && !actionName.equals('saveShoppingLog')//保存物流记录
                    && !actionName.equals('login')
                    && !actionName.equals('jpeg')
                    && !actionName.equals('authenticate')
		    && !actionName.equals('upload')//验证码
			&& !actionName.equals('alinotify')
			&& !actionName.equals('alireturn')) {
                    redirect(controller: 'login',action:'login')
                    return false
                }
                    
            }
        }
	
	
    }
}

