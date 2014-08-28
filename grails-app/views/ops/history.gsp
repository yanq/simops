
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
			<g:render template="nav"/>
		</div>
		<div id="list-execute" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

            <g:each in="${executeInstanceList}" status="i" var="executeInstance">
                <div class="executeShow"><g:render template="exeResult" model="[execute:executeInstance]"/></div>
            </g:each>

            <div class="pagination">
                <g:paginate total="${executeInstanceCount ?: 0}" />
            </div>
		</div>
	</body>
</html>
