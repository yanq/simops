
<%@ page import="ops.ExeResult" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'exeResult.label', default: 'ExeResult')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-exeResult" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-exeResult" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list exeResult">
			
				<g:if test="${exeResultInstance?.execute}">
				<li class="fieldcontain">
					<span id="execute-label" class="property-label"><g:message code="exeResult.execute.label" default="Execute" /></span>
					
						<span class="property-value" aria-labelledby="execute-label"><g:link controller="execute" action="show" id="${exeResultInstance?.execute?.id}">${exeResultInstance?.execute?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${exeResultInstance?.command}">
				<li class="fieldcontain">
					<span id="command-label" class="property-label"><g:message code="exeResult.command.label" default="Command" /></span>
					
						<span class="property-value" aria-labelledby="command-label"><g:fieldValue bean="${exeResultInstance}" field="command"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${exeResultInstance?.result}">
				<li class="fieldcontain">
					<span id="result-label" class="property-label"><g:message code="exeResult.result.label" default="Result" /></span>
					
						<span class="property-value" aria-labelledby="result-label"><g:fieldValue bean="${exeResultInstance}" field="result"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${exeResultInstance?.createAt}">
				<li class="fieldcontain">
					<span id="createAt-label" class="property-label"><g:message code="exeResult.createAt.label" default="Create At" /></span>
					
						<span class="property-value" aria-labelledby="createAt-label"><g:formatDate date="${exeResultInstance?.createAt}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:exeResultInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${exeResultInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
