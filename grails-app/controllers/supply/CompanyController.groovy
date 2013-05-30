package supply

class CompanyController {
    //test git
    
	def googlevisualization(){
		render(view: "googlevisualization")
	}
	
    def index() { 
        redirect(controller:"user",action: "login", params: params)
    }
    
    def news() {
        render(view: "news")
    }
    
	
    def indexManager() { 
        redirect(controller:"company",action: "allInfo", params: params)
    }
    
    def allInfo() { 
	def waitpaySearch =  {
                 eq('status',"waitpay")
        }
	def waitpayC = ShoppingOrder.createCriteria();
        def waitpayR = waitpayC.list(params,waitpaySearch)
	
	def waitshipSearch =  {
                 eq('status',"waitship")
        }
	def waitshipC = ShoppingOrder.createCriteria();
        def waitshipR = waitshipC.list(params,waitshipSearch)
	
		
		
		
	def waitconfirmSearch =  {
                 eq('status',"waitconfirm")
        }
	def waitconfirmC = ShoppingOrder.createCriteria();
        def waitconfirmR = waitconfirmC.list(params,waitconfirmSearch)
	
		
	def successSearch =  {
                 eq('status',"success")
        }
	def successC = ShoppingOrder.createCriteria();
        def successR = successC.list(params,successSearch)

		
	def onGoodsSearch =  {
		eq('store_id','1')
                eq('status',"on")
        }
        
        def onGoodsC = Goods.createCriteria();
        def onGoodsR = onGoodsC.list(params,onGoodsSearch)
	
	def offGoodsSearch =  {
		eq('store_id','1')
                eq('status',"off")
        }
        
        def offGoodsC = Goods.createCriteria();
        def offGoodsR = offGoodsC.list(params,offGoodsSearch)
		
	def map = [waitpay:waitpayR.totalCount,waitship:waitshipR.totalCount,waitconfirm:waitconfirmR.totalCount,successCount:successR.totalCount,onGoodsCount:onGoodsR.totalCount,offGoodsCount:offGoodsR.totalCount]
        render(view: "index/allInfo", model:map)
    }
    
    
    
    //分配门店账号
    def storeCreate(){
        render(view: "storeCreate")
    }
    
    //商品管理
    def goodsManager(){
        redirect(controller:"goods", action: "reqGoodsList", params: params)
    }
    
    //上架商品列表
    def upGoodsList(){
        render(view: "upGoodsList")
    }
    
    //下架商品列表
    def downGoodsList(){
        render(view: "downGoodsList")
    }
    
    //发布商品
    def goodsPub(){
        render(view: "goodsPub")
    }
    
    //发布商品
    def goodsUpdate(){
        render(view: "goodsUpdate")
    }
    
    def goodsCategoryList(){
        render(view: "goodsCategoryList")
    }
    
    //订单管理
    def orderManager(){
        redirect(controller:"order",action: "companyOrderList", params: params)
    }
    
    //订单管理
    def storeManager(){
        redirect(controller:"user",action: "companyStoreList", params: params)
    }
    
    
    
    //报表统计
    def reportManager(){
        redirect(action: "companyReportList", params: params)
    }
    
    def companyReportList(){
        render(view: "companyReportList")
    }
    
    
    def storeReportList(){
        render(view: "storeReportList")
    }
    
    //系统参数配置
    def sysParamManager(){
        redirect(action: "sysParamList", params: params)
    }
    
    def sysParamList(){
        render(view: "sysParamList")
    }
    
    
    
    
}
