<div class="container">

	<div class="row">

		<div class="col-lg-3">
			<%@include file="./shared/sidebar.jsp" %>
		</div>
		<!-- /.col-lg-3 -->

		<div class="col-lg-9">

			<div id="carouselExampleIndicators" class="carousel slide my-4"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active">
						<img class="d-block img-fluid" src="${images}/banner1.jpg"
							alt="First slide">
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid" src="${images}/banner2.jpg"
							alt="Second slide">
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid" src="${images}/banner4.jpg"
							alt="Third slide">
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid" src="${images}/banner3.jpg"
							 alt="Second slide">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>

			<div class="row">
               	<div class="col-xs-12">
               		<h3>Our Most Purchased Products</h3>
               		<hr/>
               	</div>
            </div>

			<div class="row">
				<c:forEach items="${purchasedProducts}" var="product">
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="${contextRoot}/show/${product.id}/product"><img class="card-img-top"
								src="${contextRoot}/resources/images/${product.code}.jpg" alt=""></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="${contextRoot}/show/${product.id}/product">${product.name}</a>
								</h4>
								<small>
									<c:choose>
								    	<c:when test="${product.reviewCount > 0}">
											<c:forEach begin="1" end="${product.rating}">
								       			<i class="fas fa-star" style="color : orange"></i>
										    </c:forEach>
										    <c:forEach begin="${product.rating}" end="4">
										       <i class="fas fa-star" style="color : gray"></i>
										    </c:forEach>
											<span class="text-secondary">${product.rating}</span>
											 <a href="${contextRoot}/show/product/${product.id}/reviews" class="btn btn-sm btn-link">${product.reviewCount} reviews</a>
										 </c:when>
										 <c:otherwise>
										 	<span class="text-secondary">No reviews</span>
										 	<a href="${contextRoot}/show/product/${product.id}/reviews" class="btn btn-sm btn-primary">Write review</a>
										 </c:otherwise>
									</c:choose>
								</small>
								<h5>$${product.unitPrice}</h5>
								<c:set var = "description" value = "${product.description}"/>
								<p class="card-text">${fn:substring(description, 0, 200)}...</p>
							</div>
							<div class="card-footer">
								<small class="text-muted">Purchased : ${product.purchases} times</small>
							</div>
						</div>
					</div>
				</c:forEach>
				<div class="col-sm-4 col-lg-4 col-md-4">
                    <h4>Checkout more products!</h4>
                    <hr/>
                    <a class="btn btn-primary" href="${contextRoot}/show/all/products">More Products</a>
                </div>
			</div>
			
			<div class="row">
               	<div class="col-xs-12">
               		<h3>Our Most Viewed Households</h3>
               		<hr/>
               	</div>
            </div>
            
            <div class="row">
	         	<c:forEach items="${viewedProducts}" var="product">
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="${contextRoot}/show/${product.id}/product"><img class="card-img-top"
								src="${contextRoot}/resources/images/${product.code}.jpg" alt=""></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="${contextRoot}/show/${product.id}/product">${product.name}</a>
								</h4>
								<small>
									<c:choose>
								    	<c:when test="${product.reviewCount > 0}">
											<c:forEach begin="1" end="${product.rating}">
								       			<i class="fas fa-star" style="color : orange"></i>
										    </c:forEach>
										    <c:forEach begin="${product.rating}" end="4">
										       <i class="fas fa-star" style="color : gray"></i>
										    </c:forEach>
											<span class="text-secondary">${product.rating}</span>
											 <a href="${contextRoot}/show/product/${product.id}/reviews" class="btn btn-sm btn-link">${product.reviewCount} reviews</a>
										 </c:when>
										 <c:otherwise>
										 	<span class="text-secondary">No reviews</span>
										 	<a href="${contextRoot}/show/product/${product.id}/reviews" class="btn btn-sm btn-primary">Write review</a>
										 </c:otherwise>
									</c:choose>
								</small>
								<h5>$${product.unitPrice}</h5>
								<c:set var = "description" value = "${product.description}"/>
								<p class="card-text">${fn:substring(description, 0, 200)}...</p>
							</div>
							<div class="card-footer">
								<small class="text-muted">Viewed : ${product.views} times</small>
							</div>
						</div>
					</div>
				</c:forEach>
				<div class="col-sm-4 col-lg-4 col-md-4">
                    <h4>Checkout more products!</h4>
                    <hr/>
                    <a class="btn btn-primary" href="${contextRoot}/show/all/products">More Products</a>
                </div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-xs-12">
			<h3>Our Most Viewed Loggers</h3>
			<hr/>
		</div>
	</div>

	<div class="row">
		<c:forEach items="${topLoggers}" var="logger">
			<div class="col-lg-3 col-md-4 mb-4">
				<div class="card h-100">
					<a href="${contextRoot}/show/${logger.id}/logger"><img class="card-img-top"
																			 src="${contextRoot}/resources/images/${logger.code}.jpg" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="${contextRoot}/show/${logger.id}/logger">${logger.name}</a>
						</h4>
						<h5>${logger.seniority} years of experience</h5>
						<h6 class="card-text">${logger.company}&copy;</h6>
						<p>${logger.description}</p>
					</div>
					<div class="card-footer">
						<small class="text-muted">Viewed : ${logger.views} times</small>
					</div>
				</div>
			</div>
		</c:forEach>
		<div class="col-3">
			<h4>Checkout more loggers!</h4>
			<hr/>
			<a class="btn btn-primary" href="${contextRoot}/show/all/loggers">More Loggers</a>
		</div>
	</div>
</div>