<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery/3.1.1/jquery.js"></script>
	<script src="http://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.js"></script>
	<script src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/additional-methods.js "></script>

<section>
	<script type="text/javascript">
		$(document).ready(function () {
		
			$("#loginForm").validate({
				
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
		});
	</script>
	
	<c:url var="formAction" value="/login" />
	<form id="loginForm" method="POST" action="${formAction}">
<%-- <input type="hidden" value="${CSRF_TOKEN}" name="CSRF_TOKEN"/> --%>
	<div class="row">
		<div class="col-sm-4"></div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="userName">User Name</label>
				<input type="text" id="userName" name="userName" placeHolder="User Name" class="form-control" />
			</div>
			<div class="form-group">
				<label for="password">Password</label>
				<input type="password" id="password" name="password" placeHolder="Password" class="form-control" />
			</div>
			<button type="submit" class="btn btn-info">Login</button>
		</div>
		
		<div class="col-sm-4"></div>
	</div>
	
</form>
</section>
<c:import url="/WEB-INF/jsp/footer.jsp" />