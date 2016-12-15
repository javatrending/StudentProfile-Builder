<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<section>
	<script type="text/javascript">
		$(document).ready(function () {
		
			$("#createUserForm").validate({
				
				rules : {
					userName : {
						required : true
					},
					password : {
						required : true,
						minlength : 5
					},
					confirmPassword :{
						required : true,
						equalTo : "#password"
					}
				},
				messages : {			
					confirmPassword : {
						equalTo : "Passwords do not match"
					},
					password : {
						equalTo : "Password must be at least 5 characters long"
					}
				},
				errorClass : "error"
			});
		});
	</script>
<div class="container">

<c:url var="formAction" value="/createUser" />
<form id="createUserForm" method="POST" action="${formAction}">
<%-- <input type="hidden" value="${CSRF_TOKEN}" name="CSRF_TOKEN"/> --%>
	<div class="row">
		<div class="col-sm-4"></div>
		<div class="col-sm-4">
				<div>
				<c:out value="${msg}"/>
 				</div> 
			<div class="form-group">
				<label for="userName">User Name</label>
				<input type="text" id="userName" name="userName" placeHolder="User Name" class="form-control" />
			</div>
			<div class="form-group">
				<span>User Type</span>
				<select name="userType">
					<option value="staff">Staff</option>
					<option value="student">Student</option>
					<option value="employer">Employer</option>
				</select>
			</div>
			<div class="form-group">
				<label for="password">Password</label>
				<input type="password" id="password" name="password" placeHolder="Password" class="form-control" />
			</div>
			<div class="form-group">
				<label for="confirmPassword">Confirm Password</label>
				<input type="password" id="confirmPassword" name="confirmPassword" placeHolder="Re-Type Password" class="form-control" />	
			</div>
			<button type="submit" class="btn btn-info">Create User</button>
		</div>
		
		<div class="col-sm-4"></div>
	</div>
	
</form>
</div>
</section>
<c:import url="/WEB-INF/jsp/footer.jsp" />