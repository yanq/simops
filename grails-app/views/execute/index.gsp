
<%@ page import="ops.Execute" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'execute.label', default: 'Execute')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-execute" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-execute" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="execute.account.label" default="Account" /></th>
					
						<th><g:message code="execute.task.label" default="Task" /></th>
					
						<th><g:message code="execute.command.label" default="Command" /></th>
					
						<th><g:message code="execute.server.label" default="Server" /></th>
					
						<g:sortableColumn property="createAt" title="${message(code: 'execute.createAt.label', default: 'Create At')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${executeInstanceList}" status="i" var="executeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${executeInstance.id}">${fieldValue(bean: executeInstance, field: "account")}</g:link></td>
					
						<td>${fieldValue(bean: executeInstance, field: "task")}</td>
					
						<td>${fieldValue(bean: executeInstance, field: "command")}</td>
					
						<td>${fieldValue(bean: executeInstance, field: "server")}</td>
					
						<td><g:formatDate date="${executeInstance.createAt}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${executeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
