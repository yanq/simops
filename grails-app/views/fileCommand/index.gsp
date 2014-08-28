
<%@ page import="ops.command.FileCommand" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'fileCommand.label', default: 'FileCommand')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-fileCommand" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-fileCommand" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="fileCommand.task.label" default="Task" /></th>
					
						<g:sortableColumn property="indexId" title="${message(code: 'fileCommand.indexId.label', default: 'Index Id')}" />
					
						<g:sortableColumn property="title" title="${message(code: 'fileCommand.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'fileCommand.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'fileCommand.lastUpdated.label', default: 'Last Updated')}" />
					
						<g:sortableColumn property="direction" title="${message(code: 'fileCommand.direction.label', default: 'Direction')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${fileCommandInstanceList}" status="i" var="fileCommandInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${fileCommandInstance.id}">${fieldValue(bean: fileCommandInstance, field: "task")}</g:link></td>
					
						<td>${fieldValue(bean: fileCommandInstance, field: "indexId")}</td>
					
						<td>${fieldValue(bean: fileCommandInstance, field: "title")}</td>
					
						<td><g:formatDate date="${fileCommandInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${fileCommandInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: fileCommandInstance, field: "direction")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${fileCommandInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
