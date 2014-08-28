<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Server</title>
</head>
<body>
    <a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
    <div class="nav" role="navigation">
        <g:render template="nav"></g:render>
    </div>
    <div id="page-body" class="content" role="main">
       <div class="leftBox">
           <g:each in="${servers}">
              <div><g:link action="server" id="${it.id}">${it}</g:link></div>
           </g:each>
       </div>
       <div class="rightContent">
           <h1>${serverInstance}</h1>
           <div class="exeBox">
               <g:each in="${ops.command.Command.findAllByTaskIsNull()}">
                   <g:remoteLink update="exeResult" action="exe" params="['server.id':serverInstance.id,'command.id':it.id]" >${it}</g:remoteLink>
               </g:each>
           </div>
           <div id="exeResult">
               ......
           </div>
       </div>
    </div>
</body>
</html>
