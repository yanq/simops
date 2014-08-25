
<%@ page import="ops.command.FileCommand" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'fileCommand.label', default: 'FileCommand')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-fileCommand" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-fileCommand" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list fileCommand">
			
				<g:if test="${fileCommandInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="fileCommand.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${fileCommandInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fileCommandInstance?.createAt}">
				<li class="fieldcontain">
					<span id="createAt-label" class="property-label"><g:message code="fileCommand.createAt.label" default="Create At" /></span>
					
						<span class="property-value" aria-labelledby="createAt-label"><g:formatDate date="${fileCommandInstance?.createAt}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${fileCommandInstance?.updateAt}">
				<li class="fieldcontain">
					<span id="updateAt-label" class="property-label"><g:message code="fileCommand.updateAt.label" default="Update At" /></span>
					
						<span class="property-value" aria-labelledby="updateAt-label"><g:formatDate date="${fileCommandInstance?.updateAt}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${fileCommandInstance?.direction}">
				<li class="fieldcontain">
					<span id="direction-label" class="property-label"><g:message code="fileCommand.direction.label" default="Direction" /></span>
					
						<span class="property-value" aria-labelledby="direction-label"><g:fieldValue bean="${fileCommandInstance}" field="direction"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fileCommandInstance?.file}">
				<li class="fieldcontain">
					<span id="file-label" class="property-label"><g:message code="fileCommand.file.label" default="File" /></span>
					
						<span class="property-value" aria-labelledby="file-label"><g:fieldValue bean="${fileCommandInstance}" field="file"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fileCommandInstance?.toDir}">
				<li class="fieldcontain">
					<span id="toDir-label" class="property-label"><g:message code="fileCommand.toDir.label" default="To Dir" /></span>
					
						<span class="property-value" aria-labelledby="toDir-label"><g:fieldValue bean="${fileCommandInstance}" field="toDir"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:fileCommandInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${fileCommandInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
