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
	    
	def map = [:]
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
