<div class="span3 bs-docs-sidebar">
  <ul class="nav nav-tabs nav-stacked root" >
  </ul>
</div>

<style>

  .span4{
    margin-top: 10px; 
    padding: 10px;
    border: 1px solid rgba(0,0,0,0.2);
    -webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.1);
    -moz-box-shadow: 0 1px 3px rgba(0,0,0,0.1);
    box-shadow: 0 1px 3px rgba(0,0,0,0.1);
  }
  .cat-li{
    background-color:#f5f5f5;
    position: relative;
  }
  .cat-ul{
    width:231px;  
    position:absolute; 
    display: block;
    left: 230px;
    top:0px;
    z-index: 1000;
    display: none;
  }

</style>

<script>
    $(document).ready(function(){
      
      var ctree = jQuery.parseJSON('<category:categoryNav/>')
      $.each(ctree,function(i,v){
        if(v.pId==1){
          var li = '<li class="cat-li" id="'+v.id+'" ><a href="#">'
                  + v.name + '</a></li>'
          $(".root").append(li)
        }else{
          var p = $("#"+v.pId)
          
          if(p.find("ul").length>0){
            var li = '<li class="cat-li" id="'+v.id+'" ><a href="#">'
                  + v.name + '</a></li>'
            p.find("ul").append(li)
          }
          else{
            var li = '<ul class="nav nav-tabs nav-stacked cat-ul" ><li class="cat-li" id="'+v.id+'" ><a href="#">'
                  + v.name + '</a></li></ul>'
            p.append(li)
          }
        }
      })
      
      
      $('.cat-li').hover(
              function(){$(this).children('ul').show();},
              function(){$(this).children('ul').hide();}
)
});
</script>