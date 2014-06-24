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
						<li class="active"><a href="/signum-demo/article/list">Articles</a></li>
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
			</div>			
		</div>
	</div>	

	<div class="container">
		<div class="starter-template">
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<a class="btn btn-primary" data-toggle="modal" href="/signum-demo/article/add" data-target="#myModal">Add new entry</a><br /><br />
			</sec:authorize>
			
			<c:choose>
				<c:when test="${sortDirection == 'ASC'}">
					<c:url var="sortUrlArticleId" value="/article/list/1/DESC/articleId" />
					<c:url var="sortUrlArticleTitle" value="/article/list/1/DESC/articleTitle" />
					<c:url var="sortUrlArticleContent" value="/article/list/1/DESC/articleContent" />
				</c:when>
				<c:otherwise>
					<c:url var="sortUrlArticleId" value="/article/list/1/ASC/articleId" />
					<c:url var="sortUrlArticleTitle" value="/article/list/1/ASC/articleTitle" />
					<c:url var="sortUrlArticleContent" value="/article/list/1/ASC/articleContent" />
				</c:otherwise>
			</c:choose>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th><a href="${sortUrlArticleId}">Article Id</a></th>
						<th><a href="${sortUrlArticleTitle}">Article Title</a></th>
						<th><a href="${sortUrlArticleContent}">Article Content</a></th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${articleList}" var="article">
						<tr>
							<td><c:out value="${article.articleId}" /></td>
							<td><c:out value="${article.articleTitle}" /></td>
							<td><c:out value="${article.articleContent}" /></td>
							<td>
								<sec:authorize var="isAdmin" access="hasRole('ROLE_ADMIN')" />
					            <c:choose>
					                <c:when test="${isAdmin}">
					                   <a data-toggle="modal" href="/signum-demo/article/edit/${article.articleId}" data-target="#myModal">Edit</a> | 
                                       <a href="/signum-demo/article/delete/${article.articleId}">Delete</a>
					                </c:when>
					                <c:otherwise>
					                    -
					                </c:otherwise>
					            </c:choose>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<c:url var="firstUrl" value="/article/list/1/${sortDirection}/${sortColumn}" />
			<c:url var="lastUrl" value="/article/list/${articleLog.totalPages}/${sortDirection}/${sortColumn}" />
			<c:url var="prevUrl" value="/article/list/${currentIndex - 1}/${sortDirection}/${sortColumn}" />
			<c:url var="nextUrl" value="/article/list/${currentIndex + 1}/${sortDirection}/${sortColumn}" />
			<ul class="pagination">
				<c:choose>
					<c:when test="${currentIndex == 1}">
						<li class="disabled"><a href="#">&lt;&lt;</a></li>
						<li class="disabled"><a href="#">&lt;</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${firstUrl}">&lt;&lt;</a></li>
						<li><a href="${prevUrl}">&lt;</a></li>
					</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="${beginIndex}" end="${endIndex}">
					<c:url var="pageUrl" value="/article/list/${i}/${sortDirection}/${sortColumn}" />
					<c:choose>
						<c:when test="${i == currentIndex}">
							<li class="active"><a href="${pageUrl}"><c:out value="${i}" /></a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${pageUrl}"><c:out value="${i}" /></a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${currentIndex == articleLog.totalPages}">
						<li class="disabled"><a href="#">&gt;</a></li>
						<li class="disabled"><a href="#">&gt;&gt;</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${nextUrl}">&gt;</a></li>
						<li><a href="${lastUrl}">&gt;&gt;</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		
		<c:url value="/logout" var="logoutUrl" />
        <form action="${logoutUrl}" method="post" id="logoutForm" style="display: inline">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        </form>

		<div class="modal" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content"></div>
			</div>
		</div>

	</div>
	<!-- /.container -->

	<script src="/signum-demo/resources/js/jquery.min.js"></script>
	<script src="/signum-demo/resources/js/scripts.min.js" type="text/javascript"></script>

	<script>
        $(document).ready(function() {
        	$('#myModal').on('hide.bs.modal', function () {
       		   $('#myModal').removeData();
       		});        	
        	$("a:contains('Delete')").click(function(event) {
        		$.ajax({
                    type : "GET",
                    url : $(event.target).attr("href"),
                    async : false,
                    dataType : "json",
                    success : function(data) {
                    	window.location.reload();
                    },
                    cache : false
                });
        		event.preventDefault();
        	});
        	
        	$("a:contains('Logout')").click(function() {
                $("#logoutForm").submit();
            });
		});
	</script>
</body>
</html>