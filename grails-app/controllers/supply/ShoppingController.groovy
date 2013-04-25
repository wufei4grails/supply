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
}
