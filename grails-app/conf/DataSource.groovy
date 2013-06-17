import org.springframework.core.io.ClassPathResource
import org.springframework.core.io.support.PropertiesLoaderUtils
def properties = PropertiesLoaderUtils.loadProperties(new ClassPathResource("sysSetting.properties")) 
dataSource {
    pooled = true
//    driverClassName = "org.h2.Driver"
//    username = "sa"
//    password = ""

//    println properties.getProperty("DB.driverClass")
//    println properties.getProperty("DB.username")
    
    
    driverClassName = properties.getProperty("DB.driverClass")
    username = properties.getProperty("DB.username")
    password = properties.getProperty("DB.password")

}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    
    development {
        
        dataSource {
            
            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
//            url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
//            url = "jdbc:mysql://127.0.0.1:3306/supply?useUnicode=true&characterEncoding=UTF-8"
            url = properties.getProperty("DB.url")
           
			logSql = true 
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            url = properties.getProperty("DB.url")
            pooled = true
            logSql = true
//            properties {
//               maxActive = -1
//               minEvictableIdleTimeMillis=1800000
//               timeBetweenEvictionRunsMillis=1800000
//               numTestsPerEvictionRun=3
//               testOnBorrow=true
//               testWhileIdle=true
//               testOnReturn=true
//               validationQuery="SELECT 1"
//            }
        }
    }
}
