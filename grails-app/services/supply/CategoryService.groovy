package supply

class CategoryService {

    def serviceMethod() {

    }
    
    
    def categorySelect(Long id){
//        def thisCategorySelect = thisCategorySelect(id);
//        
        def childCategorySelect = childCategorySelect(id);
        
        def parentsCategorySelect = parentsCategorySelect(id);
        //用于提交参数c_id到后台
        def category_input = "<input  type='hidden' id='c_id' name='c_id' value='"+id+"'/>"
        category_input + parentsCategorySelect + childCategorySelect
    }
    
    
    def parentsCategorySelect = {Long id->
        def pGoodsCategory = GoodsCategory.get(id).parent
        if(id == 1) return ""
        parentsCategorySelect(pGoodsCategory.id) + thisCategorySelect(id) 
    }
    
    
    
    
    def thisCategorySelect(Long id){//查询本级下拉框
        def goodsCategory = GoodsCategory.get(id)
        def pGoodsCategory = goodsCategory.parent
        def thisCategorySelect = pGoodsCategory.children
        def s = "<select class='input-small' onchange='categoryChange(this)' onclick='categorySelect(this)'>"
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
            s = "<select class='input-small' onchange='categoryChange(this)' onclick='categorySelect(this)'>"
            s = s + "<option value='"+id+"'>请选择</option>"
            childCategorySelect.each{
                
               
                
                s = s + "<option  value='"+it.id+"'>" + it.name + "</option>"
            }
            s = s + "</select>";
        }
        
        return s
        
    }
}
