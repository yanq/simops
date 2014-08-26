<%@ page import="ops.project.Task" %>



<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'project', 'error')} required">
	<label for="project">
		<g:message code="task.project.label" default="Project" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="project" name="project.id" from="${ops.project.Project.list()}" optionKey="id" required="" value="${taskInstance?.project?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="task.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" maxlength="100" required="" value="${taskInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="task.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="1000" required="" value="${taskInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'commands', 'error')} ">
	<label for="commands">
		<g:message code="task.commands.label" default="Commands" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${taskInstance?.commands?}" var="c">
    <li><g:link controller="command" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="command" action="create" params="['task.id': taskInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'command.label', default: 'Command')])}</g:link>
</li>
</ul>


</div>

