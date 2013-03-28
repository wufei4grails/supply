package supply

class GoodsCategory {

    static constraints = {
    }
    
    
    String name 
    Date dateCreated
    Date lastUpdated
  
    static hasMany = [children:GoodsCategory]  
    static belongsTo = [parent: GoodsCategory]  
  
    static transients = ['allChildren']  
  
    def getAllChildren(){  
        children ? children + children*.allChildren.flatten() : [] 
    }  
}
