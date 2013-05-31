package supply

import grails.converters.JSON
class ReportController {

    def index() { }
    
    def storeReportManager(){
	    redirect(action: "storeOwnerSaleReport", params: params)
    }

    def storeOwnerSaleReport(){
	    
	    
	def searchClosure =  {
		and {
			saleOrder{
				and{
					eq("store_id",session.loginPOJO.store.id.toString())
					
					if(params.start_time){
						gt("dateCreated",Date.parse('yyyy-MM-dd HH:mm:ss',params.start_time+" 00:00:00"))
					}
					if(params.end_time){
						lt("dateCreated",Date.parse('yyyy-MM-dd HH:mm:ss',params.end_time+" 23:59:59"))
					}
						
				}
			}
		}
        }
	
	def ogc = SaleOrderGoods.createCriteria();
        def results = ogc.list(params,searchClosure)	

	def orderGoodsList = []
	def orderGoodsReportMap = [:]
	results.each{
		GoodsReportPOJO goodsReportPOJO = orderGoodsReportMap.get(it.goods.id)
		
		if(!goodsReportPOJO){
			goodsReportPOJO = new GoodsReportPOJO()
			goodsReportPOJO.goods_name = it.goods.goods_name
			goodsReportPOJO.goods_sn = it.goods.goods_sn
			goodsReportPOJO.num = it.num
			goodsReportPOJO.avgprice = it.price
			goodsReportPOJO.amount = it.price * it.num
			orderGoodsReportMap.put(it.goods.id,goodsReportPOJO)
			orderGoodsList.add(goodsReportPOJO)
		}else{
//			goodsReportPOJO.goods_name = it.goods.goods_name
			goodsReportPOJO.num = it.num + goodsReportPOJO.num
			goodsReportPOJO.amount = new BigDecimal(it.price * it.num).setScale(2, BigDecimal.ROUND_HALF_UP) + new BigDecimal(goodsReportPOJO.amount).setScale(2, BigDecimal.ROUND_HALF_UP)
			goodsReportPOJO.avgprice = new BigDecimal(goodsReportPOJO.amount.toFloat()/goodsReportPOJO.num).setScale(2, BigDecimal.ROUND_HALF_UP)
			orderGoodsReportMap.put(it.goods.id,goodsReportPOJO)
		}
			
	}
	def map = [orderGoodsList:orderGoodsList]
	
	render(view: "/member/report/storeReportList", model:map)
    }
	
    def companyReportManager(){
	    redirect(action: "companySaleReport", params: params)
    }
    def storeSaleReport(){
	    
	def storeSearch =  {
		eq('store_type','store')
        }
        
        def s = Store.createCriteria();
        def storeList = s.list(params,storeSearch)
//	println storeList as JSON
	    
	def searchClosure =  {
		and {
			saleOrder{
				and{
					eq("store_id",params.store_id)
					
					if(params.start_time){
						gt("dateCreated",Date.parse('yyyy-MM-dd HH:mm:ss',params.start_time+" 00:00:00"))
					}
					if(params.end_time){
						lt("dateCreated",Date.parse('yyyy-MM-dd HH:mm:ss',params.end_time+" 23:59:59"))
					}
						
				}
			}
		}
        }
	
	def ogc = SaleOrderGoods.createCriteria();
        def results = ogc.list(params,searchClosure)	

	def orderGoodsList = []
	def orderGoodsReportMap = [:]
	results.each{
		GoodsReportPOJO goodsReportPOJO = orderGoodsReportMap.get(it.goods.id)
		
		if(!goodsReportPOJO){
			goodsReportPOJO = new GoodsReportPOJO()
			goodsReportPOJO.goods_name = it.goods.goods_name
			goodsReportPOJO.goods_sn = it.goods.goods_sn
			goodsReportPOJO.num = it.num
			goodsReportPOJO.avgprice = it.price
			goodsReportPOJO.amount = it.price * it.num
			orderGoodsReportMap.put(it.goods.id,goodsReportPOJO)
			orderGoodsList.add(goodsReportPOJO)
		}else{
//			goodsReportPOJO.goods_name = it.goods.goods_name
			goodsReportPOJO.num = it.num + goodsReportPOJO.num
			goodsReportPOJO.amount = new BigDecimal(it.price * it.num).setScale(2, BigDecimal.ROUND_HALF_UP) + new BigDecimal(goodsReportPOJO.amount).setScale(2, BigDecimal.ROUND_HALF_UP)
			goodsReportPOJO.avgprice = new BigDecimal(goodsReportPOJO.amount.toFloat()/goodsReportPOJO.num).setScale(2, BigDecimal.ROUND_HALF_UP)
			orderGoodsReportMap.put(it.goods.id,goodsReportPOJO)
		}
			
	}
	def map = [orderGoodsList:orderGoodsList,storeList:storeList]
	
	render(view: "/company/report/storeReportList", model:map)
    }
	
	
	
	
    def companySaleReport(){
	    
	def searchClosure =  {
		and {
			shoppingOrder{
				and{
					eq("status","success")
					
					if(params.start_time){
						Long start_time = Date.parse('yyyy-MM-dd HH:mm:ss',params.start_time+" 00:00:00").getTime()
						gt("confirmTime",start_time)
					}
					if(params.end_time){
						Long end_time = Date.parse('yyyy-MM-dd HH:mm:ss',params.end_time+" 23:59:59").getTime()
						lt("confirmTime",end_time)
					}
						
				}
			}
		}
        }
	
	def ogc = OrderGoods.createCriteria();
        def results = ogc.list(params,searchClosure)	

	def orderGoodsList = []
	def orderGoodsReportMap = [:]
	results.each{
		GoodsReportPOJO goodsReportPOJO = orderGoodsReportMap.get(it.goods.id)
		
		if(!goodsReportPOJO){
			goodsReportPOJO = new GoodsReportPOJO()
			goodsReportPOJO.goods_name = it.goods.goods_name
			goodsReportPOJO.goods_sn = it.goods.goods_sn
			goodsReportPOJO.num = it.num
			goodsReportPOJO.avgprice = it.price
			goodsReportPOJO.amount = it.price * it.num
			orderGoodsReportMap.put(it.goods.id,goodsReportPOJO)
			orderGoodsList.add(goodsReportPOJO)
		}else{
//			goodsReportPOJO.goods_name = it.goods.goods_name
			goodsReportPOJO.num = it.num + goodsReportPOJO.num
			goodsReportPOJO.amount = new BigDecimal(it.price * it.num).setScale(2, BigDecimal.ROUND_HALF_UP) + new BigDecimal(goodsReportPOJO.amount).setScale(2, BigDecimal.ROUND_HALF_UP)
			goodsReportPOJO.avgprice = new BigDecimal(goodsReportPOJO.amount.toFloat()/goodsReportPOJO.num).setScale(2, BigDecimal.ROUND_HALF_UP)
			orderGoodsReportMap.put(it.goods.id,goodsReportPOJO)
		}
			
	}
	def map = [orderGoodsList:orderGoodsList]
	
	render(view: "/company/report/companyReportList", model:map)
    }
	
}
