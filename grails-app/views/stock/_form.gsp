<%@ page import="supply.Stock" %>



<div class="fieldcontain ${hasErrors(bean: stockInstance, field: 'goods_id', 'error')} ">
	<label for="goods_id">
		<g:message code="stock.goods_id.label" default="Goodsid" />
		
	</label>
	<g:textField name="goods_id" value="${stockInstance?.goods_id}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stockInstance, field: 'goods_name', 'error')} ">
	<label for="goods_name">
		<g:message code="stock.goods_name.label" default="Goodsname" />
		
	</label>
	<g:textField name="goods_name" value="${stockInstance?.goods_name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stockInstance, field: 'num', 'error')} required">
	<label for="num">
		<g:message code="stock.num.label" default="Num" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="num" type="number" value="${stockInstance.num}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: stockInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="stock.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" value="${fieldValue(bean: stockInstance, field: 'price')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: stockInstance, field: 'store_id', 'error')} ">
	<label for="store_id">
		<g:message code="stock.store_id.label" default="Storeid" />
		
	</label>
	<g:textField name="store_id" value="${stockInstance?.store_id}"/>
</div>

