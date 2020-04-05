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
	
	<div class="row">
		<div class="col-12">
			<div class="my-3 card">
				<div class="card-header">
					<h4>Product Management</h4>
				</div>	
				<div class="card-body">
					<sf:form class="form" modelAttribute="product" action="${contextRoot}/manage/products" method="POST" enctype="multipart/form-data">
						<div class="form-row mb-3">
							<label class="col-form-label col-4">Name</label>
							<div class="col-8">
								<sf:input type="text" path="name" class="form-control"
									placeholder="Product Name" />
								<sf:errors path="name" cssClass="help-block" element="em"/> 
							</div>
						</div>

						<div class="form-row mb-3">
							<label class="col-form-label col-4">Description</label>
							<div class="col-8">
								<sf:textarea rows="10" path="description" class="form-control"
									placeholder="Enter your description here!" /> 
								<sf:errors path="description" cssClass="help-block" element="em"/>
							</div>
						</div>

						<div class="form-row mb-3">
							<label class="col-form-label col-4">Unit Price</label>
							<div class="col-8">
								<sf:input type="number" path="unitPrice" class="form-control"
									placeholder="Enter Unit Price" />
								<sf:errors path="unitPrice" cssClass="help-block" element="em"/>
							</div>
						</div>

						<div class="form-row mb-3">
							<label class="col-form-label col-4">Quantity</label>
							<div class="col-8">
								<sf:input type="number" path="quantity" class="form-control"
									placeholder="Enter Quantity" />
								<sf:errors path="quantity" cssClass="help-block" element="em"/> 
							</div>
						</div>
						
						<div class="form-row mb-3">
							<label class="col-form-label col-4">Upload a file</label>
							<div class="col-md-8">
								<sf:input type="file" path="file" class="form-control"/>
								<sf:errors path="file" cssClass="help-block" element="em"/> 
							</div>
						</div>

						<div class="form-row mb-3">
							<label class="col-form-label col-4">Category</label>
							<div class="col-8">
								<sf:select path="categoryId" items="${categories}" itemLabel="name" itemValue="id" class="form-control"/>
								<div class="text-right">
									<br/>			
									<sf:hidden path="id"/>
									<sf:hidden path="code"/>
									<sf:hidden path="supplierId"/>
									<sf:hidden path="active"/>														
									<button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#myCategoryModal">Add New Category</button>
								</div>							
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
	
	<!-- Modal -->
	<div class="row">
	<div class="modal fade" id="myCategoryModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h4 class="modal-title" id="myModalLabel">New Category</h4>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	      </div>
	      <div class="modal-body">
	        <sf:form id="categoryForm" class="form" modelAttribute="category" action="${contextRoot}/manage/category" method="POST">
       			<div class="form-row mb-4">
					<label class="col-form-label col-4">Name</label>
					<div class="col-8 validate">
						<sf:input type="text" path="name" class="form-control"
							placeholder="Category Name" /> 
					</div>
				</div>
       			<div class="form-row mb-4">				
					<label class="col-form-label col-4">Description</label>
					<div class="col-8 validate">
						<sf:textarea path="description" class="form-control"
							placeholder="Enter category description here!" /> 
					</div>
				</div>	        	        
				<div class="form-row">				
					<div class="col-4 offset-4">					
						<input type="submit" name="submit" value="Save" class="btn btn-primary"/>						
					</div>
				</div>	        
	        </sf:form>
	      </div>
	    </div>
	  </div>
	</div>
	</div>
	
	<hr/>	
	<h1>Available Households</h1>
	<hr/>
	
	<div class="row">
		<div class='col-12'>
			<div class="table-responsive-xl">
				<table id="adminProductsTable" class="table table-striped table-bordered table-hover">	
					<thead>					
						<tr>					
							<th>Id</th>
							<th>&#160;</th>
							<th>Name</th>
							<th>Qty. Avail</th>
							<th>Unit Price</th>
							<th>Activate</th>				
							<th>Edit</th>
						</tr>					
					</thead>			
				</table><br/>
			</div>
		</div>
	</div>
	
</div>