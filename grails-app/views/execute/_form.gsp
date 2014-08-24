<%@ page import="ops.Execute" %>



<div class="fieldcontain ${hasErrors(bean: executeInstance, field: 'command', 'error')} required">
	<label for="command">
		<g:message code="execute.command.label" default="Command" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="command" name="command.id" from="${ops.command.Command.list()}" optionKey="id" required="" value="${executeInstance?.command?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: executeInstance, field: 'server', 'error')} required">
	<label for="server">
		<g:message code="execute.server.label" default="Server" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="server" name="server.id" from="${ops.Server.list()}" optionKey="id" required="" value="${executeInstance?.server?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: executeInstance, field: 'createAt', 'error')} required">
	<label for="createAt">
		<g:message code="execute.createAt.label" default="Create At" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createAt" precision="day"  value="${executeInstance?.createAt}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: executeInstance, field: 'exeResults', 'error')} ">
	<label for="exeResults">
		<g:message code="execute.exeResults.label" default="Exe Results" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${executeInstance?.exeResults?}" var="e">
    <li><g:link controller="exeResult" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="exeResult" action="create" params="['execute.id': executeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'exeResult.label', default: 'ExeResult')])}</g:link>
</li>
</ul>


</div>
