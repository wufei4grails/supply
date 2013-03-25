package supply

class UserController {
    
    def scaffold = User
  
    def login = {}
    def index() { }
    
    //验证git
    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [userInstanceList: User.list(params), userInstanceTotal: User.count()]
    }
    
    
    
    //门店列表
    def companyStoreList(){
        render(view: "/company/user/companyStoreList")
    }
    
    def companyStoreCreate(){
        render(view: "/company/user/companyStoreCreate")
    }
    
    
}
