
<%@ page import="supply.Stock" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'stock.label', default: 'Stock')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-stock" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-stock" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list stock">
			
				<g:if test="${stockInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="stock.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${stockInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${stockInstance?.goods_id}">
				<li class="fieldcontain">
					<span id="goods_id-label" class="property-label"><g:message code="stock.goods_id.label" default="Goodsid" /></span>
					
						<span class="property-value" aria-labelledby="goods_id-label"><g:fieldValue bean="${stockInstance}" field="goods_id"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stockInstance?.goods_name}">
				<li class="fieldcontain">
					<span id="goods_name-label" class="property-label"><g:message code="stock.goods_name.label" default="Goodsname" /></span>
					
						<span class="property-value" aria-labelledby="goods_name-label"><g:fieldValue bean="${stockInstance}" field="goods_name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stockInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="stock.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${stockInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${stockInstance?.num}">
				<li class="fieldcontain">
					<span id="num-label" class="property-label"><g:message code="stock.num.label" default="Num" /></span>
					
						<span class="property-value" aria-labelledby="num-label"><g:fieldValue bean="${stockInstance}" field="num"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stockInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="stock.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${stockInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stockInstance?.store_id}">
				<li class="fieldcontain">
					<span id="store_id-label" class="property-label"><g:message code="stock.store_id.label" default="Storeid" /></span>
					
						<span class="property-value" aria-labelledby="store_id-label"><g:fieldValue bean="${stockInstance}" field="store_id"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${stockInstance?.id}" />
					<g:link class="edit" action="edit" id="${stockInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
