<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student Profile Builder</title>
<link rel="stylesheet" href="css/techedUp.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<script type="text/javascript">
$(document).ready(function () {
	$("#myBtn").click(function(){
		$("#myModal").modal();
	});
});
</script>

</head>
<body>

	<section class="container-fullwidth">
		<div class="row">
			<div class="col-sm-12 jumbotron">
				<div class="text-center">
					<c:url var="homePageHref" value="/"/>
					<h1><a href="${homePageHref}"><span class="homeLogo">code</span>Connection()</a></h1>
					<h2 >You need code.</h2>
					<h3>We write code.</h3>
					<h3>all day...</h3>
					<h3>everyday.</h3>
					<c:set var="userCheck" value="${currentUser}"/>
					<c:choose>
						<c:when test="${userCheck != null}">
							<c:url var="loginHref" value="/studentMyProfile?userName=${currentUser}"/>
							<a href="${loginHref}" id="flip" class="btn btn-lg btn-success">My Profile</a>
							<c:url var="loginHref" value="/logout"/>
							<a href="${loginHref}" id="flip" class="btn btn-lg btn-info">Log Out</a>
						</c:when>
						<c:when test="${userCheck == null}">
							<button type="button" class="btn btn-info btn-lg" id="myBtn">Login</button>
							<div class="modal fade" id="myModal" role="dialog">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4><span class="glyphicon glyphicon-lock"></span>Login</h4>
										</div>
										<div class="modal-body">
											<c:url var="formAction" value="/login"/>
											<form role="form" method="POST" action="${formAction}">
												<div class="form-group">
													<label for="psw"><span class="glyphicon glyphicon-user"></span>Username</label>
													<input type="text" class="form-control" name="userName" placeholder="Enter Username">
												</div>
												<div class="form-group">
													<label for="psw"><span class="glyphicon glyphicon-eye-open"></span>Password</label>
													<input type="password" class="form-control" name="password" placeholder="Enter password">
												</div>
												<button type="submit" class="btn btn-info btn-block"><span></span>Login</button>
		 									</form>
										</div>
									</div>
								</div>
							</div>
						</c:when>
					</c:choose>	
				</div>
			</div>
		</div>
	</section>
		
	<section class="container pull-left">
		<div class="row">
			<div class="col-sm-6">
				<img class="img-responsive img-circle" src="img/lean_dog.png" alt="Tutoring session"/>
			</div>
			<div class="col-sm-6 text-center homeInfoText textBox ">
				<h3>Just browsing?</h3>
				<h3>click the link</h3>
				<h3>below and meet</h3>
				<h3>the team!</h3>
				<c:url var="studentListHref" value="/studentList"/>
				<a href="${studentListHref}" class="btn btn-lg btn-success">HERE</a>
			</div>
		</div>
	</section>
	
	<section class="container pull-right">
		<div class="row">
			<div class="col-sm-6 text-center homeInfoText textBox">
				<h1>Sam dropping some</h1>
				<h1>knowledge.</h1>
			</div>
			<div class="col-sm-6">
				<img class="img-responsive img-circle" src="img/sam_photo.png" alt="Tutoring session"/>
			</div>
		</div>
	</section>
	

	

<c:import url="/WEB-INF/jsp/footer.jsp" />