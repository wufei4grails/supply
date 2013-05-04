package supply

import grails.converters.JSON
class MemberController {

	def index() { }
    
    
    
	def memberManager(){
		redirect(controller:"member", action: "reqStoreInfo", params: params)
	}
    
	def reqStoreInfo(){
		render(view: "storeInfo")
	}
    
	def doUpdateStoreInfo(){
		def store_id  = session.loginPOJO.store.id
		def store = Store.get(store_id)
		println(store)
		store.properties = params
		store.save();
        
		session.loginPOJO.store = store
		flash.message = "修改门店基本资料成功！"
		redirect(action: "reqStoreInfo")
	}
    
	def reqAddressList(){
        
        
		def store = Store.get(session.loginPOJO.store.id)
		def addressList = store.addresses
        
		def map = [addressList: addressList]
		render(view: "address/addressList", model:map)
	}
    
	def reqAddAddress(){
		render(view: "address/addAddress")
	}
    

	def doAjaxAddAddress(){
	
		Address address = new Address(params)
	
		if(address.is_default=="1"){//如果设置当前的为默认则其它的地址改为非默认
			def store = Store.get(session.loginPOJO.store.id)
			def addressList = store.addresses
			addressList.each{
				it.is_default='0'
				it.save()
			}
			
		}
		
		
		address.store = session.loginPOJO.store
		address.save(flash:true);
		render address as JSON;
	}
    
	def doAddAddress(){
	    
	
		Address address = new Address(params)
	
		if(address.is_default=="1"){//如果设置当前的为默认则其它的地址改为非默认
			def store = Store.get(session.loginPOJO.store.id)
			def addressList = store.addresses
			addressList.each{
				it.is_default='0'
				it.save()
			}
			
		}
		
		
		address.store = session.loginPOJO.store
		address.save();
		flash.message = "添加新收货地址成功！"
		redirect(action: "reqAddressList")
	}
    
	def reqUpdateAddress(){
		def address = Address.get(params.id);
		def map = [address: address]
		render(view: "address/updateAddress", model:map)
	}
    
	def doUpdateAddress(Long id){
		def address = Address.get(id);
		address.properties = params
	
		if(address.is_default=="1"){//如果设置当前的为默认则其它的地址改为非默认
			def store = Store.get(session.loginPOJO.store.id)
			def addressList = store.addresses
			addressList.each{
				if(it.id!=id){
					it.is_default='0'
					it.save()
				}
			
			}
			
		}		
	
		address.save();
        
		flash.message = "修改收货地址成功！"
		redirect(action: "reqUpdateAddress",id: address.id)
	}
    
	def delAddress(){
		def address = Address.get(params.id);
		address.delete()
   
	}
    
}
