<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>	
<%@include file="../../shared/flow-header.jsp"%>	

<div class="container">

	<div class="row">
		<!--  To display all the goods -->
		<div class="col-6">
			
			<div class="row mt-3">
				<c:forEach items="${checkoutModel.cartLines}" var="cartLine">
				<div class="col-12">
					<div>
						<h3>${cartLine.product.name}</h3>
						<hr/>
						<h5>Quantity -${cartLine.productCount}</h5>
						<h5>Buying Price - &#36; ${cartLine.buyingPrice}</h5>							
					</div>						
					<hr/>
					<div class="text-right">
						<h4>Grand Total - &#36; ${cartLine.total}</h4>
					</div>						
				</div>
				</c:forEach>
			</div>
		</div>
		
		<div class="col-md-6">	                
               <div class="container-fluid py-3">
			    <div class="row">
			        <div class="col-12 mx-auto">
			            <div id="pay-invoice" class="card mt-3">
			                <div class="card-body">
			                    <div class="card-title">
			                        <h3 class="text-center">Payment Details</h3>
			                    </div>
			                    <hr>
			                    <sf:form class="form" id="creditCardForm" method="POST">
			                    	<input type="hidden" name="_eventId" value="pay" />	
			                        <div class="form-group">
			                            <label for="number" class="col-form-label mb-1" >Card number</label>
			                            <input id="number" name="number" type="tel" class="form-control" required/>
			                        </div>
			                        <div class="row">
			                            <div class="col-6">
			                                <div class="form-group">
			                                    <label for="exp" class="col-form-label mb-1">Expiration</label>
			                                    <input id="exp" name="exp" type="tel" class="form-control" required placeholder="MM / YY"/>
			                                </div>
			                            </div>
			                            <div class="col-6">
			                                <label for="cvv" class="col-form-label mb-1">CVV</label>
			                                <div class="input-group">
			                                    <input id="cvv" name="cvv" type="tel" class="form-control" required/>
			                                    <div class="input-group-append">
			                                        <div class="input-group-text">
			                                        <span class="fa fa-question-circle fa-lg" data-toggle="popover" data-container="body" data-html="true" data-title="CVV" 
			                                        data-content="<div class='text-center one-card'>The 3 digit code on back of the card..<div class='visa-mc-cvc-preview'></div></div>"
			                                        data-trigger="hover"></span>
			                                        </div>
			                                    </div>
			                                </div>
			                            </div>
			                        </div>
			                        <div>
			                            <button name="_eventId_pay" id="payment-button" type="submit" class="btn btn-lg btn-info btn-block">
			                                <i class="fa fa-lock fa-lg"></i>&nbsp;
			                                <span id="payment-button-amount">Pay </span>
			                                <span id="payment-button-sending" style="display:none;">Sending...</span>
			                            </button>
			                        </div>
			                    </sf:form>
			                </div>
			            </div>
			        </div>
			    </div>
			</div>
			<h4 class="mt-5 text-center"><span class="badge badge-primary"> &#36; ${checkoutModel.checkoutTotal}</span> Final Payment</h4>			
		</div>
	</div>
</div>

<%@include file="../../shared/flow-footer.jsp"%>