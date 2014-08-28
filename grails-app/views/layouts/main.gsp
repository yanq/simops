<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
  		<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>
		<g:layoutHead/>
	</head>
	<body>
		<div id="grailsLogo" role="banner">
            <div id="siteLogin">
                <g:if test="${session.user}">
                    欢迎您，${session.user}
                    <g:link controller="user" action="logout">退出</g:link>
                </g:if><g:else>
                    <g:link controller="user" action="login">登录</g:link>
                </g:else>
            </div>
            <div class="siteTitle">Simops</div>
            <div class="siteSlogan">a simple tool for ops</div>
        </div>
		<g:layoutBody/>
		<div class="footer" role="contentinfo">
            <div class="footerInfo">
                Simops <g:meta name="app.version"></g:meta> &nbsp;&nbsp;&nbsp;&nbsp;
                powered by <a target="_blank" href="http://grails.org">grails <g:meta name="app.grails.version"></g:meta></a> </div>
		</div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
	</body>
</html>
