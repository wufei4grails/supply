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
        
        if (!params.max) params.max = 10  
        if (!params.offset) params.offset = 0  
        if (!params.sort) params.sort = "lastUpdated"  
        if (!params.order) params.order = "desc" 
        
       
        
        def searchClosure =  {
             if(params.store_name) {
                 like('store_name',"%${params.store_name}%")
             }
        }
        
        def c = Store.createCriteria();
        def results = c.list(params,searchClosure)
        def map = [storeInstanceList: results, storeInstanceTotal: results.totalCount]
        render(view: "/company/user/companyStoreList", model:map)
    }
    
    def reqCompanyStoreCreate(){
        render(view: "/company/user/companyStoreCreate")
    }
    
    def doCompanyStoreCreate(){
        
        def store = new Store(params)
        store.store_type = "store"
        def user = new User(params)
        user.user_type = "store"
        user.name = params.contact_person
        store.addToUsers(user)
        
        if (!store.save(flush: true)) {
        }
        flash.message = "分配门店账号成功！"
        redirect(action: "reqCompanyStoreCreate")
        
    }
    
    
}
