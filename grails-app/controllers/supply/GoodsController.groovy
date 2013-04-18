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
        
        if(!params.name){
            render "0"
            return
        }
        
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
    
    
    def reqAddGoods(){
        
        
        
        def map = []
        render(view: "/company/goods/goodsPub", model:map)
    }
    
    def doAddGoods(){
        def goods = new Goods(params)
        goods.save(flush:true);
        def attach_id = goods.id;
        
        
        
        def img_urls = params.img_url.tokenize(',')
        
        img_urls.each{
            def attach = new Attach(attach_id:attach_id,url:it)
            attach.save()
        }
        
        flash.message = "发布商品成功！"
        redirect(action: "reqAddGoods")
    }
    
    
    //商品列表
    def reqGoodsList(){
        
        if (!params.max) params.max = 10  
        if (!params.offset) params.offset = 0  
        if (!params.sort) params.sort = "lastUpdated"  
        if (!params.order) params.order = "desc" 
        
        
        def searchClosure =  {
             if(params.goods_name) {
                 like('goods_name',"%${params.goods_name}%")
             }
             if(params.goods_sn) {
                 like('goods_sn',"%${params.goods_sn}%")
             }
        }
        
        def g = Goods.createCriteria();
        def results = g.list(params,searchClosure)
        def map = [goodsList: results, goodsTotal: results.totalCount]
        
        
        render(view: "/company/goods/goodsList", model:map)
    }
    
    
    
    def reqUpdateGoods(){
        def goods = Goods.get(params.id);
        def attachList = Attach.findAllByAttach_id(params.id)
        def map = [goods: goods,attachList:attachList]
        render(view: "/company/goods/goodsUpdate", model:map)
    }
    
    def doUpdateGoods(Long id){
        def goods = Goods.get(id);
        goods.properties = params
        goods.save();
        
        def img_urls = params.img_url.tokenize(",")
        
        img_urls.each{
            def attach = new Attach(attach_id:goods.id,url:it)
            attach.save()
        }
        
        flash.message = "修改商品成功！"
        redirect(action: "reqUpdateGoods",id: goods.id)
    }
    
    def delImg(){
        def attach = Attach.get(params.id);
        attach.delete()
    }
    
    
    def delGoods(){
        def goods = Goods.get(params.id);
        goods.delete()
        Attach.executeUpdate("delete Attach a where a.attach_id = :attach_id ",[attach_id:params.id])
    }
    
}
