package supply

class StoreController {

    
    def jcaptchaService 
    
    def index() { 
        redirect(action: "login", params: params)
    }
    
    def login(){
        render(view: "login")
    }
    
	
	def indexManager() { 
        redirect(controller:"store",action: "allInfo", params: params)
    }
    
    def allInfo() { 
	    
	def map = [:]
        render(view: "index/allInfo", model:map)
    }
    
    
     def authenticate = {
//        println(params.login)
//        println(params.password)
        
//        def user = User.findByLoginAndPassword(params.login, params.password)
//        if(user){
//            session.user = user
//            flash.message = "Hello ${user.name}!"
//            redirect(controller:"hello", action:"orderManager")      
//        }else{
//            flash.message = "用户名${params.login}与密码不正确，请重新再试."
//            redirect(action:"login")
//        }
        
        redirect(action:"orderManager")  
    }
    
    //订单管理
    def orderManager(){
        redirect(action: "orderList", params: params)
    }
    
    //订单列表
    def orderList(){
        render(view: "orderList")
    }
    
    def orderDetail(){
        render(view: "orderDetail")
    }
    
    
    //门店销售记录
    def saleOrderList(){
        render(view: "saleOrderList")
    }
    
    def storeGoodsList(){
        render(view: "storeGoodsList")
    }
    
    def buyGoodsDetail(){
        render(view: "buyGoodsDetail")
    }
    
    
    
    //门店基本资料
    def storeManager(){
        redirect(action: "storeInfo", params: params)
    }
    
    def storeInfo(){
        render(view: "storeInfo")
    }
    
    //门店财务记录
    def storeFinaceInfo(){
        render(view: "storeFinaceInfo")
    }
    
    def storeAddress(){
        render(view: "storeAddress")
    }
    
    def storeAddressCreate(){
        render(view: "storeAddressCreate")
    }
    
    def updateStoreAddressCreate(){
        render(view: "updateStoreAddressCreate")
    }
    
    
    
    
    //报表统计
    def reportManager(){
        redirect(action: "storeReportList", params: params)
    }
    
    
    def storeReportList(){
        render(view: "storeReportList")
    }
    
    
    def buyGoodsManager(){
        redirect(action: "buyGoodsList", params: params)
    }
    
    def buyGoodsList(){
        render(view: "buyGoodsList")
    }
    
    
    def cartManager(){
        redirect(action: "cartList", params: params)
    }
    
    //购物车
    def cartList(){
        render(view: "cartList")
    }
    
    def checkOrder(){
        render(view: "checkOrder")
    }
    
    
    def payOrder(){
        render(view: "payOrder")
    }
    
}
