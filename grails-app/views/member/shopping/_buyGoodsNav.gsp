<div class="row-fluid">
	<div id="legend" class="span11">
		<ul class="breadcrumb">
			<buyGoodsNav:buyGoodsNav /> 

		</ul>

	</div>


	<div id="legend" class="span1">
		<ul id="cart" class="breadcrumb">
			<li class="cart-li">
				<a href="#"><i class="icon-shopping-cart"></i></a>
				<ul class="nav nav-tabs nav-stacked cart-ul">

					<cart:cartlist /> 

					<li >
						<g:link controller="shopping" action="gotoCart"><strong>去购物车结算</strong></g:link>
					</li>
				</ul>
			</li>
		</ul>

	</div>
<g:formRemote id="removeGoods" name="removeGoods" on404="alert('not found!')" update="" onSuccess="removeGoodsSuccess(data)"
	url="[controller: 'shopping', action:'removeGoods']">
	    <g:hiddenField id="id" name="id" value="" />
	</g:formRemote>
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
	
	function removeGoodsSuccess(data){
		window.top.location.reload()
	}
	
	function removeGoods(o,id){
		if(confirm("是否从购物车中删除?")){
			jQuery("#removeGoods").find("#id").val(id)
			jQuery("#removeGoods").submit()
	        }else {
			return false;
		} 
	}
	
jQuery(document).ready(function(){
    jQuery('#cart').hover(
	  function(){jQuery(this).find('ul').show();},
	  function(){jQuery(this).find('ul').hide();}
)
});
</script>