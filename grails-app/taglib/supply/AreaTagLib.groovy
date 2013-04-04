package supply

class AreaTagLib {
    def areaSeclect = {
        List list = Area.findAllByArea_pid("0100");
        def s = "<select class='input-small'>"
        list.each{
            s = s + "<option  value='"+it.id+"'>" + it.area_name + "</option>"
        }
        s = s + "</select>"
        out << s 
    }
}
