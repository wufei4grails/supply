package supply

class GoodsCategory implements Comparable{

    static constraints = {
    }
    
    int compareTo(obj) {
       dateCreated.compareTo(obj.dateCreated)
   }
    
    SortedSet children
    GoodsCategory parent
    
    String name 
    Date dateCreated
    Date lastUpdated
  
    static hasMany = [children:GoodsCategory]  
    static belongsTo = [parent: GoodsCategory]  
  
    static transients = ['allChildren','allParent']  
  
    def getAllChildren(){  
        children ? children + children*.allChildren.flatten() : [] 
    }  
    
    def getAllParent(){
        parent ? parent.flattent():[]
    }
}
