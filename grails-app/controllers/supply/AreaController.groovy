package supply

import grails.converters.JSON
class AreaController {

    def areaService
    def index() { }
    
    
    def areaSelect(){
        def id = params.id //当前选择的区域id
   
        render areaService.areaSelect(id);
    }
    
    
    
}
