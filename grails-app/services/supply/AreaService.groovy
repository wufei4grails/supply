package supply

class AreaService {

    def serviceMethod() {

    }
    
    
    def areaName(String id){
        if(!id){
            return ""
        }
        if(!Area.get(id)){
		return ""
	}
        def area_name = Area.get(id).area_name
        
        def pid,ppid,pppid;
        
        pid = id.substring(0,id.length()-3);
        if(pid!=null&&pid!="0"){
            area_name = Area.get(pid).area_name + "-" + area_name
        }
        
        ppid = pid.substring(0,pid.length()-3);
        if(ppid!=null&&ppid!="0"){
            area_name = Area.get(ppid).area_name + "-" + area_name
        }
        
        pppid = ppid.substring(0,ppid.length()-3);
        if(pppid!=null&&pppid!="0"){
            area_name = Area.get(pppid).area_name + "-" + area_name
        }
        
        
        return area_name
    }
    
    
    def areaSelect(String id){
        
        if(!id)id="0100" //如果id没有默认中国
        
        def thisAreaSelect = thisAreaSelect(id);
        def childAreaSelect = childAreaSelect(id);
        def parentsAreaSelect = parentsAreaSelect(id);
        //用于提交参数area_id到后台
        def area_input = "<input type='hidden' id='area_id' name='area_id' value='"+id+"'/>"
        return area_input + parentsAreaSelect + thisAreaSelect + childAreaSelect
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
        
        def s = "<select class='input-small' onclick='areaSelect(this)'>"
        s = s + "<option value='"+pid+"'>请选择</option>"
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
            s = "<select class='input-small' onclick='areaSelect(this)'>"
            s = s + "<option value='"+id+"'>请选择</option>"
            childAreaSelect.each{
                
                def thisid = "0"+it.id
                
                s = s + "<option  value='"+thisid+"'>" + it.area_name + "</option>"
            }
            s = s + "</select>";
        }
        
        return s
        
    }
}
