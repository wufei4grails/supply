<%@ page import="supply.Menu" %>



<div class="fieldcontain ${hasErrors(bean: menuInstance, field: 'menutype', 'error')} ">
	<label for="menutype">
		<g:message code="menu.menutype.label" default="Menutype" />
		
	</label>
	<g:select name="menutype" from="${menuInstance.constraints.menutype.inList}" value="${menuInstance?.menutype}" valueMessagePrefix="menu.menutype" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: menuInstance, field: 'menuid', 'error')} ">
	<label for="menuid">
		<g:message code="menu.menuid.label" default="Menuid" />
		
	</label>
	<g:textField name="menuid" value="${menuInstance?.menuid}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: menuInstance, field: 'menuname', 'error')} ">
	<label for="menuname">
		<g:message code="menu.menuname.label" default="Menuname" />
		
	</label>
	<g:textField name="menuname" value="${menuInstance?.menuname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: menuInstance, field: 'menupath', 'error')} ">
	<label for="menupath">
		<g:message code="menu.menupath.label" default="Menupath" />
		
	</label>
	<g:textField name="menupath" value="${menuInstance?.menupath}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: menuInstance, field: 'sort', 'error')} ">
	<label for="sort">
		<g:message code="menu.sort.label" default="Sort" />
		
	</label>
	<g:textField name="sort" value="${menuInstance?.sort}"/>
</div>

