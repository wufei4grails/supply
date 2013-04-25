package supply

class BuyGoodsNavTagLib {
    
    static namespace = "buyGoodsNav"
    def categoryService
	
    def buyGoodsNav={ actionName ->
	println(params)
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
                println(pgclist)
                
                def o = ""
                pgclist.each{
                    
                    if(it.name!="root"){
                        o = o + "<li >" 
                        o = o + " <a href=#>"+it.name+"</a>"  
                        o = o + "<span class='divider'>/</span>"
                        o = o + "</li>"
                    }
                    
                    
                    
                    
                }
                out <<  o
            }
        }
        //商品详细页面输面包导航标签输出
        if(params.action=="buyGoodsDetail"){
                
        }
            
        
    }
}
