
<%@ page import="ops.Execute" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'execute.label', default: 'Execute')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-execute" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-execute" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list execute">
			
				<g:if test="${executeInstance?.command}">
				<li class="fieldcontain">
					<span id="command-label" class="property-label"><g:message code="execute.command.label" default="Command" /></span>
					
						<span class="property-value" aria-labelledby="command-label"><g:link controller="command" action="show" id="${executeInstance?.command?.id}">${executeInstance?.command?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${executeInstance?.server}">
				<li class="fieldcontain">
					<span id="server-label" class="property-label"><g:message code="execute.server.label" default="Server" /></span>
					
						<span class="property-value" aria-labelledby="server-label"><g:link controller="server" action="show" id="${executeInstance?.server?.id}">${executeInstance?.server?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${executeInstance?.createAt}">
				<li class="fieldcontain">
					<span id="createAt-label" class="property-label"><g:message code="execute.createAt.label" default="Create At" /></span>
					
						<span class="property-value" aria-labelledby="createAt-label"><g:formatDate date="${executeInstance?.createAt}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${executeInstance?.exeResults}">
				<li class="fieldcontain">
					<span id="exeResults-label" class="property-label"><g:message code="execute.exeResults.label" default="Exe Results" /></span>
					
						<g:each in="${executeInstance.exeResults}" var="e">
						<span class="property-value" aria-labelledby="exeResults-label"><g:link controller="exeResult" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:executeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${executeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
