package supply

import grails.converters.JSON
class GoodsCategoryAttrService {

    def serviceMethod() {

    }
    
    
    def selGoodsCategoryAttr(GoodsCategory gc){
        return GoodsCategoryAttr.findAllByC_id(gc.id) 
    }
    
    def selParentGoodsCategoryAttr(GoodsCategory gc){
        
        List gcList = new ArrayList();
        
        
        selParentGoodsCategory(gc,gcList)
        
        Map gcAttrMap = new HashMap()
//        println(gcList)
        gcList.each{
            gcAttrMap.put(it.name,GoodsCategoryAttr.findAllByC_id(it.id))
        }
//        println(gcAttrMap as JSON)
        
        return gcAttrMap 
        
    }
    
    
    
    
    def selParentGoodsCategory(GoodsCategory gc, List gcList){
        if(gc.name=="root"){
            return gcList
        }
        def pc = gc.parent
        if(pc.name!="root"){
            gcList.add(pc)
            selParentGoodsCategory(pc,gcList)
        }
    }
}
