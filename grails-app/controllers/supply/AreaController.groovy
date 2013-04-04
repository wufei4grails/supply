package supply

import grails.converters.JSON
class AreaController {

    def areaService
    def index() { }
    
    
    def areaSelect(){
        def id = params.id //当前选择的区域id
       // def childSelect = Area.findAllByArea_pid(id)
        def thisAreaSelect = areaService.thisAreaSelect(id);
        def childAreaSelect = areaService.childAreaSelect(id);
        def parentsAreaSelect = areaService.parentsAreaSelect(id);
        
        render parentsAreaSelect + thisAreaSelect + childAreaSelect
    }
    
    
    
}
