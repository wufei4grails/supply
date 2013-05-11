package supply

class StockTagLib {

	static namespace = "stock"
	
	def stockType = {attrs ->

		if(attrs.type=="in"){
			out << "进库"
		}
		if(attrs.type=="out"){
			out << "出库"
		}
        
    }
}
