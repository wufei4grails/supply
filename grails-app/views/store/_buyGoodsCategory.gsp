<div class="span3 bs-docs-sidebar">
  <ul class="nav nav-tabs nav-stacked" >
    <li class="cat-li" >
      <a href="#">水果</a>
      <ul class="nav nav-tabs nav-stacked cat-ul" >
        <li class="cat-li"><a href="#">瓜类</a></li>
        <li class="cat-li"><a href="#">仁果类</a></li>
        <li class="cat-li"><a href="#">浆果类</a></li>
      </ul>
    </li>
    <li class="cat-li" ><a href="#">蔬菜</a>
      <ul class="nav nav-tabs nav-stacked cat-ul" >
        <li class="cat-li">
          <a href="#">根菜类</a>
          <ul class="nav nav-tabs nav-stacked cat-ul" >
            <li class="cat-li"><a href="#">胡萝卜</a></li>
            <li class="cat-li"><a href="#">大头菜</a></li>
            <li class="cat-li"><a href="#">根用甜菜</a>
            </li>
          </ul>
        </li>
        <li class="cat-li"><a href="#">绿叶蔬菜</a></li>
        <li class="cat-li">
          <a href="#">葱蒜类</a>
          <ul class="nav nav-tabs nav-stacked cat-ul" >
            <li class="cat-li"><a href="#">洋葱</a></li>
            <li class="cat-li"><a href="#">大蒜</a></li>
          </ul>
        </li>
      </ul>
    </li>
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
      $('.cat-li').hover(
              function(){$(this).children('ul').show();},
              function(){$(this).children('ul').hide();}
)
});
</script>