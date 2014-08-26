<%@ page import="account.Account" %>



<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'nickName', 'error')} required">
	<label for="nickName">
		<g:message code="account.nickName.label" default="Nick Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nickName" maxlength="20" required="" value="${accountInstance?.nickName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="account.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" maxlength="32" required="" value="${accountInstance?.password}"/>

</div>

