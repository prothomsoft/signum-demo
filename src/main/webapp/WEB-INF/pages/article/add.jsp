<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title><spring:message code="article.createform" text="Create Form" /></title>

<script>
    $(document).ready(function() {
        $("#save-changes").click(function() {
        	$.ajax({
                type : "post",
                data : $(".form-horizontal").serialize(),
                url : "/signum-demo/article/add",
                async : false,
                dataType : "json",
                success : function(data) {
                    $('#myModal').modal('hide');
                    window.location.reload();
                },
                cache : false
            });
        });
    });
</script>
</head>
<body>
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"><spring:message code="article.addnewentry" text="Add New Entry" /></h4>
    </div>
    <div class="modal-body">
        <form:form class="form-horizontal" method="POST" commandName="article">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <div class="form-group">
                <label class="control-label col-md-4" for="article_title"><spring:message code="article.title" text="Title" />:</label>
                <div class="col-md-6">
                    <form:input path="articleTitle" class="form-control"/>                    
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-4" for="article_content"><spring:message code="article.content" text="Content" />:</label>
                <div class="col-md-6">
                    <form:input path="articleContent" class="form-control"/>                    
                </div>
            </div>
        </form:form>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="article.close" text="Close" /></button>
        <button type="button" class="btn btn-primary" id="save-changes"><spring:message code="article.save" text="Save" /></button>
    </div>  
</body>
</html>