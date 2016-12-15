<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student Profile Builder</title>
<link rel="stylesheet" href="css/techedUp.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="http://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.js"></script>
<script src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/additional-methods.js "></script>
</head>
<body>
	<section>
		<div class="container-fullwidth jumbotron">
			<div class="row">
				<div class="col-sm-12">
					<ul class="pills text-center">
						<c:url var="homePageHref" value="/homePage"/>
						<li><h1><a href="${homePageHref}"><span class="homeLogo">code</span>Connection()</a></h1></li>
					</ul>
					<div class="btn-group btn-group pull-right">
						<c:set var="userCheck" value="${currentUser.userName}"/>
						<c:set var="userTypeCheck" value="${currentUser.userType}"/>
						<c:choose>
							<c:when test="${userCheck != null && userTypeCheck != 'employer' && userTypeCheck != 'staff'}">
								<c:url var="studentRosterHref" value="/studentMyProfile?userName=${currentUser.userName}"/>
								<a class="btn btn-info" href="${studentRosterHref}">My Profile</a>
								<c:url var="studentPortfolioHref" value="/studentPortfolio?userName=${currentUser.userName}"/>
								<a class="btn btn-info" href="${studentPortfolioHref}">My Portfolio</a>
								<c:url var="studentRosterHref" value="/authStudentList"/>
								<a class="btn btn-info" href="${studentRosterHref}">View Roster</a>
								<c:url var="createUserHref" value="/logout"/>
								<a class="btn btn-info" href="${createUserHref}">Logout</a>
							</c:when>
							<c:when test="${userCheck != null && userTypeCheck == 'employer'}">
								<c:url var="myPageHref" value="/employer?userName=${currentUser.userName}"/>
								<a class="btn btn-info" href="${myPageHref}">My Page</a>
								<c:url var="studentRosterHref" value="/authStudentList"/>
								<a class="btn btn-info" href="${studentRosterHref}">View Roster</a>
								<c:url var="createUserHref" value="/logout"/>
								<a class="btn btn-info" href="${createUserHref}">Logout</a>
								</c:when>
							<c:when test="${userCheck != null && userTypeCheck == 'staff'}">
								<c:url var="myPageHref" value="/staff?userName=${currentUser.userName}"/>
								<a class="btn btn-info" href="${myPageHref}">My Page</a>
								<c:url var="studentRosterHref" value="/authStudentList"/>
								<a class="btn btn-info" href="${studentRosterHref}">View Roster</a>
								<c:url var="createUserHref" value="/logout"/>
								<a class="btn btn-info" href="${createUserHref}">Logout</a>
							</c:when>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</section>
		
	
