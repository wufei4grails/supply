package supply

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
		def map = [goodsList: results, goodsTotal: results.totalCount]

		render(view: "/member/sale/saleList", model:map)
	}
	
	def saleGoodsD(){
		def goods = Goods.get(params.id);
//		def attachList = Attach.findAllByAttach_id(params.id)
//		def goodsAttrList = GoodsAttr.findAllByGoods_id(params.id)
		def map = [goods: goods]
		render(view: "/company/goods/goodsUpdate", model:map)
	}
}
