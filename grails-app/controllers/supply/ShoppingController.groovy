package supply

import grails.converters.JSON
class ShoppingController {
        //test company
	def categoryService
	def index() { }
    
	def shoppingManager(){
		redirect(action: "shoppingGoodsList", params: params)
	}
    
	def shoppingGoodsList(){
        
//		println grailsApplication.getConfig().AlipayConfig.input_charset
		
         
		if (!params.status) params.status = "on"
	
		
		if (!params.max) params.max = 12  
		if (!params.offset) params.offset = 0  
		if (!params.sort) params.sort = "lastUpdated"  
		if (!params.order) params.order = "desc" 
        
		def searchClosure =  {
			if(params.goods_name) {
				like('goods_name',"%${params.goods_name}%")
			}
			if(params.goods_sn) {
				like('goods_sn',"%${params.goods_sn}%")
			}
			if(params.status) {
				eq('status',"${params.status}")
			}
			if(params.c_id) {
				//获取分类下所有分类的商品
				def ctree = GoodsCategory.get(params.c_id).getAllChildren()
				
				List coll = new ArrayList()
				ctree.each{
					coll.add(it.id.toString());
				}
				coll.add(params.c_id)
				inList('c_id',coll)
			}
		}
        
		def g = Goods.createCriteria();
		def results = g.list(params,searchClosure)
		def map = [goodsList: results, goodsTotal: results.totalCount]
        
        
		render(view: "/member/shopping/shoppingGoodsList", model:map)
        
        
	}
    
	
	def buyGoodsDetail(){
		def goods = Goods.get(params.id)
		def attachList = Attach.findAllByAttach_id(params.id)
		def goodsAttrList = GoodsAttr.findAllByGoods_id(params.id)
		def map = [goods:goods,goodsAttrList:goodsAttrList,attachList:attachList]
		render(view: "/member/shopping/buyGoodsDetail", model:map)
	}
	
	
	//往购物车中添加商品
	def setCart(def params){
		def goods = Goods.get(params.id)
		if(!goods)return;
		BuyPOJO buyPOJO = new BuyPOJO(goods:goods,num:params.num.toInteger())
		
		if(!session.cartPOJO){
			CartPOJO cartPOJO = new CartPOJO(buyPOJOMap: [:] );
			
			cartPOJO.buyPOJOMap.put(params.id,buyPOJO)
			session.cartPOJO = cartPOJO;	
		}else{
			if(session.cartPOJO.buyPOJOMap.containsKey(goods.id)){
				//如果商品在购物车中已存在，则直接修改数量
				def buyPOJOOfMap = session.cartPOJO.buyPOJOMap.get(goods.id)
				buyPOJOOfMap.num = params.num.toInteger()
				println(buyPOJOOfMap)
			}else{
				session.cartPOJO.buyPOJOMap.put(params.id,buyPOJO)	
			}
			
			
		}
		
		
		return buyPOJO as JSON
	}
	
	//加入购物车请求
	def addCart(){
		render setCart(params)
	}
	
	def updateCart(){
		setCart(params)
		redirect(action: "reqCart", params: params)
	}
	
	
	def removeGoods (){
		session.cartPOJO.buyPOJOMap.remove(params.id)
		redirect(action: "reqCart", params: params)
	}
	
	
	//简单请求到购物车
	def reqCart(){
		
		
		
		def cartList=[];
		if(session.cartPOJO){
			session.cartPOJO.buyPOJOMap.each{
				cartList.add(it.value)
			}
		}
		
		def map = [cartList:cartList]
		render(view: "/member/shopping/cartList", model:map)
	}
	
	//商品页面直接填写数量购买进入购物车
	def gotoCart(){
		
		setCart(params)
		
		redirect(action: "reqCart", params: params)
		
	}
	
	//填写核对订单信息 
	def checkOrder(){
		
		def cartList=[];
		if(session.cartPOJO){
			session.cartPOJO.buyPOJOMap.each{
				cartList.add(it.value)
			}
		}
		
		
		
		def store = Store.get(session.loginPOJO.store.id)
		def addressList = store.addresses
		
		
		def map = [cartList:cartList,addressList: addressList]
		
		render(view: "/member/shopping/checkOrder", model:map)
	}
	
	def payOrder(){
		
		session.cartPOJO=null;
		
		ShoppingOrder shoppingOrder = new ShoppingOrder(params);
//		shoppingOrder.payTime = 0
		shoppingOrder.order_sn = new Date().getTime()
		
		shoppingOrder.buy_user = session.loginPOJO.user.id;
		shoppingOrder.status = "waitpay"//新订单等待付款
		
		def goods_id = params.goods_id
		def price = params.price
		def num= params.num
		
		if(goods_id instanceof String){//如果是string表示该订单只有这一件商品
			OrderGoods orderGoods = new OrderGoods(goods:Goods.get(goods_id),num:num,price:price)
			shoppingOrder.addToOrderGoods(orderGoods);
		}else{
			for(int i=0;i<goods_id.size();i++){

			OrderGoods orderGoods = new OrderGoods(goods:Goods.get(goods_id[i]),num:num[i],price:price[i])
			shoppingOrder.addToOrderGoods(orderGoods);
			
			}
		}
		
		
		shoppingOrder.save(flash:true);
		redirect(action: "reqPayOrder",params: [order_sn:shoppingOrder.order_sn]) 
	}
	
	
	def reqPayOrder(){
//		println(params)
		ShoppingOrder shoppingOrder = ShoppingOrder.findByOrder_sn(params.order_sn)
		def map = [shoppingOrder:shoppingOrder]
		render(view: "/member/shopping/payOrder", model:map)
	}
	
	
}
