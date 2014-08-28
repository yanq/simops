<%@ page import="ops.project.Project" %>



<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="project.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" maxlength="100" required="" value="${projectInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="project.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="1000" required="" value="${projectInstance?.description}"/>

</div>
<g:if test="${actionName=='edit'}">
    <div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'tasks', 'error')} ">
        <label for="tasks">
            <g:message code="project.tasks.label" default="Tasks" />

        </label>

        <ul class="one-to-many">
            <g:each in="${projectInstance?.tasks?}" var="t">
                <li><g:link controller="task" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
            </g:each>
            <li class="add">
                <g:link controller="task" action="create" params="['project.id': projectInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'task.label', default: 'Task')])}</g:link>
            </li>
        </ul>
    </div>
</g:if>

