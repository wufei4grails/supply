package supply

class TranLog {

    static constraints = {
    }
    
	String store_id
	String type;//1:收入0：支出
	String tran_text;//
	BigDecimal price;
	Date dateCreated
	Date lastUpdated
}
