
<%@ page import="supply.Menu" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'menu.label', default: 'Menu')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-menu" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-menu" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list menu">
			
				<g:if test="${menuInstance?.menutype}">
				<li class="fieldcontain">
					<span id="menutype-label" class="property-label"><g:message code="menu.menutype.label" default="Menutype" /></span>
					
						<span class="property-value" aria-labelledby="menutype-label"><g:fieldValue bean="${menuInstance}" field="menutype"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${menuInstance?.menuid}">
				<li class="fieldcontain">
					<span id="menuid-label" class="property-label"><g:message code="menu.menuid.label" default="Menuid" /></span>
					
						<span class="property-value" aria-labelledby="menuid-label"><g:fieldValue bean="${menuInstance}" field="menuid"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${menuInstance?.menuname}">
				<li class="fieldcontain">
					<span id="menuname-label" class="property-label"><g:message code="menu.menuname.label" default="Menuname" /></span>
					
						<span class="property-value" aria-labelledby="menuname-label"><g:fieldValue bean="${menuInstance}" field="menuname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${menuInstance?.menupath}">
				<li class="fieldcontain">
					<span id="menupath-label" class="property-label"><g:message code="menu.menupath.label" default="Menupath" /></span>
					
						<span class="property-value" aria-labelledby="menupath-label"><g:fieldValue bean="${menuInstance}" field="menupath"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${menuInstance?.sort}">
				<li class="fieldcontain">
					<span id="sort-label" class="property-label"><g:message code="menu.sort.label" default="Sort" /></span>
					
						<span class="property-value" aria-labelledby="sort-label"><g:fieldValue bean="${menuInstance}" field="sort"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${menuInstance?.id}" />
					<g:link class="edit" action="edit" id="${menuInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
