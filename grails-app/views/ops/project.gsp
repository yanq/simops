<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Project</title>
</head>
<body>
    <a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
    <div class="nav" role="navigation">
        <g:render template="nav"></g:render>
    </div>
    <div id="page-body" class="content" role="main">
       <div class="leftBox">
           <g:each in="${projects}">
              <div><g:link action="project" id="${it.id}">${it}</g:link></div>
           </g:each>
       </div>
       <div class="rightContent">
           <h1>${projectInstance}</h1>
           <div class="exeBox">
               <g:formRemote url="[action:'exe']"  name="exe" update="exeResult">
                   <g:hiddenField name="project.id" value="${projectInstance.id}"/>
                   <g:select id="task" name="task.id" from="${projectInstance.tasks}" optionKey="id" required="" value="" class="many-to-one"/>
                   <g:select id="server" name="server.id" from="${ops.Server.list()}" optionKey="id" required="" value="" class="many-to-one"/>
                   <g:submitButton name="create" class="save" value="Run" />
               </g:formRemote>
           </div>
           <div id="exeResult">
               ......
           </div>
       </div>
    </div>
</body>
</html>
