package supply

class AreaTagLib {
    static namespace = "area"
    def areaService
    def grailsApplication
    
    
    def areaSeclect = {attrs ->
//        def remotAttrs = attrs.clone()
//        remotAttrs.putAt("id","jQuery(o).val()")
//        def rf = remoteFunction(remotAttrs)
        def rf = "jQuery.ajax({type:'POST', url:'"+request.getContextPath()+"/area/areaSelect/'+jQuery(o).val(),success:function(data,textStatus){jQuery('#areaSelect').html(data);},error:function(XMLHttpRequest,textStatus,errorThrown){}});"
        
        out << areaService.areaSelect(attrs.id);
        out << "<script>"
        out << "function areaSelect(o){"
        out << rf
        out << "jQuery('#area_id'.val(jQuery(o).val()))"
        out << "}"
        out << "</script>"
    }
}
