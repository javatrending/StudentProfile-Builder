$(document).ready( function() {

	$("#createUserForm").validate({
		
		debug: true,
		rules: {
			userName: {
				required: true,
			},
			password: {
				required: true,
				minlength: 5,
			},
			confirmPassword : {
				required : true,		
				equalTo : "#password"  
			}
		},
		messages : {
			password: {
				minlength: "Password must be more than 5 characters"
			},
			confirmPassword : {
				equalTo : "Passwords do not match"
			}
		},
		errorClass : "error"
	});
	
});