package supply

class OrderController {

    def index() { }
    
    //订单列表
    def companyOrderList(){
        render(view: "/company/order/orderList")
    }
    
    def companyOrderDetail(){
        render(view: "/company/order/orderDetail")
    }
}
