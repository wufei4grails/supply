
<%@ page import="supply.Stock" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'stock.label', default: 'Stock')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-stock" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-stock" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'stock.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="goods_id" title="${message(code: 'stock.goods_id.label', default: 'Goodsid')}" />
					
						<g:sortableColumn property="goods_name" title="${message(code: 'stock.goods_name.label', default: 'Goodsname')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'stock.lastUpdated.label', default: 'Last Updated')}" />
					
						<g:sortableColumn property="num" title="${message(code: 'stock.num.label', default: 'Num')}" />
					
						<g:sortableColumn property="price" title="${message(code: 'stock.price.label', default: 'Price')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${stockInstanceList}" status="i" var="stockInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${stockInstance.id}">${fieldValue(bean: stockInstance, field: "dateCreated")}</g:link></td>
					
						<td>${fieldValue(bean: stockInstance, field: "goods_id")}</td>
					
						<td>${fieldValue(bean: stockInstance, field: "goods_name")}</td>
					
						<td><g:formatDate date="${stockInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: stockInstance, field: "num")}</td>
					
						<td>${fieldValue(bean: stockInstance, field: "price")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${stockInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
