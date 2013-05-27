<%@ page import="supply.ShippingLog" %>



<div class="fieldcontain ${hasErrors(bean: shippingLogInstance, field: 'operuser', 'error')} ">
	<label for="operuser">
		<g:message code="shippingLog.operuser.label" default="Operuser" />
		
	</label>
	<g:textField name="operuser" value="${shippingLogInstance?.operuser}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: shippingLogInstance, field: 'order_id', 'error')} required">
	<label for="order_id">
		<g:message code="shippingLog.order_id.label" default="Orderid" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="order_id" type="number" value="${shippingLogInstance.order_id}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: shippingLogInstance, field: 'remark', 'error')} ">
	<label for="remark">
		<g:message code="shippingLog.remark.label" default="Remark" />
		
	</label>
	<g:textField name="remark" value="${shippingLogInstance?.remark}"/>
</div>

