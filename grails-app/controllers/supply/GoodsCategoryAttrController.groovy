package supply

import grails.converters.JSON
class GoodsCategoryAttrController {

    def goodsCategoryAttrService
    def index() { }
    
    def selGoodsCategoryAttr(){
        
        //        GoodsCategoryAttr.findAllByC_id(params.c_id)
        //        println(GoodsCategoryAttr.findAllByC_id(params.c_id) as JSON)
	def goodsAttrList = GoodsAttr.findAllByGoods_id(params.goods_id)
        def gc = GoodsCategory.get(params.c_id)
        
        Map pgcAttrJSON =  goodsCategoryAttrService.selParentGoodsCategoryAttr(gc)
	
		
	
		
        List gcAttrJSON = goodsCategoryAttrService.selGoodsCategoryAttr(gc)
	
		def attr_size = gcAttrJSON.size()
		pgcAttrJSON.each{k,v->
			attr_size = attr_size + v.size()
		}
		
		 
		if(attr_size==0){
			render 0//如果自己和父分类的都没有属性，就返回0，这样前台判断数字为0时，提示用户没有属性了。
	
			return;
		}
		
        
        Map attrMap = new HashMap()
        attrMap.put("gcAttrJSON",gcAttrJSON)
        attrMap.put("pgcAttrJSON",pgcAttrJSON)
	attrMap.put("goodsAttrList",goodsAttrList)
        
        println(attrMap as JSON)
        
        render attrMap as JSON
    }
    
    def updateGoodsCategoryAttr(){
        
//        boolean f = true 
//        
//        if(params.attr_name instanceof String){
//            if(params.attr_name.length()==0){
//                f = false;
//            } 
//        }
//        
//        if(params.attr_name instanceof String[]){
//            params.attr_name.each{
//          
//                if(it.length()==0){
//                    f = false;
//                }
//            } 
//        }
        
        boolean f=true;
        if(f){
//            if(params.attr_name){
            
                GoodsCategoryAttr.findAllByC_id(params.c_id).each{
                    it.delete();
                }
//            }
            
           
            
            //            println(params.attr_name)
            
            if(params.attr_name instanceof String){
		    if(params.attr_name.length()!=0){
			def goodsCategoryAttr = new GoodsCategoryAttr(attr_name:params.attr_name,c_id:params.c_id)
			goodsCategoryAttr.save()    
		    }
                
            }
            if(params.attr_name instanceof String[]){
                params.attr_name.each{
                    def goodsCategoryAttr = new GoodsCategoryAttr(attr_name:it,c_id:params.c_id)
                    goodsCategoryAttr.save()
                }
            }
            
            
            
            render "1"
        }else{
            render "0"
        }
        
        
        
        
    }
}
