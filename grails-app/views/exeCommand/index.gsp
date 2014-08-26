
<%@ page import="ops.command.ExeCommand" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'exeCommand.label', default: 'ExeCommand')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-exeCommand" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-exeCommand" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="exeCommand.task.label" default="Task" /></th>
					
						<g:sortableColumn property="indexId" title="${message(code: 'exeCommand.indexId.label', default: 'Index Id')}" />
					
						<g:sortableColumn property="title" title="${message(code: 'exeCommand.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="createAt" title="${message(code: 'exeCommand.createAt.label', default: 'Create At')}" />
					
						<g:sortableColumn property="updateAt" title="${message(code: 'exeCommand.updateAt.label', default: 'Update At')}" />
					
						<g:sortableColumn property="command" title="${message(code: 'exeCommand.command.label', default: 'Command')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${exeCommandInstanceList}" status="i" var="exeCommandInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${exeCommandInstance.id}">${fieldValue(bean: exeCommandInstance, field: "task")}</g:link></td>
					
						<td>${fieldValue(bean: exeCommandInstance, field: "indexId")}</td>
					
						<td>${fieldValue(bean: exeCommandInstance, field: "title")}</td>
					
						<td><g:formatDate date="${exeCommandInstance.createAt}" /></td>
					
						<td><g:formatDate date="${exeCommandInstance.updateAt}" /></td>
					
						<td>${fieldValue(bean: exeCommandInstance, field: "command")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${exeCommandInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
