<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />
<spring:url var="jquery" value="/resources/jquery" />

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Forestry Accounting - ${title}</title>

<link href="${css}/bootstrap.min.css" rel="stylesheet">

<link href="${css}/bootstrap-theme.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${css}/myapp.css" rel="stylesheet">

<link href="${css}/all.min.css" rel="stylesheet">

<script>
	window.menu = '${title}';

	window.contextRoot = '${contextRoot}'
</script>

</head>

<body>

	<div class="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-inverse navbar-dark bg-dark" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<a class="navbar-brand" href="${contextRoot}/home">Forestry Accounting</a>
				</div>
			</div>
		</nav>

		<!-- Page Content -->

		<div class="content">

			<div class="container">

				<c:if test="${not empty message}">
					<div class="mt-3 row">
						<div class="col-xs-12 offset-2 col-md-8">
							<div class="alert alert-danger" role="alert">${message}
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						</div>
					</div>
				</c:if>

				<c:if test="${not empty logout}">
					<div class="mt-3 row">
						<div class="col-xs-12 offset-2 col-md-8">
							<div class="alert alert-success" role="alert">${logout}
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						</div>
					</div>
				</c:if>

				<div class="row">
					<div class="offset-3 col-md-6">
						<div class="my-5 card">
							<div class="card-header">
								<h4>Login</h4>
							</div>
							<div class="card-body">
								<form action="${contextRoot}/login" method="POST"
									class="form" id="loginForm">
									<div class="form-row mb-3">
										<label for="username" class="col-md-4 col-form-label">Email:
										</label>
										<div class="col-md-8">
											<input type="text" name="username" id="username"
												class="form-control" />
										</div>
									</div>
									<div class="form-row mb-3">
										<label for="password" class="col-md-4 col-form-label">Password:
										</label>
										<div class="col-md-8">
											<input type="password" name="password" id="password"
												class="form-control" />
										</div>
									</div>
									
									<div class="form-check offset-4 col-md-8 mb-2">
										<input type="checkbox" class="form-check-input" id="remember-me" name="remember-me" />
										<label class="form-check-label" for="remember-me">Remember me</label>
									</div>
									
									<div class="form-row mb-2">
										<div class="offset-4 col-md-8">
											<input type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}" /> 
											<input type="submit" value="Login" class="btn btn-primary" />
										</div>
									</div>
								</form>

							</div>
							<div class="card-footer">
								<div class="text-right">
									New User? <a href="${contextRoot}/register">Register Here</a>
								</div>
							</div>

						</div>

					</div>

				</div>

			</div>

		</div>


		<!-- Footer -->
		<%@include file="./shared/footer.jsp"%>

		<!-- Bootstrap core JavaScript -->
		<script src="${jquery}/jquery.min.js"></script>

		<script src="${jquery}/jquery.validate.js"></script>

		<script src="${js}/bootstrap.bundle.min.js"></script>

		<!-- My JavaScript -->
		<script src="${js}/myapp.js"></script>

	</div>

</body>

</html>