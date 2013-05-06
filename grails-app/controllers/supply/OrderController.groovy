package supply

class OrderController {

    def index() { }
    
    //订单列表
    def companyOrderList(){
        render(view: "/company/order/orderList")
    }
    
    def companyOrderDetail(){
        render(view: "/company/order/orderDetail")
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
