package supply

import grails.converters.JSON
class ShoppingController {

    def categoryService
    def index() { }
    
    def shoppingManager(){
         redirect(action: "shoppingGoodsList", params: params)
    }
    
    def shoppingGoodsList(){
        
       
        
        
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
        }
        
        def g = Goods.createCriteria();
        def results = g.list(params,searchClosure)
        def map = [goodsList: results, goodsTotal: results.totalCount]
        
        
        render(view: "/member/shopping/shoppingGoodsList", model:map)
        
        
    }
}
