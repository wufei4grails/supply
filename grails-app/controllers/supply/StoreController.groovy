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
	  
	def waitpaySearch =  {
		eq('store_id',"${session.loginPOJO.store.id}")
                 eq('status',"waitpay")
        }
	def waitpayC = ShoppingOrder.createCriteria();
        def waitpayR = waitpayC.list(params,waitpaySearch)
	
	def waitshipSearch =  {
		eq('store_id',"${session.loginPOJO.store.id}")
                 eq('status',"waitship")
        }
	def waitshipC = ShoppingOrder.createCriteria();
        def waitshipR = waitshipC.list(params,waitshipSearch)
	
		
		
		
	def waitconfirmSearch =  {
		eq('store_id',"${session.loginPOJO.store.id}")
                 eq('status',"waitconfirm")
        }
	def waitconfirmC = ShoppingOrder.createCriteria();
        def waitconfirmR = waitconfirmC.list(params,waitconfirmSearch)
	
		
	def successSearch =  {
		eq('store_id',"${session.loginPOJO.store.id}")
                 eq('status',"success")
        }
	def successC = ShoppingOrder.createCriteria();
        def successR = successC.list(params,successSearch)	
		
	//门店售出订单统计
	def saleSearch =  {
		eq('store_id',"${session.loginPOJO.store.id}")
//		eq('status',"${params.status}")
	}

	def saleC = SaleOrder.createCriteria();
	def saleR = saleC.list(params,saleSearch)
		
		
	def goodsSearch =  {
		eq('store_id',"${session.loginPOJO.store.id}")
	}

	def goodsC = Goods.createCriteria();
	def goodsR = goodsC.list(params,goodsSearch)
		
		
		
	def map = [waitpay:waitpayR.totalCount,waitship:waitshipR.totalCount,waitconfirm:waitconfirmR.totalCount,sale:saleR.totalCount,goodsCount:goodsR.totalCount,successCount:successR.totalCount]
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
