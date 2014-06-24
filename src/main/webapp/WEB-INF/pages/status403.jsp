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

    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/signum-demo">Signum DEMO</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="/signum-demo/article/list">Articles</a></li>            
            <li class="active"><a href="/signum-demo/login">Login</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>

    <div class="container">
        <div class="starter-template">
        
            <p>HTTP Status 403 - Access is denied</p>
		    <c:choose>
		        <c:when test="${empty username}">
		          <p>You do not have permission to access this page!</p>
		        </c:when>
		        <c:otherwise>
		          <p>User name : ${username} <br/> You do not have permission to access this page!</p>
		        </c:otherwise>
		    </c:choose>
        
        </div>
        
    </div>
        
    <script src="/signum-demo/resources/js/jquery.min.js"></script>
    <script src="/signum-demo/resources/js/scripts.min.js" type="text/javascript"></script>
</body>
</html>