package supply

import grails.converters.JSON
class GoodsController {

    def categoryService
    def index() { }
    
    
    def categorySelect(Long id){
        render categoryService.categorySelect(id )
    }
    
    def categoryManager(){
//        def root = GoodsCategory.findByName("root");
//        def ctree = root?.getAllChildren()
//        def coll = []
//        ctree.each{
//            coll.add(new ZTreeNodePOJO(name:it.name,id:it.id,pId:it.parent.id));
//            
//        }
        
        def map = ["ctree" : categoryService.categoryTree()]
        
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
        def img_urls = params.img_url.tokenize(',')
        def goods = new Goods(params)
        goods.status="on"//发布商品默认上架
        if(img_urls[0]){
            goods.img=img_urls[0].replace(request.getContextPath(),'')
        }
        goods.save(flush:true);
        def attach_id = goods.id;
        
        
        
        
        
        img_urls.each{
            def attach = new Attach(attach_id:attach_id,url:it.replace(request.getContextPath(),''))
            attach.save()
        }
        
        //维护商品属性数据
        def attr_name = params.attr_name
        def attr_val = params.attr_val
        
        
        if(attr_name!=""){
            (0..<attr_name.length).each{
                if(attr_name[it]!=""){
                    GoodsAttr goodsAttr = new GoodsAttr(goods_id:goods.id,attr_name:attr_name[it],attr_val:attr_val[it])
                    goodsAttr.save()
                }
            }
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
		eq('store_id','1')
             if(params.goods_name) {
                 like('goods_name',"%${params.goods_name}%")
             }
             if(params.goods_sn) {
                 like('goods_sn',"%${params.goods_sn}%")
             }
             if(params.status) {
                 eq('status',"${params.status}")
             }
        }
        
        def g = Goods.createCriteria();
        def results = g.list(params,searchClosure)
        def map = [goodsList: results, goodsTotal: results.totalCount]
        
        
        render(view: "/company/goods/goodsList", model:map)
    }
    
    
    
    def reqUpdateGoods(){
        def goods = Goods.get(params.id);
	
	if(goods.store_id!=session.loginPOJO.store.id.toString()){
		render "只能查看自己的商品"
		return
	}
		
        def attachList = Attach.findAllByAttach_id(params.id)
        def goodsAttrList = GoodsAttr.findAllByGoods_id(params.id)
        def map = [goods: goods,attachList:attachList,goodsAttrList:goodsAttrList]
        render(view: "/company/goods/goodsUpdate", model:map)
    }
    
    def doUpdateGoods(Long id){
        def img_urls = params.img_url.tokenize(",")
	
		
	img_urls.each{
            def attach = new Attach(attach_id:id,url:it.replace(request.getContextPath(),''))
            attach.save()
        }

	def attachList = Attach.findAllByAttach_id(params.id)
		
        def goods = Goods.get(id);
        goods.properties = params
        if(attachList[0]){//取图片第一张为主图
            goods.img=attachList[0].url
        }
        
        goods.save();
        
        
        
        
        
        GoodsAttr.executeUpdate("delete GoodsAttr g where g.goods_id = :goods_id ",[goods_id:params.id])
        //维护商品属性数据
        def attr_name = params.attr_name
        def attr_val = params.attr_val
        
        if(attr_name!=""){
            (0..<attr_name.length).each{
                if(attr_name[it]!=""){
                    GoodsAttr goodsAttr = new GoodsAttr(goods_id:goods.id,attr_name:attr_name[it],attr_val:attr_val[it])
                    goodsAttr.save()
                }
            }
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
        GoodsAttr.executeUpdate("delete GoodsAttr g where g.goods_id = :goods_id ",[goods_id:params.id])
   
    }
    
	def storeGoodsManger(){
		redirect(action: "reqStoreGoodsList", params: params)
	}
	
	def reqStoreGoodsList(){
		if (!params.max) params.max = 10  
		if (!params.offset) params.offset = 0  
		if (!params.sort) params.sort = "lastUpdated"  
		if (!params.order) params.order = "desc" 

		def searchClosure =  {
			eq('store_id',"${session.loginPOJO.store.id}")
		     if(params.goods_name) {
			 like('goods_name',"%${params.goods_name}%")
		     }
		     if(params.goods_sn) {
			 like('goods_sn',"%${params.goods_sn}%")
		     }
		     if(params.status) {
			 eq('status',"${params.status}")
		     }
		}

		def g = Goods.createCriteria();
		def results = g.list(params,searchClosure)
		def map = [goodsList: results, goodsTotal: results.totalCount]


		render(view: "/member/goods/goodsList", model:map)
	}
	
	def reqUpdateStoreGoods(){
		def goods = Goods.get(params.id);
		
		if(goods.store_id!=session.loginPOJO.store.id.toString()){
			render "只能查看自己的商品"
			return
		}
		
		def attachList = Attach.findAllByAttach_id(params.id)
		def goodsAttrList = GoodsAttr.findAllByGoods_id(params.id)
		def map = [goods: goods,attachList:attachList,goodsAttrList:goodsAttrList]
		render(view: "/member/goods/goodsUpdate", model:map)
	}
	
	
	
	
	def doUpdateStoreGoods(Long id){
        def img_urls = params.img_url.tokenize(",")
	
		
	img_urls.each{
            def attach = new Attach(attach_id:id,url:it.replace(request.getContextPath(),''))
            attach.save()
        }

	def attachList = Attach.findAllByAttach_id(params.id)
		
        def goods = Goods.get(id);
        goods.properties = params
        if(attachList[0]){//取图片第一张为主图
            goods.img=attachList[0].url
        }
        
        goods.save();
        
        
        
        
        
        GoodsAttr.executeUpdate("delete GoodsAttr g where g.goods_id = :goods_id ",[goods_id:params.id])
        //维护商品属性数据
        def attr_name = params.attr_name
        def attr_val = params.attr_val
        
        if(attr_name!=""){
            (0..<attr_name.length).each{
                if(attr_name[it]!=""){
                    GoodsAttr goodsAttr = new GoodsAttr(goods_id:goods.id,attr_name:attr_name[it],attr_val:attr_val[it])
                    goodsAttr.save()
                }
            }
        }
        
        
        flash.message = "修改商品成功！"
        redirect(action: "reqUpdateStoreGoods",id: goods.id)
    }
    
}
