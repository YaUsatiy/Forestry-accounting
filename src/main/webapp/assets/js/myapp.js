$(function() {
	switch (menu) {
	case 'About Us':
		$('#about').addClass('active');
		break;
	case 'Contact Us':
		$('#contact').addClass('active');
		break;
	case 'All products':
		$('#listProducts').addClass('active');
		break;
	case 'All loggers':
		$('#listLoggers').addClass('active');
		break;
	case 'Product Management':
	case 'Orders Management':
	case 'Reviews Management':
	case 'Logger Management':
		$('#adminDrop').addClass('active');
		break;
	case 'My Orders':
	case 'Shopping Cart':
		$('#userDrop').addClass('active');
		break;
	default:
		if (menu == 'Home')
			break;
		$('#listProducts').addClass('active');
		$('#a_' + menu).addClass('active');
		break;
	}

	// ---------------------------------
	var $table = $('#productListTable');

	if ($table.length) {
		var jsonUrl = '';
		if (window.categoryId == '') {
			jsonUrl = window.contextRoot + '/json/data/all/products';
		} else {
			jsonUrl = window.contextRoot + '/json/data/category/'
					+ window.categoryId + '/products';
		}
		$table
				.DataTable({
					aaSorting: [],
					lengthMenu : [ [ 3, 5, 10, -1 ],
							[ '3 Records', '5 Records', '10 Records', 'ALL' ] ],
					pageLength : 5,
					ajax : {
						url : jsonUrl,
						dataSrc : ''
					},
					columns : [
							{
								data : 'code',
								bSortable : false,
								mRender : function(data, type, row) {
									return '<img src="' + window.contextRoot
											+ '/resources/images/' + data
											+ '.jpg" class="dataTableImg"/>';
								}
							},
							{
								data : 'name'
							},
							{
								data : 'unitPrice',
								mRender : function(data, type, row) {
									return '&#36; ' + data
								}
							},
							{
								data : 'quantity',
								mRender : function(data, type, row) {
									if (data < 1) {
										return '<span style="color : red">Out of stock!</span>';
									}
									return data;
								}
							},
							{
								data : 'id',
								bSortable : false,
								mRender : function(data, type, row) {
									var str = '<div class="row">';
									str += '<div class="col-5"><a href="'
											+ window.contextRoot
											+ '/show/'
											+ data
											+ '/product" class="btn btn-info"><i class="fas fa-eye"></i></a></div>&#160';
									if (userRole != 'ADMIN') {
										if (row.quantity < 1) {
											str += '<div class="col-5"><a href="javascript:void(0)" class="btn btn-success disabled"><i class="fas fa-cart-plus"></i></a></div>';
										} else {
											str += '<div class="col-5"><a href="'
													+ window.contextRoot
													+ '/cart/add/'
													+ data
													+ '/product" class="btn btn-success"><i class="fas fa-cart-plus"></i></a></div></div>';
										}
									} else {
										str += '<div class="col-5"><a href="'
											+ window.contextRoot
											+ '/manage/'
											+ data
											+ '/product" class="btn btn-warning"><i class="fas fa-edit"></i></a></div></div>';
									}
									return str;
								}
							} ]
				})
	}

	// ---------------------------------
	// list of all loggers
	var $loggersTable = $('#loggersListTable');

	if ($loggersTable.length) {
		var	jsonUrl = window.contextRoot + '/json/data/all/loggers';

		$loggersTable
			.DataTable({
				aaSorting: [],
				lengthMenu : [ [ 2, 5, 10, -1 ],
					[ '2 Loggers', '5 Loggers', '10 Loggers', 'ALL' ] ],
				pageLength : 5,
				ajax : {
					url : jsonUrl,
					dataSrc : ''
				},
				columns : [
					{
						data : 'code',
						bSortable : false,
						mRender : function(data, type, row) {
							return '<img src="' + window.contextRoot
								+ '/resources/images/' + data
								+ '.jpg" class="loggerTableImg"/>';
						}
					},
					{
						data : 'name'
					},
					{
						data : 'seniority',
						mRender : function(data, type, row) {
							return  data + ' years'
						}
					},
					{
						data : 'company',
						mRender : function(data, type, row) {
							return  data + '&#169; '
						}
					},
					{
						data : 'id',
						bSortable : false,
						mRender : function(data, type, row) {
							var str = '<div class="row">';
							str += '<div class="col-5"><a href="'
								+ window.contextRoot
								+ '/show/'
								+ data
								+ '/logger" class="btn btn-info"><i class="fas fa-eye"></i></a></div>&#160';
							if (userRole === 'ADMIN') {
								str += '<div class="col-5"><a href="'
									+ window.contextRoot
									+ '/manage/'
									+ data
									+ '/logger" class="btn btn-warning"><i class="fas fa-edit"></i></a></div></div>';
							}
							return str;
						}
					} ]
			})
	}

	// ---------------------------------
	// alert block
	$alert = $('.alert');
	if ($alert.length) {
		setTimeout(function() {
			$alert.fadeOut('slow');
		}, 5000);
	}
	// ---------------------------------

	// list of all products for admin
	var $productsTable = $('#adminProductsTable');

	if ($productsTable.length) {

		var jsonUrl = window.contextRoot + '/json/data/admin/all/products';
		console.log(jsonUrl);

		$productsTable
				.DataTable({
					lengthMenu : [ [ 10, 30, 50, -1 ],
							[ '10 Records', '30 Records', '50 Records', 'ALL' ] ],
					pageLength : 30,
					ajax : {
						url : jsonUrl,
						dataSrc : ''
					},
					columns : [
							{
								data : 'id'
							},
							{
								data : 'code',
								bSortable : false,
								mRender : function(data, type, row) {
									return '<img class="adminDataTableImg" src="'
											+ window.contextRoot
											+ '/resources/images/'
											+ data
											+ '.jpg" class="dataTableImg"/>';
								}
							},
							{
								data : 'name'
							},
							{
								data : 'quantity',
								mRender : function(data, type, row) {

									if (data < 1) {
										return '<span style="color:red">Out of Stock!</span>';
									}

									return data;

								}
							},
							{
								data : 'unitPrice',
								mRender : function(data, type, row) {
									return '&#36; ' + data
								}
							},
							{
								data : 'active',
								bSortable : false,
								mRender : function(data, type, row) {
									var str = '';
									if (data) {
										str += '<label class="switch"> <input type="checkbox" value="'
												+ row.id
												+ '" checked="checked">  <div class="slider round"> </div></label>';

									} else {
										str += '<label class="switch"> <input type="checkbox" value="'
												+ row.id
												+ '">  <div class="slider round"> </div></label>';
									}

									return str;
								}
							},
							{
								data : 'id',
								bSortable : false,
								mRender : function(data, type, row) {

									var str = '';
									str += '<a href="'
											+ window.contextRoot
											+ '/manage/'
											+ data
											+ '/product" class="btn btn-success"><i class="fas fa-edit"></i></a> &#160;';
									return str;
								}
							} ],

					initComplete : function() {
						var api = this.api();
						api
								.$('.switch input[type="checkbox"]')
								.on(
										'change',
										function() {
											var dText = (this.checked) ? 'You want to activate the Product?'
													: 'You want to de-activate the Product?';
											var checked = this.checked;
											var checkbox = $(this);
											debugger;
											bootbox
													.confirm({
														size : 'medium',
														title : 'Product Activation/Deactivation',
														message : dText,
														callback : function(
																confirmed) {
															if (confirmed) {
																$
																		.ajax({
																			type : 'GET',
																			url : window.contextRoot
																					+ '/manage/product/'
																					+ checkbox
																							.prop('value')
																					+ '/activation',
																			timeout : 100000,
																			success : function(
																					data) {
																				bootbox
																						.alert(data);
																			},
																			error : function(
																					e) {
																				bootbox
																						.alert('ERROR: '
																								+ e);
																			}
																		});
															} else {
																checkbox
																		.prop(
																				'checked',
																				!checked);
															}
														}
													});
										});

					}
				});
	}

	// jQuery Validation Code for category
	function errorPlacement(error, element) {
		// Add the 'help-block' class to the error element
		error.addClass("help-block");

		// add the error label after the input element
		error.insertAfter(element);

		// add the has-feedback class to the
		// parent div.validate in order to add icons to inputs
		element.parents(".validate").addClass("has-feedback");

	}

	// validating the product form element
	// fetch the form element
	$categoryForm = $('#categoryForm');

	if ($categoryForm.length) {

		$categoryForm.validate({
			rules : {
				name : {
					required : true,
					minlength : 3
				},
				description : {
					required : true,
					minlength : 5
				}
			},
			messages : {
				name : {
					required : 'Please enter product name!',
					minlength : 'Please enter at least three characters'
				},
				description : {
					required : 'Please enter product name!',
					minlength : 'Please enter at least five characters'
				}
			},
			errorElement : "em",
			errorPlacement : function(error, element) {
				errorPlacement(error, element);
			}
		}

		);

	}

	// validating login form
	$loginForm = $('#loginForm');

	if ($loginForm.length) {

		$loginForm.validate({
			rules : {
				username : {
					required : true,
					email : true
				},
				password : {
					required : true,
					minlength : 3
				}
			},
			messages : {
				username : {
					required : 'Please enter the username!',
					email : 'Please enter valid email addresss!'
				},
				password : {
					required : 'Please enter the password!',
					minlength : 'Please enter at least three characters here!'
				}
			},
			errorElement : "em",
			errorPlacement : function(error, element) {
				errorPlacement(error, element);
			}
		}

		);

	}
	
	// validating credit card form
	$creditCardForm = $('#creditCardForm');

	if ($creditCardForm.length) {

		$creditCardForm.validate({
			rules : {
				number : {
					required : true,
					minlength : 16,
					maxlength: 16
				},
				exp : {
					required : true,
					minlength : 5,
					maxlength: 5
				},
				cvv : {
					required : true,
					minlength : 3,
					maxlength: 3
				}
			},
			messages : {
				number : {
					required : 'Please enter card number!',
					minlength : 'Please enter exactly sixteen numbers!',
					maxlength : 'Please enter exactly sixteen numbers!'
				},
				exp : {
					required : 'Please enter card expiration date!',
					minlength : 'Please enter exactly five characters!',
				    maxlength : 'Please enter exactly five characters!'
				},
				cvv : {
					required : 'Please enter cvv code (the 3-digit code on back)!',
					minlength : 'Please enter exactly three digits!',
					maxlength : 'Please enter exactly three digits!'
				}
			},
			errorElement : "em",
			errorPlacement : function(error, element) {
				errorPlacement(error, element);
			}
		}

		);

	}
	
	/*--------------------*/
	/* handle refresh cart*/	
	$('button[name="refreshCart"]').click(function(){
		var cartLineId = $(this).attr('value');
		var countField = $('#count_' + cartLineId);
		var originalCount = countField.attr('value');
		// do the checking only the count has changed
		if(countField.val() !== originalCount) {	
			// check if the quantity is within the specified range
			if(countField.val() < 1 || countField.val() > 3) {
				// set the field back to the original field
				countField.val(originalCount);
				bootbox.alert({
					size: 'medium',
			    	title: 'Error',
			    	message: 'Product Count should be minimum 1 and maximum 3!'
				});
			}
			else {
				// use the window.location.href property to send the request to the server
				var updateUrl = window.contextRoot + '/cart/' + cartLineId + '/update?count=' + countField.val();
				window.location.href = updateUrl;
			}
		}
	});
	
	/*--------------------*/
	/* handle checkout cart*/	
	$('button[name="checkout"]').click(function(){
		var i;
		var val = $(this).attr('value');
		for (i = 1; i <= val; i++) {
			var cartLineId = $('button[name="refreshCart"]').attr('value');
			var countField = $('#count_' + cartLineId);
			var originalCount = countField.attr('value');
			console.log(countField.attr('value'));
			console.log(originalCount);
			// do the checking only the count has changed
			if(countField.val() !== originalCount) {	
				// set the field back to the original field
				countField.val(originalCount);
				bootbox.alert({
					size: 'medium',
			    	title: 'Error',
			    	message: 'Product Count should be refreshed using refresh button!'
				});
			}
		}
		var updateUrl = window.contextRoot + '/cart/validate';
		window.location.href = updateUrl;
	});
})