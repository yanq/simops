<%@ page import="ops.command.FileCommand" %>



<div class="fieldcontain ${hasErrors(bean: fileCommandInstance, field: 'task', 'error')} ">
	<label for="task">
		<g:message code="fileCommand.task.label" default="Task" />
		
	</label>
	<g:select id="task" name="task.id" from="${ops.project.Task.list()}" optionKey="id" value="${fileCommandInstance?.task?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: fileCommandInstance, field: 'indexId', 'error')} required">
	<label for="indexId">
		<g:message code="fileCommand.indexId.label" default="Index Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="indexId" type="number" value="${fileCommandInstance.indexId}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: fileCommandInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="fileCommand.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" maxlength="100" required="" value="${fileCommandInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: fileCommandInstance, field: 'createAt', 'error')} required">
	<label for="createAt">
		<g:message code="fileCommand.createAt.label" default="Create At" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createAt" precision="day"  value="${fileCommandInstance?.createAt}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: fileCommandInstance, field: 'updateAt', 'error')} required">
	<label for="updateAt">
		<g:message code="fileCommand.updateAt.label" default="Update At" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="updateAt" precision="day"  value="${fileCommandInstance?.updateAt}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: fileCommandInstance, field: 'direction', 'error')} required">
	<label for="direction">
		<g:message code="fileCommand.direction.label" default="Direction" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="direction" from="${fileCommandInstance.constraints.direction.inList}" required="" value="${fileCommandInstance?.direction}" valueMessagePrefix="fileCommand.direction"/>

</div>

<div class="fieldcontain ${hasErrors(bean: fileCommandInstance, field: 'file', 'error')} required">
	<label for="file">
		<g:message code="fileCommand.file.label" default="File" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="file" maxlength="200" required="" value="${fileCommandInstance?.file}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: fileCommandInstance, field: 'toDir', 'error')} required">
	<label for="toDir">
		<g:message code="fileCommand.toDir.label" default="To Dir" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="toDir" maxlength="200" required="" value="${fileCommandInstance?.toDir}"/>

</div>

