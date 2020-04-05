<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<link href="${css}/bootstrap.min.css" rel="stylesheet">

<link href="${css}/bootstrap-theme.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${css}/myapp.css" rel="stylesheet">

<title>Online Shopping - FlowException</title>

</head>

<body>

	<div class="wrapper">
		<nav class="navbar navbar-dark bg-dark" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<a class="navbar-brand" href="${contextRoot}/home">Home</a>
				</div>
			</div>
		</nav>

		<div class="content">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="my-4 jumbotron">
							<h1>Please contact your administrator!</h1>
							<hr/>
							<blockquote style="word-wrap:break-word">
								${flowExecutionException}
							</blockquote>						
							<blockquote style="word-wrap:break-word">
								${rootCauseException}
							</blockquote>		
						</div>
					</div>	
				</div>
			</div>
		</div>

		<%@include file="../../shared/footer.jsp"%>
	</div>

</body>

</html>