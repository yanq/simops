<%@ page import="ops.ExeResult" %>



<div class="fieldcontain ${hasErrors(bean: exeResultInstance, field: 'result', 'error')} required">
	<label for="result">
		<g:message code="exeResult.result.label" default="Result" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="result" cols="40" rows="5" maxlength="10000" required="" value="${exeResultInstance?.result}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: exeResultInstance, field: 'execute', 'error')} required">
	<label for="execute">
		<g:message code="exeResult.execute.label" default="Execute" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="execute" name="execute.id" from="${ops.Execute.list()}" optionKey="id" required="" value="${exeResultInstance?.execute?.id}" class="many-to-one"/>

</div>

