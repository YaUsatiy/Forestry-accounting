<%@include file="../shared/flow-header.jsp"%>

<div class="content">
	<div class="container">

		<div class="row">

			<div class="col-sm-6">

				<div class="my-3 card">
					<div class="card-header">
						<h4>Personal Details</h4>
					</div>

					<div class="text-center">
						<div class="card-body">
							<h5>
								Name : <strong>${registerModel.user.firstName}
									${registerModel.user.lastName}</strong>
							</h5>
							<h5>
								Email : <strong>${registerModel.user.email}</strong>
							</h5>
							<h5>
								Contact : <strong>${registerModel.user.contactNumber}</strong>
							</h5>
							<h5>
								Role : <strong>${registerModel.user.role}</strong>
							</h5>

						</div>
						<div class="card-footer">
							<a href="${flowExecutionUrl}&_eventId_personal"
								class="btn btn-primary">Edit <i class="fas fa-edit"></i></a>
						</div>
					</div>
				</div>


			</div>

			<div class="col-sm-6">

				<div class="my-3 card">
					<div class="card-header">
						<h4>Billing Address</h4>
					</div>

					<div class="text-center">
						<div class="card-body">
							<h5>First address : ${registerModel.billing.addressLineOne}</h5>
							<h5>Second address : ${registerModel.billing.addressLineTwo}</h5>
							<h5>City : ${registerModel.billing.city}</h5>
							<h5>Postal code : ${registerModel.billing.postalCode}</h5>
							<h5>State : ${registerModel.billing.state}</h5>
							<h5>Country : ${registerModel.billing.country}</h5>
						</div>

						<div class="card-footer">
							<a href="${flowExecutionUrl}&_eventId_billing"
								class="btn btn-primary">Edit <i class="fas fa-edit"></i></a>
						</div>
					</div>
				</div>

			</div>

		</div>

		<div class="row">

			<div class="col-sm-4 offset-4">

				<div class="text-center">

					<a href="${flowExecutionUrl}&_eventId_submit"
						class="btn btn-lg btn-primary">Confirm <i
						class="fas fa-check-square"></i></a>

				</div>

			</div>

		</div>

	</div>
</div>

<%@include file="../shared/flow-footer.jsp"%>