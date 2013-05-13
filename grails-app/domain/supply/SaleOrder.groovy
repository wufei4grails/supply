/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package supply

/**
 *
 * @author wufei
 */
class SaleOrder {
	static constraints = {
		company_id(blank:true,nullable:true)
		status(blank:true,nullable:true)
	}
    
	static hasMany = [ saleOrderGoods : SaleOrderGoods ]
	
	String company_id;//企业id
	String store_id;//门店id
	String order_sn;
	String amount;
	String status;//waitpay,waitship,waitconfirm,success,notpayclose,notshipclose
	Date dateCreated
	Date lastUpdated
}

