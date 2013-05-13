package supply

import grails.converters.JSON
class SaleController {

    def index() { }
    
	def saleManger(){
		redirect(action: "saleGoodsList", params: params)
	}
	

	def saleGoodsList(){
		if (!params.status) params.status = "on"
		if (!params.max) params.max = 10
		if (!params.offset) params.offset = 0  
		if (!params.sort) params.sort = "lastUpdated"  
		if (!params.order) params.order = "desc" 

		def searchClosure =  {
		     if(params.goods_name) {
			 like('goods_name',"%${params.goods_name}%")
		     }
	             if(params.status) {
	                 eq('status',"${params.status}")
	             }
			eq('store_id',session.loginPOJO.store.id.toString())
		}

		def s = Goods.createCriteria();
		def results = s.list(params,searchClosure)
		

		
		
		def saleTableList=[];
		if(session.saleTablePOJO){
			session.saleTablePOJO.salePOJOMap.each{
				saleTableList.add(it.value)
			}
		}
		
		def map = [goodsList: results, goodsTotal: results.totalCount,saleTableList:saleTableList]
		
		render(view: "/member/sale/saleList", model:map)
	}
	
	def saleGoodsD(){
		def goods = Goods.get(params.id);
//		def attachList = Attach.findAllByAttach_id(params.id)
//		def goodsAttrList = GoodsAttr.findAllByGoods_id(params.id)
		def map = [goods: goods]
		render(view: "/company/goods/goodsUpdate", model:map)
	}
	
	def removeGoods(){
		session.saleTablePOJO.salePOJOMap.remove(params.id.toString())
//		println(session.saleTablePOJO.salePOJOMap as JSON)
	}
	
	
	
	
	def addSaleTable(){
//		println params as JSON;
		
		def goods = Goods.get(params.id);
		SalePOJO salePOJO = new SalePOJO();
		salePOJO.goods = goods;
		salePOJO.num = params.num.toInteger()
		
		if(!session.saleTablePOJO){
			SaleTablePOJO saleTablePOJO = new SaleTablePOJO(salePOJOMap: [:] );
			
			saleTablePOJO.salePOJOMap.put(params.id,salePOJO)
			session.saleTablePOJO = saleTablePOJO;	
		}else{
			if(session.saleTablePOJO.salePOJOMap.containsKey(goods.id)){
				//如果商品在购物车中已存在，则直接修改数量
				def salePOJOOfMap = session.saleTablePOJO.salePOJOMap.get(goods.id)
				salePOJOOfMap.num = params.num.toInteger()
				
			}else{
				session.saleTablePOJO.salePOJOMap.put(params.id,salePOJO)	
			}
			
			
		}
//		println(session.saleTablePOJO.salePOJOMap as JSON)
	}
	
	def submitSaleOrder(){
		
		SaleOrder saleOrder = new SaleOrder();
		saleOrder.order_sn = new Date().getTime()
		
		saleOrder.store_id = session.loginPOJO.store.id;
		
		def amount = 0.0;
		session.saleTablePOJO.salePOJOMap.each{
			SaleOrderGoods saleOrderGoods = new SaleOrderGoods()
			saleOrderGoods.goods = it.value.goods;
			saleOrderGoods.num = it.value.num;
			saleOrderGoods.price = it.value.goods.price;
			amount = amount + saleOrderGoods.num * saleOrderGoods.price;
			saleOrder.addToSaleOrderGoods(saleOrderGoods);
			
			
			
			
			
			
		}
		saleOrder.amount = amount;
//		println saleOrder as JSON;
		saleOrder.save();
		
		
		
		saleOrder.saleOrderGoods.each{
			//库存数据
				Stock stock = Stock.findByStore_idAndStore_goods_id(saleOrder.store_id,it.goods.id)
				if(stock){
					stock.num = stock.num - it.num
				}

				//出货记录
				StockLog stockLog = new StockLog()
				stockLog.store_id = saleOrder.store_id
				stockLog.store_goods_id = it.goods.id//关联门店新生成的商品id.因为门店也有可能自己维护商品数据，所以每个门店的商品id有自己的，而不是信赖企业的商品id
				stockLog.stock_type = "out"
				stockLog.num = it.num
				stockLog.actnum = stock.num//
				stockLog.attach_sn = saleOrder.order_sn
				stockLog.attach_id = saleOrder.id
				stockLog.save()
		}
		
		
		session.saleTablePOJO = null;
		flash.message = "成功卖出商品啦！"
		flash.saleOrder = saleOrder;
		redirect(action: "saleGoodsList", params: params);
	}
}
