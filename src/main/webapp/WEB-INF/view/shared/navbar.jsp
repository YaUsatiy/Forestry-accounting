<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<script>
	window.userRole = '${userModel.role}';
</script>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container">
		<a class="navbar-brand" id="home" href="${contextRoot}/home">Forestry Accounting</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav">
				<li class="nav-item" id="about"><a class="nav-link"
					href="${contextRoot}/about">Safety precautions</a></li>
				<li class="nav-item" id="listProducts"><a class="nav-link"
					href="${contextRoot}/show/all/products">Household</a></li>
				<li class="nav-item" id="listLoggers"><a class="nav-link"
					href="${contextRoot}/show/all/loggers">Logger</a></li>
				<li class="nav-item" id="contact"><a class="nav-link"
					href="${contextRoot}/contact">Contact</a></li>
				<security:authorize access="hasAuthority('ADMIN')">
					<li id ="adminDrop" class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="javascript:void(0)"
						id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Manage 
						</a>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
							<li class="dropdown-item" id="manageProducts"><a
									href="${contextRoot}/manage/products">Manage Households</a>
								</li>
								<li class="dropdown-item" id="manageOrders"><a
									href="${contextRoot}/manage/orders">Manage Orders</a>
								</li>
								<li class="dropdown-item" id="manageReviews"><a
									href="${contextRoot}/manage/reviews">Manage Reviews</a>
								</li>
								<li class="dropdown-item" id="manageLoggers"><a
										href="${contextRoot}/manage/loggers">Manage Loggers</a>
								</li>
						</ul>
					</li>
				</security:authorize>
			</ul>
			<ul class="navbar-nav ml-auto">
				<security:authorize access="isAnonymous()">
					<li class="nav-item" id="login"><a class="nav-link"
						href="${contextRoot}/login">Log in</a></li>
					<li class="nav-item" id="register"><a class="nav-link" 
						href="${contextRoot}/register">Sign Up</a></li>
				</security:authorize>
				<security:authorize access="isAuthenticated()">
					<li id ="userDrop" class="nav-item dropdown" id="userModel"><a
						class="nav-link dropdown-toggle" href="javascript:void(0)"
						id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> ${userModel.fullName} <span
							class="caret"></span>
					</a>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
							<security:authorize access="hasAuthority('USER')">
								<li class="dropdown-item" id="cart">
									<a href="${contextRoot}/cart/show"> <i
											class="fas fa-shopping-cart"></i>&#160;<span
											class="badge badge-pill badge-success">${userModel.cart.cartLines}</span>
											- &#36; ${userModel.cart.grandTotal}
									</a>
								</li>
								<li role="separator" class="dropdown-divider"></li>
								<li id ="userOrders" class="dropdown-item">
									<a
										href="${contextRoot}/user/myOrders">My orders
									</a>
								</li>
								<li class="dropdown-item">
									<a
										href="${contextRoot}/user/myReviews">My reviews
									</a>
								</li>
								<li role="separator" class="dropdown-divider"></li>
							</security:authorize>
							<li class="dropdown-item" id="logout"><a
								href="${contextRoot}/perform-logout">Logout</a></li>
						</ul></li>
				</security:authorize>
			</ul>
		</div>
	</div>
</nav>