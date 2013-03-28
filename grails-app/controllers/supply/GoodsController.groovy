package supply

import grails.converters.JSON
class GoodsController {

    def index() { }
    
    def categoryManager(){
        def root = GoodsCategory.findByName("root");
        def ctree = root?.getAllChildren()
        def coll = []
        ctree.each{
            coll.add(new ZTreeNodePOJO(name:it.name,id:it.id,pId:it.parent.id));
            
        }
        
//        coll.each{
//            println it.name + "|" + it.id + "|" + it.pId
//            
//        }
        
        
        def map = ["ctree" : coll as JSON]
        
        render(view: "/company/goods/categoryList", model:map)
    }
    
    
    def addCategory(){
        
        
//        if(params.id){
            def n = GoodsCategory.get(params.node_id);
            if(n){
                n.name = params.name
                n.save()
            }else{
                def parentNode = GoodsCategory.get(params.parent_id);
                def c = new GoodsCategory(name:params.name,parent:parentNode)
                c.save()
            }
            
//        }
        render "1"
        
    }
    
    def removeCategory(){
        def n = GoodsCategory.get(params.node_id);
        n.delete()
        render "1"
    }
    
}
