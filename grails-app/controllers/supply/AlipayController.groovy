package supply

import com.alipay.config.*
import com.alipay.util.*
import java.util.HashMap
import java.util.Map
import grails.converters.JSON
class AlipayController {

    def index() { }
    
	def alinotify(){
		Map<String,String> params = new HashMap<String,String>();
		Map requestParams = request.getParameterMap();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			//乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
			//valueStr = new String(valueStr.getBytes("ISO-8859-1"), "gbk");
			params.put(name, valueStr);
		}
		
		
		
		if(!AlipayNotify.verify(params)){//验证不通过,后面的业务将都不执行
			render "fail"
				return;
		}
		
		
		def trade_status = params.trade_status;
		
		if(trade_status=="TRADE_SUCCESS"){
			def order_sn = params.out_trade_no;
			def shoppingOrder = ShoppingOrder.findByOrder_sn(order_sn)
			shoppingOrder.payTime = new Date().getTime()
			shoppingOrder.status = "waitship"
			println "订单支付成功，回调执行修改订单状态："+ (shoppingOrder as JSON)

			
			render "success"
				return;
		}
		
		
		
		
	}
	
	def alireturn(){
		def order_sn = params.out_trade_no;
		def shoppingOrder = ShoppingOrder.findByOrder_sn(order_sn)
		def map = [shoppingOrder:shoppingOrder]
		render(view: "/member/shopping/payOrderSuccess", model:map)
	}

	def reqPay(){
		String baseUrl = "http://" + request.getServerName() + ":" + request.getServerPort()
		def order_sn = params.order_sn;
		def shoppingOrder = ShoppingOrder.findByOrder_sn(order_sn)
		
		//支付类型
		String payment_type = "1";
		//必填，不能修改
		//服务器异步通知页面路径
		String notify_url = grailsApplication.getConfig().AlipayConfig.notify_url+"${createLink(action: 'alinotify')}";
		//需http://格式的完整路径，不能加?id=123这类自定义参数

		//页面跳转同步通知页面路径
		String return_url = grailsApplication.getConfig().AlipayConfig.return_url+"${createLink(action: 'alireturn')}"
		//需http://格式的完整路径，不能加?id=123这类自定义参数，不能写成http://localhost/

		//卖家支付宝帐户
		String seller_email = grailsApplication.getConfig().AlipayConfig.seller_email;
		//必填

		//商户订单号
		String out_trade_no = shoppingOrder.order_sn;
		//商户网站订单系统中唯一订单号，必填

		//订单名称
		String subject = shoppingOrder.order_sn;
		//必填

		//付款金额
		String total_fee = shoppingOrder.amount;
		//必填

		//订单描述

		String body = "";
		//商品展示地址
		String show_url = "";
		//需以http://开头的完整路径，例如：http://www.xxx.com/myorder.html

		//防钓鱼时间戳
		String anti_phishing_key = "";
		//若要使用请调用类文件submit中的query_timestamp函数

		//客户端的IP地址
		String exter_invoke_ip = "";
		//非局域网的外网IP地址，如：221.0.0.1
		
		
		//////////////////////////////////////////////////////////////////////////////////
		
		//把请求参数打包成数组
		Map<String, String> sParaTemp = new HashMap<String, String>();
		sParaTemp.put("service", "create_direct_pay_by_user");
        sParaTemp.put("partner", AlipayConfig.partner);
        sParaTemp.put("_input_charset", AlipayConfig.input_charset);
		sParaTemp.put("payment_type", payment_type);
		sParaTemp.put("notify_url", notify_url);
		sParaTemp.put("return_url", return_url);
		sParaTemp.put("seller_email", seller_email);
		sParaTemp.put("out_trade_no", out_trade_no);
		sParaTemp.put("subject", subject);
		sParaTemp.put("total_fee", total_fee);
		sParaTemp.put("body", body);
		sParaTemp.put("show_url", show_url);
		sParaTemp.put("anti_phishing_key", anti_phishing_key);
		sParaTemp.put("exter_invoke_ip", exter_invoke_ip);
		
		//建立请求
		String sHtmlText = AlipaySubmit.buildRequest(sParaTemp,"get","确认");
//		out.println(sHtmlText);
		
		render sHtmlText
	}
}
