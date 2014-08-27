<ul>
    <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
    <li><g:link class="${actionName=='project'?'current':''}" controller="ops" action="project"><g:message code="project.label" default="Project" /></g:link></li>
    <li><g:link class="${actionName=='server'?'current':''}" controller="ops" action="server"><g:message code="server.label" default="Server" /></g:link></li>
    <li><g:link class="${actionName=='history'?'current':''}" controller="ops" action="history"><g:message code="history.label" default="History" /></g:link></li>
    <li><g:link class="${actionName=='admin'?'current':''}" controller="admin"><g:message code="admin.label" default="admin" /></g:link></li>
</ul>