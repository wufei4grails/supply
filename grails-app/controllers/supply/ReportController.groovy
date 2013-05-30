package supply

import grails.converters.JSON
class ReportController {

    def index() { }
    
    def companyReportManager(){
	    redirect(action: "companySaleReport", params: params)
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
