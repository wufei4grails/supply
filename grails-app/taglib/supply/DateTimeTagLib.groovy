package supply

import java.text.SimpleDateFormat
class DateTimeTagLib {

	static namespace = "datetime"
	
	//waitpay,waitship,waitconfirm,success,notpayclose,notshipclose
	def getDateTime = { attrs ->
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(attrs.longtime){
			Date date = new Date(attrs.longtime);
			out << sdf.format(date)	
		}else{
			out << ""
		}
		
		
	}
}
