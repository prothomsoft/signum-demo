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

    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/signum-demo">Signum Demo</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="/signum-demo/article/list"><spring:message code="menu.articles" text="Articles" /></a></li>            
            <li class="active"><a href="/signum-demo/login"><spring:message code="menu.login" text="Login" /></a></li>
	        <c:choose>
		         <c:when test="${pageContext['response'].locale eq 'pl'}">
		             <li><a href="?lang=en"><spring:message code="menu.english" text="English" /></a></li>
		         </c:when>
		         <c:otherwise>
		             <li><a href="?lang=pl"><spring:message code="menu.polish" text="Polish" /></a></li>
		         </c:otherwise>
		    </c:choose>
	     </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>

	<div class="container">
	    <div class="starter-template">
	    
	        <div class="form-login">
			    <c:if test="${not empty error}">
		             <div class="alert alert-danger">
		                 <a href="#" class="close" data-dismiss="alert">x</a>
		                 ${error}
		             </div>
		         </c:if>
		         
		         <c:if test="${not empty msg}">
		             <div class="alert alert-info">
		                 <a href="#" class="close" data-dismiss="alert">x</a>
		                 ${msg}
		             </div>                  
		         </c:if>
	         
			     <form name='loginForm' action="<c:url value='/login' />" method='POST'>
			        <div class="form-group">
			            <label for="inputEmail"><spring:message code="login.email" text="Email" /></label>
			            <input type="email" class="form-control" id="inputEmail" placeholder="<spring:message code="login.email" text="Email" />" name="username">
			        </div>
			        <div class="form-group">
			            <label for="inputPassword"><spring:message code="login.password" text="Password" /></label>
			            <input type="password" class="form-control" id="inputPassword" placeholder="<spring:message code="login.password" text="Password" />" name="password">
			        </div>
			        <button type="submit" class="btn btn-primary"><spring:message code="login.login" text="Login" /></button>
			        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			    </form>
            </div>
	 	
		</div>
		
	</div>
		
	<script src="/signum-demo/resources/js/jquery.min.js"></script>
    <script src="/signum-demo/resources/js/scripts.min.js" type="text/javascript"></script>
</body>
</html>