package supply

class OrderStatusTagLib {
	static namespace = "order"
	
	//waitpay,waitship,waitconfirm,success,notpayclose,notshipclose
	def orderStatusDic = { attrs ->
		switch (attrs.status){
		case "waitpay": out << "未付款"
			break;
		case "waitship": out << "已付款,等待发货"
			break;
		case "waitconfirm": out << "已发货，等待收货确认"
			break;
		case "success": out << "已完成"
			break;
		case "notpayclose": out << "付款超时取消"
			break;
		case "notshipclose": out << "发货超时取消"
			break;
		}
		
	}
}
