<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>	
<%@include file="../../shared/flow-header.jsp"%>		

<div class="container">
	<div class="row">
	
			<div class="mt-3 col-md-4">			
				<h3 class="text-center">Select Shipping Address</h3>
				<hr/>
				
				<div class="row my-10">
					<c:forEach items="${addresses}" var="address">					
						<div class="col-12">
							<h4><i>First address : </i>${address.addressLineOne}</h4>
							<h4><i>Second address : </i>${address.addressLineTwo}</h4>
							<h4><i>City : </i>${address.city} - ${address.postalCode}</h4>
							<h4><i>State : </i>${address.state} - ${address.country}</h4>
							<hr/>
							<div class="text-center">
								<a href="${flowExecutionUrl}&_eventId_addressSelection&shippingId=${address.id}" class="btn btn-primary">Select</a>
							</div>												
						</div>
					</c:forEach>			
				</div>
	
			</div>				
			<div class="mt-3 col-md-8">
					<div class="card">
					<div class="card-header">
						<h4>Sign Up - Address</h4>
					</div>

					<div class="card-body">
										
						<sf:form
							method="POST"
							modelAttribute="shipping"
							class="form"
							id="billingForm"
						>
						
							<div class="form-row mb-3">
								<label class="col-form-label col-md-4" for="addressLineOne">Address Line One</label>
								<div class="col-md-8">
									<sf:input type="text" path="addressLineOne" class="form-control"
										placeholder="Enter Address Line One" />
									<sf:errors path="addressLineOne" cssClass="help-block" element="em"/> 
								</div>
							</div>

							<div class="form-row mb-3">
								<label class="col-form-label col-md-4" for="addressLineTwo">Address Line Two</label>
								<div class="col-md-8">
									<sf:input type="text" path="addressLineTwo" class="form-control"
										placeholder="Enter Address Line Two" />
									<sf:errors path="addressLineTwo" cssClass="help-block" element="em"/> 
								</div>
							</div>

							<div class="form-row mb-3">
								<label class="col-form-label col-md-4" for="city">City</label>
								<div class="col-md-8">
									<sf:input type="text" path="city" class="form-control"
										placeholder="Enter City Name" />
									<sf:errors path="city" cssClass="help-block" element="em"/> 
								</div>
							</div>
							
							<div class="form-row mb-3">
								<label class="col-form-label col-md-4" for="postalCode">Postal Code</label>
								<div class="col-md-8">
									<sf:input type="text" path="postalCode" class="form-control"
										placeholder="XXXXXX" />
									<sf:errors path="postalCode" cssClass="help-block" element="em"/> 
								</div>
							</div>							
						
							<div class="form-row mb-3">
								<label class="col-form-label col-md-4" for="state">State</label>
								<div class="col-md-8">
									<sf:input type="text" path="state" class="form-control"
										placeholder="Enter State Name" />
									<sf:errors path="state" cssClass="help-block" element="em"/> 
								</div>
							</div>

							<div class="form-row mb-3">
								<label class="col-form-label col-md-4" for="country">Country</label>
								<div class="col-md-8">
									<sf:input type="text" path="country" class="form-control"
										placeholder="Enter Country Name" />
									<sf:errors path="country" cssClass="help-block" element="em"/> 
								</div>
							</div>
							
							
							<div class="form-row mb-3">
								<div class="offset-4 col-md-8">
									<button type="submit" name="_eventId_saveAddress" class="btn btn-primary">
										<i class="fas fa-plus"></i> Add Address
									</button>																	 
								</div>
							</div>
						
						
						</sf:form>					
					
					
					</div>
				
				
				</div>
			
								
			
			</div>
			

	</div>	

</div>

<%@include file="../../shared/flow-footer.jsp"%>