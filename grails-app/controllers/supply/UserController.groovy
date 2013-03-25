package supply

class UserController {
    
  
    def login = {}
    def index() { }
    
    //验证git
    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [userInstanceList: User.list(params), userInstanceTotal: User.count()]
    }
    
    
    
    //门店列表
    def companyStoreList(){
        
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def map = [storeInstanceList: Store.list(params), storeInstanceTotal: Store.count()]
        render(view: "/company/user/companyStoreList", model:map)
    }
    
    def reqCompanyStoreCreate(){
        render(view: "/company/user/companyStoreCreate")
    }
    
    def doCompanyStoreCreate(){
        
        def store = new Store(params)
        store.store_type = "store"
        if (!store.save(flush: true)) {
            
        }
        flash.message = "分配门店账号成功！"
        redirect(action: "reqCompanyStoreCreate")
        
    }
    
    
}
