<%@ page import="ops.command.ExeCommand" %>



<div class="fieldcontain ${hasErrors(bean: exeCommandInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="exeCommand.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" maxlength="100" required="" value="${exeCommandInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: exeCommandInstance, field: 'createAt', 'error')} required">
	<label for="createAt">
		<g:message code="exeCommand.createAt.label" default="Create At" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createAt" precision="day"  value="${exeCommandInstance?.createAt}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: exeCommandInstance, field: 'updateAt', 'error')} required">
	<label for="updateAt">
		<g:message code="exeCommand.updateAt.label" default="Update At" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="updateAt" precision="day"  value="${exeCommandInstance?.updateAt}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: exeCommandInstance, field: 'command', 'error')} required">
	<label for="command">
		<g:message code="exeCommand.command.label" default="Command" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="command" cols="40" rows="5" maxlength="2000" required="" value="${exeCommandInstance?.command}"/>

</div>

