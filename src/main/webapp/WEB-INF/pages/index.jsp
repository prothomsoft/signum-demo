<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Demo</title>
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
					<a class="navbar-brand" href="/signum-demo">Signum DEMO</a>
				</div>
				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav">
						<li><a href="/signum-demo/article/list">Articles</a></li>						
						<sec:authorize var="loggedIn" access="isAuthenticated()" />
			            <c:choose>
			                <c:when test="${loggedIn}">
			                    <li><a href="#">${pageContext['request'].userPrincipal.name} | Logout</a></li>
			                </c:when>
			                <c:otherwise>
			                    <li><a href="/signum-demo/login">Login</a></li>
			                </c:otherwise>
			            </c:choose>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>
	</div>
      
    <div class="container">
    
	    <div class="starter-template">
            <p><a href="/signum-demo/article/list">Articles</a></p>
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
	    	$("a:contains('Logout')").click(function() {
	    		  $("#logoutForm").submit();
	    	});
	    });
    </script>
  </body>
</html>