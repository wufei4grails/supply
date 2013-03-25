
<%@ page import="supply.Menu" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'menu.label', default: 'Menu')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-menu" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-menu" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="menutype" title="${message(code: 'menu.menutype.label', default: 'Menutype')}" />
					
						<g:sortableColumn property="menuid" title="${message(code: 'menu.menuid.label', default: 'Menuid')}" />
					
						<g:sortableColumn property="menuname" title="${message(code: 'menu.menuname.label', default: 'Menuname')}" />
					
						<g:sortableColumn property="menupath" title="${message(code: 'menu.menupath.label', default: 'Menupath')}" />
					
						<g:sortableColumn property="sort" title="${message(code: 'menu.sort.label', default: 'Sort')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${menuInstanceList}" status="i" var="menuInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${menuInstance.id}">${fieldValue(bean: menuInstance, field: "menutype")}</g:link></td>
					
						<td>${fieldValue(bean: menuInstance, field: "menuid")}</td>
					
						<td>${fieldValue(bean: menuInstance, field: "menuname")}</td>
					
						<td>${fieldValue(bean: menuInstance, field: "menupath")}</td>
					
						<td>${fieldValue(bean: menuInstance, field: "sort")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${menuInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
