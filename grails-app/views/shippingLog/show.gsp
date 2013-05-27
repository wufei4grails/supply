
<%@ page import="supply.ShippingLog" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'shippingLog.label', default: 'ShippingLog')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-shippingLog" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-shippingLog" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list shippingLog">
			
				<g:if test="${shippingLogInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="shippingLog.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${shippingLogInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${shippingLogInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="shippingLog.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${shippingLogInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${shippingLogInstance?.operuser}">
				<li class="fieldcontain">
					<span id="operuser-label" class="property-label"><g:message code="shippingLog.operuser.label" default="Operuser" /></span>
					
						<span class="property-value" aria-labelledby="operuser-label"><g:fieldValue bean="${shippingLogInstance}" field="operuser"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${shippingLogInstance?.order_id}">
				<li class="fieldcontain">
					<span id="order_id-label" class="property-label"><g:message code="shippingLog.order_id.label" default="Orderid" /></span>
					
						<span class="property-value" aria-labelledby="order_id-label"><g:fieldValue bean="${shippingLogInstance}" field="order_id"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${shippingLogInstance?.remark}">
				<li class="fieldcontain">
					<span id="remark-label" class="property-label"><g:message code="shippingLog.remark.label" default="Remark" /></span>
					
						<span class="property-value" aria-labelledby="remark-label"><g:fieldValue bean="${shippingLogInstance}" field="remark"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${shippingLogInstance?.id}" />
					<g:link class="edit" action="edit" id="${shippingLogInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
