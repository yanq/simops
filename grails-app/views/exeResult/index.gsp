
<%@ page import="ops.ExeResult" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'exeResult.label', default: 'ExeResult')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-exeResult" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-exeResult" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="exeResult.execute.label" default="Execute" /></th>
					
						<g:sortableColumn property="command" title="${message(code: 'exeResult.command.label', default: 'Command')}" />
					
						<g:sortableColumn property="result" title="${message(code: 'exeResult.result.label', default: 'Result')}" />
					
						<g:sortableColumn property="createAt" title="${message(code: 'exeResult.createAt.label', default: 'Create At')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${exeResultInstanceList}" status="i" var="exeResultInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${exeResultInstance.id}">${fieldValue(bean: exeResultInstance, field: "execute")}</g:link></td>
					
						<td>${fieldValue(bean: exeResultInstance, field: "command")}</td>
					
						<td>${fieldValue(bean: exeResultInstance, field: "result")}</td>
					
						<td><g:formatDate date="${exeResultInstance.createAt}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${exeResultInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
