<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@page language="Java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Signum Demo</title>
    <!-- Bootstrap -->
    <link href="/signum-demo/resources/css/main.min.css"
        rel="stylesheet" type="text/css" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
</head>
  <body>
    <div class="header">
		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/signum-demo">Signum Demo</a>
				</div>
				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav">
						<li><a href="/signum-demo/article/list"><spring:message code="menu.articles" text="Articles" /></a></li>						
						<sec:authorize var="loggedIn" access="isAuthenticated()" />
			            <c:choose>
			                <c:when test="${loggedIn}">
			                    <li><a href="#" id="logout">${pageContext['request'].userPrincipal.name} | <spring:message code="menu.logout" text="Logout" /></a></li>
			                </c:when>
			                <c:otherwise>
			                    <li><a href="/signum-demo/login"><spring:message code="menu.login" text="Login" /></a></li>
			                </c:otherwise>
			            </c:choose>
			            <c:choose>
						    <c:when test="${pageContext['response'].locale eq 'pl'}">
						        <li><a href="?lang=en"><spring:message code="menu.english" text="English" /></a></li>
						    </c:when>
						    <c:otherwise>
						        <li><a href="?lang=pl"><spring:message code="menu.polish" text="Polish" /></a></li>
						    </c:otherwise>
						</c:choose>
						<li><a href="#"><spring:message code="menu.executeTime" text="Response time" />: ${executeTime} ms</a></li>			            
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>
	</div>
      
    <div class="container">
    
	    <div class="starter-template">
            <p><strong><u>Jak zbudować od podstaw responsywną, bezpieczną aplikacje webową działająca w chmurze.</u></strong></p>

		<p><strong>Celem prezentacji jest pokazanie jak zbudować responsywną (bootstrap 3.0) aplikację webową (Spring, Spring MVC) z repozytorium na GitHub, 
		lokalnym środowiskiem opartym na Tomcat 7 WTP, oraz zainstalować ją w chmurze (OpenShift - AWS) <u>by ktoś mógł ją w końcu kupić</u>.</strong></p>
		
		<p><strong>Aplikacja powstała zupełnie od podstaw i zawiera wszystkie komponenty, których wymaga się pisząc aplikację czyli (kolejność przypadkowa):</strong></p>
		<ul>
		    <li>Baza danych MySql</li>
		    <li>Konfiguracja Spring i Spring MVC za pomocą adnotacji servlet 3.0 (brak wpisów w web.xml)</li>
		    <li>Dependency Injection, Transaction Management</li>
		    <li>Localization, aplikacja w kilku językach, zmiana języka nie przenosi do home</li>
		    <li>Security (Spring-Security) - implementacja User, Role, Permission z bazą danych @PreAuthorize, sec:authorize (również REST - AuthenticationEntryPoint)</li>
		    <li>Interceptory - preHandle, postHandle, afterCompletion</li>
		    <li>Model obiektowy Hibernate (com.lumesse.domain)</li>
		    <li>DTO do komunikacji w REST(com.lumesse.dto)</li>
		    <li>DAO -  SpringData (nowa wersja Hadesa com.lumesse.security) - JpaRepository z implementacją paginacji do tabelki</li>
		    <li>Service - (com.lumesse.service.api, com.lumesse.service.impl) - implementacja logiki biznesowej</li>
		    <li>Controler - (com.lumesse.controller) MVC pattern event driven</li>
		    <li>Gruntfile.js - budowanie less, uglify i watch</li>
		    <li>Bootstrap 3.0</li>
		    <li>Testy junit, mockito</li>
		    <li>Środowisko developerskie na Tomcat WTP, start serwera z aplikacją w 7 sekund</li>   
		    <li>Deployment w chmurze OpenShift, czyli aplikacja dostępna w internecie</li>
		</ul>
		
		<p><strong>Opis funkcjonalności dostępnych w aplikacji:</strong></p>
		<p>Aplikacja posiada typowo 3 rodzaje użytkowników:</p>
		<ul>
		<li>Gość</li>
		<li>User, login: user@site.com, hasło: user</li>
		<li>Admin, login: admin@site.com, hasło: admin</li>
		</ul>
		
		<ul>
        <li>Gość może tylko oglądnąć stronę startową.</li>
        <li>Użytkownik może przeglądnąć listę wprowadzonych artykułów po zalogowaniu, ale nie może ich dodawać, edytować, usuwać.</li>
        <li>Administrator może przeglądać, dodawać, edytować i usuwać artykuły.</li>
        </ul>
		
		<p><strong>Zastosowane technologie Server Side</strong><br/>
		(link do kodu źródłowego <a href="https://github.com/prothomsoft/signum-demo" target="_blank">https://github.com/prothomsoft/signum-demo</a>)</p>
		<ul>
		<li>Spring + Spring MVC (REST) - 3.2.6.RELEASE</li>
		<li>Spring Security (User, Role, Permission implementation) - 3.2.0.RELEASE</li>
		<li>SpringData - 1.5.1.RELEASE</li>
		<li>Hibernate - 4.3.5.Final</li>
		<li>Servlet - 3.0.1</li>
		<li>Maven</li>
		</ul>
		
		<p><strong>Zastosowane technologie Client Side</strong><br/> 
		(link do kodu źródłowego <a href="https://github.com/prothomsoft/signum-demo-bootstrap" target="_blank">https://github.com/prothomsoft/signum-demo-bootstrap</a>)</p>
		<ul>
		<li>node.js (npm)</li>
		<li>grunt</li>
		<li>bootstrap 3.0 (less)</li>
		</ul>
		
		<p><strong>Instalacja projektu w Pivotal OpenShift (Tomcat 7, MySQL 5.5)</strong></p>
		<p>Panel admina w OpenShift<br/>
		<a href="https://openshift.redhat.com/app/login" target="_blank">https://openshift.redhat.com/app/login</a><br/>
		Login:tprokop@prothomsoft.com<br/>
		Hasło: prokop1</p>
		<p>Baza danych<br/>
		URL: <a href="https://signumdemo-prothomsoft.rhcloud.com/phpmyadmin/" target="_blank">https://signumdemo-prothomsoft.rhcloud.com/phpmyadmin/</a><br/>
		Login: adminZCiX8Ng<br/>
		Hasło: x2lf_7d7Fh6L</p>
		<p>Dostęp do serwera przez Putty w celu debugowania aplikacji (wymaga klucza)<br/>
		ssh 53b25a935973ca69ef000332@signumdemo-prothomsoft.rhcloud.com</p>
		
		<p><strong>Instalacja projektu lokalnie:</strong></p>
		<p>Tomcat 7 + MySql 5.5<br/>
		Maven 3.1.1<br/>
		Eclipse Web Tools Platform</p>
		
		<p><strong>Wykorzystane materiały, gdzie można dowiedzieć się więcej:</strong></p>
		<ul>
		<li>Pro Spring MVC: With Web Flow - <a href="http://www.apress.com/9781430241553" target="_blank">http://www.apress.com/9781430241553</a></li>
		<li>Bootstrap 3.0 <a href="http://getbootstrap.com/" target="_blank">http://getbootstrap.com/</a></li>
		<li>Bootstrap 3.0 grid explanation <a href="http://www.helloerik.com/" target="_blank">http://www.helloerik.com</a></li>
		<li>Roots.io Modern WordPress Development <a href="http://http://roots.io" target="_blank">http://http://roots.io</a></li>
		<li>Frameless grid <a href="http://framelessgrid.com/" target="_blank">http://framelessgrid.com/</a></li>
		</ul>
     
		</div><!-- /.starter-template -->

		<c:url value="/logout" var="logoutUrl" />
		<form action="${logoutUrl}" method="post" id="logoutForm" style="display: inline">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
	</div><!-- /.container -->
    
    <script src="/signum-demo/resources/js/jquery.min.js"></script>
    <script src="/signum-demo/resources/js/scripts.min.js" type="text/javascript"></script>
    
    <script>
	    $(document).ready(function() {
	    	$("#logout").click(function() {
	    		  $("#logoutForm").submit();
	    	});
	    });
    </script>
  </body>
</html>