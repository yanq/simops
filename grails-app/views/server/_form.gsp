<%@ page import="ops.Server" %>



<div class="fieldcontain ${hasErrors(bean: serverInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="server.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" maxlength="100" required="" value="${serverInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: serverInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="server.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" maxlength="100" required="" value="${serverInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: serverInstance, field: 'userName', 'error')} required">
	<label for="userName">
		<g:message code="server.userName.label" default="User Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="userName" maxlength="100" required="" value="${serverInstance?.userName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: serverInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="server.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="password" maxlength="100" required="" value="${serverInstance?.password}"/>

</div>

