package supply

class TranLog {

    static constraints = {
    }
    
	String type;//1:收入0：支出
	String tran_text;//
	BigDecimal price;
	Date dateCreated
	Date lastUpdated
}
