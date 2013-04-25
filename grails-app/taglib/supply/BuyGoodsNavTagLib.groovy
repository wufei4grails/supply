package supply

class BuyGoodsNavTagLib {
    
	static namespace = "buyGoodsNav"
	def categoryService
	
	def buyGoodsNav={ actionName ->
		
		//商品列表页面输面包导航标签输出
		if(params.action=="shoppingGoodsList"){
			if(!params.c_id){
				out <<  "<li >"
				out <<  " ${link(action:"shoppingGoodsList", controller:"shopping"){"全部商品"}}"
				out <<  "</li>"
			}else{
				List pgclist = new ArrayList()
                
				categoryService.parentsCategoryList(new Long(params.c_id),pgclist)
				pgclist.add(GoodsCategory.get(params.c_id))
                
				def o = ""
				pgclist.each{
                    
					if(it.name!="root"){
						def n = it.name
						def m = new HashMap();
						m.put("c_id",it.id)
						o = o + "<li >" 
						o = o + "${link( action:'shoppingGoodsList', controller:'shopping',params:m){n}}"  
						o = o + "<span class='divider'>/</span>"
						o = o + "</li>"
					}
                    
                    
                    
                    
				}
				out <<  o
			}
		}
		//商品详细页面输面包导航标签输出
		if(params.action=="buyGoodsDetail"){
			def goods = Goods.get(params.id)
			List pgclist = new ArrayList()
                
			categoryService.parentsCategoryList(new Long(goods.c_id),pgclist)
			pgclist.add(GoodsCategory.get(goods.c_id))
			def o = ""
			pgclist.each{
                    
				if(it.name!="root"){
					def n = it.name
					def m = new HashMap();
					m.put("c_id",it.id)
					o = o + "<li >" 
					o = o + "${link( action:'shoppingGoodsList', controller:'shopping',params:m){n}}"  
					o = o + "<span class='divider'>/</span>"
					o = o + "</li>"
				}
                    
			}
			
			
			o = o + "<li >" 
			o = o + goods.goods_name
			o = o + "</li>"
			
			out <<  o
			
		}
            
        
	}
}
