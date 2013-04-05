package supply

class GoodsCategory implements Comparable{

    static constraints = {
    }
    
    int compareTo(obj) {
       dateCreated.compareTo(obj.dateCreated)
   }
    
    SortedSet children   
    
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