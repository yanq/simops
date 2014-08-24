
<%@ page import="ops.Server" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'server.label', default: 'Server')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-server" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-server" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list server">
			
				<g:if test="${serverInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="server.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${serverInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serverInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="server.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${serverInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serverInstance?.userName}">
				<li class="fieldcontain">
					<span id="userName-label" class="property-label"><g:message code="server.userName.label" default="User Name" /></span>
					
						<span class="property-value" aria-labelledby="userName-label"><g:fieldValue bean="${serverInstance}" field="userName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serverInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="server.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${serverInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serverInstance?.createAt}">
				<li class="fieldcontain">
					<span id="createAt-label" class="property-label"><g:message code="server.createAt.label" default="Create At" /></span>
					
						<span class="property-value" aria-labelledby="createAt-label"><g:formatDate date="${serverInstance?.createAt}" /></span>
					
				</li>
				</g:if>

                <li class="fieldcontain">
                    <span id="createAt-labe" class="property-label">command</span>

                    <span class="property-value" aria-labelledby="createAt-label">
                        <g:each in="${ops.command.ExeCommand.list()}">
                            <g:link action="exe" params="['server.id':serverInstance.id,'command.id':it.id]" >${it}</g:link>
                        </g:each>
                    </span>

                </li>
			
			</ol>
			<g:form url="[resource:serverInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${serverInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
