package supply

class CategoryTagLib {

    static namespace = "category"
    def categoryService
    
    def categorySeclect = {attrs ->
        
        def rf = "jQuery.ajax({type:'POST', url:'"+request.getContextPath()+"/goods/categorySelect/'+jQuery(o).val(),success:function(data,textStatus){jQuery('#categorySelect').html(data);},error:function(XMLHttpRequest,textStatus,errorThrown){}});"
        
        out << categoryService.categorySelect(new Long(attrs.id));
        out << "<script>"
        out << "function categorySelect(o){"
        out << rf
        out << "jQuery('#c_id'.val(jQuery(o).val()))"
        out << "}"
        out << "</script>"
    }
}
