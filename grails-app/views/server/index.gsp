
<%@ page import="ops.Server" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'server.label', default: 'Server')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-server" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-server" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="title" title="${message(code: 'server.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'server.address.label', default: 'Address')}" />
					
						<g:sortableColumn property="userName" title="${message(code: 'server.userName.label', default: 'User Name')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'server.password.label', default: 'Password')}" />
					
						<g:sortableColumn property="createAt" title="${message(code: 'server.createAt.label', default: 'Create At')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${serverInstanceList}" status="i" var="serverInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${serverInstance.id}">${fieldValue(bean: serverInstance, field: "title")}</g:link></td>
					
						<td>${fieldValue(bean: serverInstance, field: "address")}</td>
					
						<td>${fieldValue(bean: serverInstance, field: "userName")}</td>
					
						<td>${fieldValue(bean: serverInstance, field: "password")}</td>
					
						<td><g:formatDate date="${serverInstance.createAt}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${serverInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
