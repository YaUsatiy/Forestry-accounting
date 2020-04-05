<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />
<spring:url var="jquery" value="/resources/jquery" />

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Forestry Accounting - ${title}</title>

<script>
	window.menu = '${title}';
	window.contextRoot = '${contextRoot}'
</script>

<!-- Bootstrap core CSS -->
<link href="${css}/bootstrap.min.css" rel="stylesheet">

<link href="${css}/bootstrap-theme.css" rel="stylesheet">

<link href="${css}/dataTables.bootstrap4.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${css}/myapp.css" rel="stylesheet">

<link href="${css}/all.min.css" rel="stylesheet">

</head>

<body>

	<div class="wrapper">

		<!-- Navigation -->
		<%@include file="./shared/navbar.jsp"%>

		<!-- Page Content -->
		<div class="content">
			<c:if test="${userClickHome eq true}">
				<%@include file="home.jsp"%>
			</c:if>
			<c:if test="${userClickAbout eq true}">
				<%@include file="about.jsp"%>
			</c:if>
			<c:if test="${userClickContact eq true}">
				<%@include file="contact.jsp"%>
			</c:if>
			<c:if test="${userClickAllProducts or userClickCategoryProducts eq true}">
				<%@include file="listProducts.jsp"%>
			</c:if>
			<c:if test="${userClickShowProduct eq true}">
				<%@include file="singleProduct.jsp"%>
			</c:if>
			<c:if test="${userClickManageProducts eq true}">
				<%@include file="manageProducts.jsp"%>
			</c:if>
			<c:if test="${userClickShowCart eq true}">
				<%@include file="cart.jsp"%>
			</c:if>
			<c:if test="${userClickMyOrders or userClickManageOrders eq true}">
				<%@include file="orders.jsp"%>
			</c:if>
			<c:if test="${userClickReviews or userClickMyReviews or userClickManageReviews eq true}">
				<%@include file="reviews.jsp"%>
			</c:if>
			<c:if test="${userClickAllLoggers eq true}">
				<%@include file="listLoggers.jsp"%>
			</c:if>
			<c:if test="${userClickShowLogger eq true}">
				<%@include file="singleLogger.jsp"%>
			</c:if>
			<c:if test="${userClickManageLoggers eq true}">
				<%@include file="manageLoggers.jsp"%>
			</c:if>
		</div>

		<!-- Footer -->
		<%@include file="./shared/footer.jsp"%>

		<!-- Bootstrap core JavaScript -->
		<script src="${jquery}/jquery.min.js"></script>
		
		<script src="${jquery}/jquery.validate.js"></script>
		
		<script src="${js}/bootstrap.bundle.min.js"></script>
		
		<script src="${js}/datatables.js"></script>
		
		<script src="${js}/dataTables.bootstrap4.js"></script>
		
		<script src="${js}/bootbox.min.js"></script>

		<!-- My JavaScript -->
		<script src="${js}/myapp.js"></script>

	</div>

</body>

</html>