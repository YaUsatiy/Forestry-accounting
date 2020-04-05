<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@include file="../shared/flow-header.jsp"%>

<div class="content">
	<div class="container">


		<div class="row">

			<div class="col-md-6 offset-3">

				<div class="my-3 card">
					<div class="card-header">
						<h4>Sign Up - Personal</h4>
					</div>

					<div class="card-body">

						<sf:form method="POST" modelAttribute="user" class="form"
							id="registerForm">

							<div class="form-row mb-3">
								<label class="col-form-label col-md-4">First Name</label>
								<div class="col-md-8">
									<sf:input type="text" path="firstName" class="form-control"
										placeholder="First Name" />
									<sf:errors path="firstName" cssClass="help-block" element="em" />
								</div>
							</div>


							<div class="form-row mb-3">
								<label class="col-form-label col-md-4">Last Name</label>
								<div class="col-md-8">
									<sf:input type="text" path="lastName" class="form-control"
										placeholder="Last Name" />
									<sf:errors path="lastName" cssClass="help-block" element="em" />
								</div>
							</div>

							<div class="form-row mb-3">
								<label class="col-form-label col-md-4">Email</label>
								<div class="col-md-8">
									<sf:input type="text" path="email" class="form-control"
										placeholder="abc@zyx.com" />
									<sf:errors path="email" cssClass="help-block" element="em" />
								</div>
							</div>

							<div class="form-row mb-3">
								<label class="col-form-label col-md-4">Contact Number</label>
								<div class="col-md-8">
									<sf:input type="text" path="contactNumber" class="form-control"
										placeholder="XXXXXXX" maxlength="7" />
									<sf:errors path="contactNumber" cssClass="help-block"
										element="em" />
								</div>
							</div>

							<div class="form-row mb-3">
								<label class="col-form-label col-md-4">Password</label>
								<div class="col-md-8">
									<sf:input type="password" path="password" class="form-control"
										placeholder="Password" />
									<sf:errors path="password" cssClass="help-block" element="em" />
								</div>
							</div>

							<div class="form-row mb-3">
								<label class="col-form-label col-md-4">Confirm Password</label>
								<div class="col-md-8">
									<sf:input type="password" path="confirmPassword"
										class="form-control" placeholder="Re-type password" />
									<sf:errors path="confirmPassword" cssClass="help-block"
										element="em" />
								</div>
							</div>

							<div class="form-row mb-3">
								<label class="col-md-4">Select Role</label>
								<div class="col-md-8">
									<label class="radio-inline"> 
										<sf:radiobutton path="role" value="USER" checked="checked" /> User
									</label> 
									<label class="radio-inline"> 
										<sf:radiobutton path="role" value="SUPPLIER" /> Supplier
									</label>
								</div>
							</div>

							<div class="form-row mb-3">
								<div class="offset-4 col-md-8">
									<button type="submit" name="_eventId_billing"
										class="btn btn-primary">
										Next - Billing <i class="fas fa-chevron-right"></i>
									</button>
								</div>
							</div>


						</sf:form>


					</div>
					<div class="card-footer">
						<div class="text-right">
							Already have an account? <a href="${contextRoot}/login">Login Here</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>

<%@include file="../shared/flow-footer.jsp"%>