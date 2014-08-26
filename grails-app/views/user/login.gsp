<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'account.label', default: 'Account')}" />
		<title>Login</title>
	</head>
	<body>
		<div id="create-account" class="content scaffold-create" role="main">
			<h1>Login</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

			<g:form url="[action:'login']" >
				<fieldset class="form">

                    <div class="fieldcontain  required">
                        <label for="nickName">
                            <g:message code="account.nickName.label" default="Nick Name" />
                            <span class="required-indicator">*</span>
                        </label>
                        <g:textField name="nickName" maxlength="20" required="" value="${params?.nickName}"/>

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
					<g:submitButton name="create" class="save" value="Login" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
