package supply

import org.springframework.dao.DataIntegrityViolationException

class StockController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }
    
	def stockManger(){
		redirect(action: "list", params: params)
	}

    def list() {
        if (!params.max) params.max = 10
        if (!params.offset) params.offset = 0  
        if (!params.sort) params.sort = "lastUpdated"  
        if (!params.order) params.order = "desc" 
        
        def searchClosure =  {
             if(params.goods_name) {
                 like('goods_name',"%${params.goods_name}%")
             }
//             if(params.status) {
//                 eq('status',"${params.status}")
//             }
		eq('store_id',session.loginPOJO.store.id.toString())
        }
        
        def s = Stock.createCriteria();
        def results = s.list(params,searchClosure)
        def map = [stockList: results, stockTotal: results.totalCount]
        
        render(view: "/member/stock/stockList", model:map)
    }
    
	
	
    def stocklog() {
        if (!params.max) params.max = 10
        if (!params.offset) params.offset = 0  
        if (!params.sort) params.sort = "lastUpdated"  
        if (!params.order) params.order = "desc" 
        
        def searchClosure =  {
//             if(params.goods_name) {
//                 like('goods_name',"%${params.goods_name}%")
//             }
//             if(params.status) {
//                 eq('status',"${params.status}")
//             }
		eq('store_goods_id',params.store_goods_id)
        }
        
	def stock = Stock.findByStore_goods_id(params.store_goods_id) //.get(params.store_goods_id)
		
        def s = StockLog.createCriteria();
        def results = s.list(params,searchClosure)
        def map = [stockLogList: results, stockLogTotal: results.totalCount,stock:stock]
        
        render(view: "/member/stock/stockLogList", model:map)
    }

    def create() {
        [stockInstance: new Stock(params)]
    }

    def save() {
        def stockInstance = new Stock(params)
        if (!stockInstance.save(flush: true)) {
            render(view: "create", model: [stockInstance: stockInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'stock.label', default: 'Stock'), stockInstance.id])
        redirect(action: "show", id: stockInstance.id)
    }

    def show(Long id) {
        def stockInstance = Stock.get(id)
        if (!stockInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'stock.label', default: 'Stock'), id])
            redirect(action: "list")
            return
        }

        [stockInstance: stockInstance]
    }

    def edit(Long id) {
        def stockInstance = Stock.get(id)
        if (!stockInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'stock.label', default: 'Stock'), id])
            redirect(action: "list")
            return
        }

        [stockInstance: stockInstance]
    }

    def update(Long id, Long version) {
        def stockInstance = Stock.get(id)
        if (!stockInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'stock.label', default: 'Stock'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (stockInstance.version > version) {
                stockInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'stock.label', default: 'Stock')] as Object[],
                          "Another user has updated this Stock while you were editing")
                render(view: "edit", model: [stockInstance: stockInstance])
                return
            }
        }

        stockInstance.properties = params

        if (!stockInstance.save(flush: true)) {
            render(view: "edit", model: [stockInstance: stockInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'stock.label', default: 'Stock'), stockInstance.id])
        redirect(action: "show", id: stockInstance.id)
    }

    def delete(Long id) {
        def stockInstance = Stock.get(id)
        if (!stockInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'stock.label', default: 'Stock'), id])
            redirect(action: "list")
            return
        }

        try {
            stockInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'stock.label', default: 'Stock'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'stock.label', default: 'Stock'), id])
            redirect(action: "show", id: id)
        }
    }
}
