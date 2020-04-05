<div class="container">

	<div class="row">
		<div class="mt-3 col-xs-12">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="${contextRoot}/home">Home</a></li>
				<li class="breadcrumb-item"><a
					href="${contextRoot}/show/all/products">Products</a></li>
				<li class="breadcrumb-item active">${product.name}</li>
			</ol>
		</div>
	</div>


	<div class="row">
		<div class="col-xs-12 col-sm-4">
			<div class="thumbnail">
				<img src="${images}/${product.code}.jpg" class="img img-responsive" />
			</div>
		</div>

		<div class="col-xs-12 col-sm-8">
			<h4><i class="fas fa-eye"></i>${product.views} <i class="fas fa-shopping-cart"></i>${product.purchases}</h4>
			<h2>${product.name}</h2>
			<h4>
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
			</h4>
			<hr />
			<p>${product.description}</p>
			<hr />
			<h4>
				Price: <strong> &#36; ${product.unitPrice}</strong>
			</h4>
			<hr />

			<c:choose>
				<c:when test="${product.quantity < 1}">
					<h6>
						Qty. Available: <span style="color: red">Out of Stock!</span>
					</h6>
				</c:when>
				<c:otherwise>
					<h6>Qty. Available: ${product.quantity}</h6>
				</c:otherwise>
			</c:choose>

			<security:authorize access="isAnonymous() or hasAuthority('USER')">
				<c:choose>
					<c:when test="${product.quantity < 1}">
						<a href="javascript:void(0)" class="btn btn-success disabled"><strike>
								<span class="glyphicon glyphicon-shopping-cart"></span> Add to
								Cart
						</strike></a>
					</c:when>
					<c:otherwise>
						<a href="${contextRoot}/cart/add/${product.id}/product"
							class="btn btn-success"> <span
							class="glyphicon glyphicon-shopping-cart"></span> Add to Cart
						</a>
					</c:otherwise>
				</c:choose>
				<a href="${contextRoot}/show/all/products" class="btn btn-warning">Continue
				Shopping</a>
				
				<a href="${contextRoot}/cart/show" class="btn btn-info"> Shopping
				Cart</a>
			</security:authorize>
			
			<security:authorize access="hasAuthority('ADMIN')">
				<a href="${contextRoot}/manage/${product.id}/product" class="btn btn-success">
				<i class="fas fa-edit"></i> Edit</a>
				
				<a href="${contextRoot}/show/all/products" class="btn btn-warning">Back</a>
			</security:authorize>
			
		</div>
	
		<hr>
		<div class="col-10 my-2">
			<h4>You might also like</h4>
			<div class="row">
				<c:forEach items="${topProducts}" var="product">
					<div class="col-3 my-2">
						<div class="card h-100">
							<a href="${contextRoot}/show/${product.id}/product"><img class="card-img-top"
								src="${contextRoot}/resources/images/${product.code}.jpg" alt=""></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="${contextRoot}/show/${product.id}/product">${product.name}</a>
								</h4>
								<h5>$${product.unitPrice}</h5>
								<c:set var = "description" value = "${product.description}"/>
								<p class="card-text">${fn:substring(description, 0, 200)}...</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	
	</div>

</div>