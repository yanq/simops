<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'account.label', default: 'Account')}" />
		<title>Modify password</title>
	</head>
	<body>
		<div id="create-account" class="content scaffold-create" role="main">
			<h1>Modify Password</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
            <g:hasErrors bean="${accountInstance}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${accountInstance}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
			<g:form url="[action:'modify']" >
				<fieldset class="form">

                    <div class="fieldcontain  required">
                        <label for="nickName">
                            <g:message code="account.nickName.label" default="Nick Name" />
                            <span class="required-indicator">*</span>
                        </label>
                        ${session.user.nickName}

                    </div>

                    <div class="fieldcontain required">
                        <label for="password">
                            <g:message code="account.password.label" default="Password" />
                            <span class="required-indicator">*</span>
                        </label>
                        <g:passwordField  name="password" maxlength="32" required="" value=""/>
                    </div>
                </fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="Modify" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
