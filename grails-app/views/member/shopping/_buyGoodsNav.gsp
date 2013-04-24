<div class="row-fluid">
  <div id="legend" class="span11">
    <ul class="breadcrumb">

	    
       <buyGoodsNav:buyGoodsNav /> 
	    
      <li >
        <a href="#">蔬菜</a>
        <span class="divider">/</span>
      </li>
      <li >
        <a href="#">葱蒜类</a>
        <span class="divider">/</span>
      </li>
      <li >
        <a href="#">农科院蔬菜礼盒10样装</a>
      </li>

    </ul>

  </div>


  <div id="legend" class="span1">
    <ul id="cart" class="breadcrumb">
      <li class="cart-li">
        <a href="#"><i class="icon-shopping-cart"></i></a>
        <ul class="nav nav-tabs nav-stacked cart-ul">
          <li>
            <a href="#">
              <div >普装南汇甜瓜，甜脆可口</div>
              <div >￥100×1<i style="float:right;" class="icon-remove"></i></div>

            </a>
          </li>
          <li>
            <a href="#"> 
              <div >润庄大米</div>
              <div >￥100×2<i style="float:right;" class="icon-remove"></i></div>
            </a>
          </li>
          <li>
            <a href="#"> 
              <div >农科院蔬菜礼盒10样装</div>
              <div >￥100×1<i style="float:right;" class="icon-remove"></i></div>
            </a>
          </li>
          <li >
            <a href="#"> 
              <strong>去购物车结算</strong>
            </a>
          </li>
        </ul>
      </li>
    </ul>

  </div>

</div>

<style>

    .cart-li{
      position: relative;
    }

    .cart-ul{
      width:250px;  
      position:absolute; 
      display: block;
      left: -220px;
      top:28px;
      z-index: 1000;
      display: none;
    }

    .cart-ul li{
      background-color:#f5f5f5;
    }
  </style>
    <script>
    $(document).ready(function(){
        $('#cart').hover(
              function(){$(this).find('ul').show();},
              function(){$(this).find('ul').hide();}
)
});
</script>