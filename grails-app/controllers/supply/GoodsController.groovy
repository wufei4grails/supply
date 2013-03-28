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
        
        if(params.name){
            def root = GoodsCategory.findByName("root");
            def c = new GoodsCategory(params)
            root.addToChildren(c);
            root.save()
            
            
            def z = new ZTreeNodePOJO(name:c.name)
            
            
            render z as JSON
            
        }else{
            render "0"
        }
        
        
        
    }
}
