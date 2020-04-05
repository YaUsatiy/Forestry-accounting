<div class="container">
	<c:if test="${not empty message}">
		<div class="mt-3 row">
			<div class="col-12">
				<div class="alert alert-info" role="alert">
					<h3 class="text-center">${message}
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</h3>
				</div>
			</div>
		</div>
	</c:if>

	<c:choose>
		<c:when test="${not empty cartLines}">
			<table id="cart" class="table table-hover table-sm">
				<thead>
					<tr>
						<th style="width: 50%">Product</th>
						<th style="width: 10%">Price</th>
						<th style="width: 8%">Quantity</th>
						<th style="width: 22%" class="text-center">Subtotal</th>
						<th style="width: 10%"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${cartLines}" var="cartLine">
						<c:if test="${cartLine.available == false}">
							<c:set var="availableCount" value="${availableCount - 1}" />
						</c:if>

						<tr>
							<td data-th="Product">
								<div class="row">
									<div class="col-sm-2 d-none d-sm-block">
										<a href="${contextRoot}/show/${cartLine.product.id}/product">
											<img src="${images}/${cartLine.product.code}.jpg"
												alt="${cartLine.product.name}"
												class="img-fluid cartImg" />
										</a>
									</div>
									<div class="col-sm-10">
										<h4 class="m-0">${cartLine.product.name}
											<c:if test="${cartLine.available == false}">
												<strong class="unavailable">(Not Available)</strong>
											</c:if>
										</h4>
										<c:set var = "description" value = "${cartLine.product.description}"/>
										<p>Description : ${fn:substring(description, 0, 200)}...</p>
									</div>
								</div>
							</td>
							<td data-th="Price">&#36; ${cartLine.buyingPrice}</td>
							<td data-th="Quantity"><input type="number"
								id="count_${cartLine.id}" class="form-control text-center"
								value="${cartLine.productCount}" min="1" max="3"></td>
							<td data-th="Subtotal" class="text-center">&#36;
								${cartLine.total} </td>
							<td class="actions" data-th=""><c:if
									test="${cartLine.available == true}">
									<button type="button" name="refreshCart"
										class="btn btn-info btn-sm" value="${cartLine.id}">
										<i class="fas fa-sync"></i>
									</button>
								</c:if> <a href="${contextRoot}/cart/${cartLine.id}/remove"
								class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></a></td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr class="visible-xs">
						<td class="text-center"><strong>Total &#36;
								${userModel.cart.grandTotal}</strong></td>
					</tr>
					<tr>
						<td><a href="${contextRoot}/show/all/products"
							class="btn btn-warning"><i class="fas fa-angle-left"></i> Continue
								Shopping</a></td>
						<td colspan="2" class="hidden-xs"></td>
						<td class="hidden-xs text-center"><strong>Total
								&#36; ${userModel.cart.grandTotal}</strong></td>

						<c:choose>
							<c:when test="${availableCount != 0}">
								<td><a href="${contextRoot}/cart/validate"
									class="btn btn-success btn-block" value="${fn:length(cartLines)}">Checkout <i class="fas fa-angle-right"></i></a>
								</td>
							</c:when>
							<c:otherwise>
								<td><a href="javascript:void(0)"
									class="btn btn-success btn-block disabled"><strike>Checkout
											<i class="fas fa-angle-right"></i>
									</strike></a></td>
							</c:otherwise>
						</c:choose>
					</tr>
				</tfoot>
			</table>
		</c:when>

		<c:otherwise>
			<div class="jumbotron my-4">
				<h3 class="text-center">Your Cart is Empty!</h3>
			</div>
		</c:otherwise>

	</c:choose>

</div>
