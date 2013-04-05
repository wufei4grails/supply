package supply

import grails.converters.JSON
class GoodsCategoryAttrController {

    def index() { }
    
    def selGoodsCategoryAttr(){
        
//        GoodsCategoryAttr.findAllByC_id(params.c_id)
//        println(GoodsCategoryAttr.findAllByC_id(params.c_id) as JSON)
        render GoodsCategoryAttr.findAllByC_id(params.c_id) as JSON
    }
    
    def updateGoodsCategoryAttr(){
        
        boolean f = true 
        params.attr_name.each{
          
            if(it.length()==0){
                f = false;
            }
        }
        
        if(f){
            if(params.attr_name){
            
                GoodsCategoryAttr.findAllByC_id(params.c_id).each{
                    it.delete();
                }
            }
        
            params.attr_name.each{
                def goodsCategoryAttr = new GoodsCategoryAttr(attr_name:it,c_id:params.c_id)
                goodsCategoryAttr.save()
            }
            render "1"
        }else{
            render "0"
        }
        
        
        
        
    }
}
