<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />
<section>
	<div class= "container ">
			<div class="row">
				<div class="col-sm-4"></div>
				<div class="col-sm-4">
			<h2>Welcome <c:out value="${currentUser.userName}"/></h2>
					<div class="btn-group btn-group-justified">
						<c:url var="createUserHref" value="/createUser?userName=${currentUser.userName}"/>
						<a class="btn btn-primary" href="${createUserHref}">Create User</a>
					</div>
				<div class="col-sm-4"></div>
				</div>
			</div>
	</div>
</section>
<c:import url="/WEB-INF/jsp/footer.jsp" />