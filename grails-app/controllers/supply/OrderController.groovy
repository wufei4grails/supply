package supply

class OrderController {

    def index() { }
    
	
	def companyOrderManager(){
		redirect(action: "companyOrderList", params: params)
	    }
    
    //订单列表
    def companyOrderList(){
	    
		
	if (!params.max) params.max = 10  
        if (!params.offset) params.offset = 0  
        if (!params.sort) params.sort = "lastUpdated"  
        if (!params.order) params.order = "desc" 
        
        def searchClosure =  {
             if(params.order_sn) {
                 like('order_sn',"%${params.order_sn}%")
             }
             if(params.status) {
                 eq('status',"${params.status}")
             }
        }
        
        def s = ShoppingOrder.createCriteria();
        def results = s.list(params,searchClosure)
        def map = [orderList: results, orderTotal: results.totalCount]
        
        render(view: "/company/order/orderList", model:map)
		
    }
    
    def companyOrderDetail(){
	ShoppingOrder shoppingOrder = ShoppingOrder.get(params.id)
	def map = [shoppingOrder: shoppingOrder,orderGoods:shoppingOrder.orderGoods]
        render(view: "/company/order/orderDetail", model:map)
    }
    
	//企业发货
	def companyShipOrder(){
		ShoppingOrder shoppingOrder = ShoppingOrder.get(params.id)
		shoppingOrder.status = "waitconfirm";
		shoppingOrder.shipTime = new Date().getTime()
		def map = [shoppingOrder: shoppingOrder,orderGoods:shoppingOrder.orderGoods]
		render(view: "/company/order/orderDetail", model:map)
	}
	
	//门店收货确认
	def storeConfirmOrder(){
		ShoppingOrder shoppingOrder = ShoppingOrder.get(params.id)
		shoppingOrder.status = "success";
		shoppingOrder.confirmTime = new Date().getTime()
		def map = [shoppingOrder: shoppingOrder,orderGoods:shoppingOrder.orderGoods]
		render(view: "/company/order/orderDetail", model:map)
	}
    
	def companyUpdateOrderAmount(){
		
		ShoppingOrder shoppingOrder = ShoppingOrder.get(params.id)
		def newamount = params.newamount;
		def discount = params.discount
		
		
		
		if(newamount){
			shoppingOrder.amount = newamount
		}
		if(discount){
			shoppingOrder.amount = new Float(shoppingOrder.amount) * (new Float(discount)/10)
		}
		
		def map = [shoppingOrder: shoppingOrder,orderGoods:shoppingOrder.orderGoods]
		render(view: "/company/order/orderDetail", model:map)
	}
    
  //订单管理
    def storeOrderManager(){
        redirect(action: "storeOrderList", params: params)
    }
    
    //订单列表
    def storeOrderList(){
	    
		
	if (!params.max) params.max = 10  
        if (!params.offset) params.offset = 0  
        if (!params.sort) params.sort = "lastUpdated"  
        if (!params.order) params.order = "desc" 
        
        def searchClosure =  {
             if(params.order_sn) {
                 like('order_sn',"%${params.order_sn}%")
             }
             if(params.status) {
                 eq('status',"${params.status}")
             }
	     eq('store_id',session.loginPOJO.store.id.toString())
        }
        
        def s = ShoppingOrder.createCriteria();
        def results = s.list(params,searchClosure)
        def map = [orderList: results, orderTotal: results.totalCount]
        
        render(view: "/member/order/orderList", model:map)
    }
    
    def storeOrderDetail(){
	    ShoppingOrder shoppingOrder = ShoppingOrder.get(params.id)
	    
		
		
	    def map = [shoppingOrder: shoppingOrder,orderGoods:shoppingOrder.orderGoods]
        render(view: "/member/order/orderDetail", model:map)
    }
}
