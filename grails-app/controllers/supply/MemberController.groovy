package supply

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
    
    def doAddAddress(){
        Address address = new Address(params)
        address.store = session.loginPOJO.store
        address.save();
        flash.message = "添加新收货地址成功！"
        redirect(action: "reqAddAddress")
    }
    
    def reqUpdateAddress(){
        def address = Address.get(params.id);
        def map = [address: address]
        render(view: "address/updateAddress", model:map)
    }
    
    def doUpdateAddress(Long id){
        def address = Address.get(id);
        address.properties = params
        address.save();
        
        flash.message = "修改收货地址成功！"
        redirect(action: "reqUpdateAddress",id: address.id)
    }
    
    def delAddress(){
        def address = Address.get(params.id);
        address.delete()
   
    }
    
}
