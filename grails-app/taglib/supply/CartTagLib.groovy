package supply

class CartTagLib {
	static namespace = "cart"
	
	def cartlist={
		if(session.cartPOJO){
			def cartPOJO = session.cartPOJO
			def o = ""
			cartPOJO.buyPOJOMap.each{
				
				o = o +'<li>'
				o = o +	'<a href="'
				o = o + "${createLink(controller:'shopping',action: 'buyGoodsDetail',id:it.value.goods.id)}"
				o = o +	'">'
				o = o +	  '<div >'+it.value.goods.goods_name+'</div>'
				o = o +	  '<div >￥'+it.value.goods.price+'×'+it.value.num

				
				o = o +	'<i style="float:right;" class="icon-remove" onclick="removeGoods(this,'+it.value.goods.id+')"></i>'
				o = o + '</div>'
				o = o +	'</a>'
				o = o +    '</li>'
			}
		
			out << o
		}
		
	}
}
