package supply

class AreaService {

    def serviceMethod() {

    }
    
    def areaSelect(String id){
        def thisAreaSelect = areaService.thisAreaSelect(id);
        def childAreaSelect = areaService.childAreaSelect(id);
        def parentsAreaSelect = areaService.parentsAreaSelect(id);
        
        return parentsAreaSelect + thisAreaSelect + childAreaSelect
    }
    
    
    def parentsAreaSelect(String id){
        //def thisArea = Area.get(id);    
        def parentsAreaSelect = "";
        def pid,ppid,pppid;
        pid = id.substring(0,id.length()-3);
        if(pid!="0"){
            parentsAreaSelect = thisAreaSelect(pid) + parentsAreaSelect
        }
        
        if(pid!=null&&pid!="0"){
            ppid = pid.substring(0,pid.length()-3);
            if(ppid!="0"){
                parentsAreaSelect = thisAreaSelect(ppid) + parentsAreaSelect
            }
        }
        
        
        if(ppid!=null&&ppid!="0"){
            pppid = ppid.substring(0,ppid.length()-3);
            if(pppid!="0"){
                parentsAreaSelect = thisAreaSelect(pppid) + parentsAreaSelect
            }
        }
        
        
        
        
        return parentsAreaSelect
    }
    
    
    
    def thisAreaSelect(String id){//查询本级下拉框
        //当前选择的区域id
       
        def pid = id.substring(0,id.length()-3);
       
        
        def thisAreaSelect = Area.findAllByArea_pid(pid)
        
        def s = "<select class='input-small'>"
        s = s + "<option value=''>请选择</option>"
        def sel = ""
        thisAreaSelect.each{
            
            
            def thisid = "0"+it.id//数据库区域编码中以0开始，而grails自动以int型查出，把第一位的0去掉了
            
            
            if(id == thisid){
                sel = "selected"
               
            }
            s = s + "<option "+sel+" value='"+thisid+"'>" + it.area_name + "</option>"
            sel = ""
        }
        s = s + "</select>";
        
        return s
    }
    
    def childAreaSelect(String id){
        //当前选择的区域id
        def childAreaSelect = Area.findAllByArea_pid(id)
        
        
        def s = ""
        if(childAreaSelect){
            s = "<select class='input-small'>"
            s = s + "<option value=''>请选择</option>"
            childAreaSelect.each{
                
                def thisid = "0"+it.id
                
                s = s + "<option  value='"+thisid+"'>" + it.area_name + "</option>"
            }
            s = s + "</select>";
        }
        
        return s
        
    }
}
