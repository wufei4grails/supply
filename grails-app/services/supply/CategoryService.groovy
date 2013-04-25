package supply

import grails.converters.JSON
class CategoryService {

    def serviceMethod() {

    }
    
    
    def categoryTree(){
        def root = GoodsCategory.findByName("root");
        def ctree = root?.getAllChildren()
        def coll = []
        ctree.each{
            coll.add(new ZTreeNodePOJO(name:it.name,id:it.id,pId:it.parent.id));
        }
        return coll as JSON
    }

    
    
    def categorySelect(Long id){
//        def thisCategorySelect = thisCategorySelect(id);
//        
        def childCategorySelect = childCategorySelect(id);
        
        def parentsCategorySelect = parentsCategorySelect(id);
        //用于提交参数c_id到后台
        def category_input = "<input   type='hidden' id='c_id' name='c_id' value='"+id+"'/>"
         parentsCategorySelect + childCategorySelect + category_input 
    }
    
    
    def parentsCategorySelect = {Long id->
        def pGoodsCategory = GoodsCategory.get(id).parent
        if(id == 1) return ""
        parentsCategorySelect(pGoodsCategory.id) + thisCategorySelect(id) 
    }
    
    //根據分類遞歸獲取所有父級的分類 
    def parentsCategoryList(Long id,List pgclist){
        def pGoodsCategory = GoodsCategory.get(id).parent
        if(id == 1) return ""
        pgclist.add(0,pGoodsCategory)
        parentsCategoryList(pGoodsCategory.id,pgclist)
    }
    
    
    
    
    def thisCategorySelect(Long id){//查询本级下拉框
        def goodsCategory = GoodsCategory.get(id)
        def pGoodsCategory = goodsCategory.parent
        def thisCategorySelect = pGoodsCategory.children
        def s = "<select class='input-small' onchange='categoryChange(this),categorySelect(this)' >"
        s = s + "<option value='"+pGoodsCategory.id+"'>请选择</option>"
        def sel = ""
        thisCategorySelect.each{
            
            if(id == it.id){
                sel = "selected"
               
            }
            s = s + "<option "+sel+" value='"+it.id+"'>" + it.name + "</option>"
            sel = ""
        }
        s = s + "</select>";
        
        return s
        
    }
    
    
    def childCategorySelect(Long id){
        //当前选择的区域id
        def childCategorySelect =GoodsCategory.get(id).children
        
        
        def s = ""
        if(childCategorySelect){
            s = "<select class='input-small' onchange='categoryChange(this),categorySelect(this)' >"
            s = s + "<option value='"+id+"'>请选择</option>"
            childCategorySelect.each{
                
               
                
                s = s + "<option  value='"+it.id+"'>" + it.name + "</option>"
            }
            s = s + "</select>";
        }
        
        return s
        
    }
}
