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
		
		
		//转换购买的商品到门店的库存中
			def orderGoods = shoppingOrder.orderGoods
			orderGoods.each{


				Stock stock = Stock.findByStore_idAndCompany_goods_id(shoppingOrder.store_id,it.goods.id)
				if(stock){
					stock.num = stock.num + it.num
				}else{
					stock = new Stock()
					stock.store_id = shoppingOrder.store_id
					stock.goods_name = it.goods.goods_name
					stock.company_goods_id = it.goods.id
					stock.num = it.num
					stock.price = it.price
					stock.save()
				}

				StockLog stockLog = new StockLog()
				stockLog.store_id = shoppingOrder.store_id
				stockLog.store_goods_id = stock.id//关联门店新生成的商品id.因为门店也有可能自己维护商品数据，所以每个门店的商品id有自己的，而不是信赖企业的商品id
				stockLog.stock_type = "in"
				stockLog.num = it.num
				stockLog.actnum = stock.num//
				stockLog.attach_sn = shoppingOrder.order_sn
				stockLog.attach_id = shoppingOrder.id
				stockLog.save()
				
				
			}
		
		
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
