<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<div class="container">

	<c:if test="${not empty message}">	
		<div class="mt-3 row">			
			<div class="col-12">			
				<div class="alert alert-success" role="alert">${message}
					 <button type="button" class="close" data-dismiss="alert" aria-label="Close">
						  <span aria-hidden="true">&times;</span>
	 				</button>			
 				 </div>	
			</div>
		</div>
	</c:if>
	
	<c:if test="${empty notShow}">
		<security:authorize access="hasAuthority('USER') or isAnonymous()">
			<div class="row">
				<div class="col-12">
					<div class="my-3 card">
						<div class="card-header">
							<h4>Write your own review</h4>
						</div>	
						<div class="card-body">
							<sf:form class="form" modelAttribute="review" action="${contextRoot}/user/product/${review.product.id}/add/review" method="POST">
								<div class="form-row mb-3">
									<label class="col-form-label col-4">Comment</label>
									<div class="col-8">
										<sf:textarea path="comment" class="form-control"
											placeholder="Your comment..." /> 
										<sf:errors path="comment" cssClass="help-block" element="em"/>	
									</div>
								</div>
								
								<div class="form-row mb-3">
									<label class="col-form-label col-4">Rating <i class="fas fa-star"></i></label>
									<div class="col-8">
										<sf:input type="number" min="0" max="5" path="rating" class="form-control"
											placeholder="Your rating..." />
										<sf:errors path="rating" cssClass="help-block" element="em"/> 
									</div>
								</div>
		
								<div class="form-row">
									<div class="offset-4 col-4">
										<input type="submit" name="submit" value="Save" class="btn btn-primary"/>
									</div>
								</div>						
												
							</sf:form>
						</div>
					</div>
				</div>
			</div>
		</security:authorize>
	</c:if>
	
	<c:choose>
		<c:when test="${not empty reviews}">	
			<c:forEach items="${reviews}" var="review">
				<div class="media my-2">
					  <i class="fas fa-user-circle mr-3 mt-3" style="font-size: 55px"></i>
					  <div class="media-body">
					  	${review.user.firstName} ${review.user.lastName} about <a href="${contextRoot}/show/${review.product.id}/product">${review.product.name}</a>
					    <br/>
					    <small class="mt-0"> 
					    	<fmt:formatDate value="${review.reviewDate}" pattern="dd-MM-YYYY HH:mm:ss" />	
					    	<c:forEach begin="1" end="${review.rating}">
				       			<i class="fas fa-star" style="color : orange"></i>
						    </c:forEach>
						    <c:forEach begin="${review.rating}" end="4">
						       <i class="fas fa-star" style="color : gray"></i>
						    </c:forEach>
					    </small>
					    <h5>${review.comment}</h5>
					    <security:authorize access="hasAuthority('ADMIN')">
						 	<a href="${contextRoot}/manage/review/${review.id}/delete" class="btn btn-danger">Delete review</a>
						 </security:authorize>
					  </div>
				</div>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<div class="jumbotron my-4">
				<h3 class="text-center">There are no reviews here!</h3>
				<div class="text-center mb-3">
		    		<a href="${contextRoot}/show/all/products" class="btn btn-lg btn-warning">Continue Shopping</a>
		    	</div>
			</div>
		</c:otherwise>
	</c:choose>

</div>