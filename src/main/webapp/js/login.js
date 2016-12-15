	

$(document).ready(function () {
	
		$("#loginForm").validate({
			debug:true,
			rules : {
				userName : {
					required : true
				},
				password : {
					required : true
				}
			},
			messages : {			
				confirmPassword : {
					equalTo : "Passwords do not match"
				}
			},
			errorClass : "error"
		});
	



	$("#myBtn").click(function(){
		$("#myModal").modal();
	});
});


