
<%@ page import="ops.command.ExeCommand" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'exeCommand.label', default: 'ExeCommand')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-exeCommand" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-exeCommand" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list exeCommand">
			
				<g:if test="${exeCommandInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="exeCommand.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${exeCommandInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${exeCommandInstance?.createAt}">
				<li class="fieldcontain">
					<span id="createAt-label" class="property-label"><g:message code="exeCommand.createAt.label" default="Create At" /></span>
					
						<span class="property-value" aria-labelledby="createAt-label"><g:formatDate date="${exeCommandInstance?.createAt}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${exeCommandInstance?.updateAt}">
				<li class="fieldcontain">
					<span id="updateAt-label" class="property-label"><g:message code="exeCommand.updateAt.label" default="Update At" /></span>
					
						<span class="property-value" aria-labelledby="updateAt-label"><g:formatDate date="${exeCommandInstance?.updateAt}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${exeCommandInstance?.command}">
				<li class="fieldcontain">
					<span id="command-label" class="property-label"><g:message code="exeCommand.command.label" default="Command" /></span>
					
						<span class="property-value" aria-labelledby="command-label"><g:fieldValue bean="${exeCommandInstance}" field="command"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:exeCommandInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${exeCommandInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
