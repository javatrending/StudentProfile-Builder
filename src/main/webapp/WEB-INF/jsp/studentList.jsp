<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<section>
	
	<h2 class="centerAlign">Meet The Students</h2>
	
	<div class="container">
		<div class="row">
				<c:forEach var="student" items="${studentList}">  
					<c:url var="studentProfileHref" value="/studentProfile?userName=${student.username}"/>
					<c:set var="courseLanguage" value="${student.courseLanguage}"/>
						<c:choose>
							<c:when test="${courseLanguage != 'java'}">
								<div class="col-sm-4 student">
										<div>
											<a href="${studentProfileHref}"><img class="img-responsive listPic" src="img/small_java_bear.png" alt="profile photo"/></a>
										</div>									
									<c:set var="languagePhoto" value="img/dot_net_logo_2.png"/>
									<a href="${studentProfileHref}" class="list-group-item centerAlign nameLink"><c:out value="${student.firstName}"/></a>
									<p class="cohort"><c:out value="${student.cohort}"/></p><img class="language" src="${languagePhoto}" alt=<c:out value="${student.courseLanguage}"/>>
								</div>
							</c:when>
							<c:when test="${courseLanguage == 'java'}">
								<div class="col-sm-4 student">
										<div>
											<a href="${studentProfileHref}"><img class="img-responsive listPic" src="img/small_java_bear.png" alt="profile photo"/></a>
										</div>									
									<c:set var="languagePhoto" value="img/java.png"/>
									<a href="${studentProfileHref}" class="list-group-item centerAlign nameLink"><c:out value="${student.firstName}"/></a>
									<p class="cohort"><c:out value="${student.cohort}"/></p><img class="language" src="${languagePhoto}" alt=<c:out value="${student.courseLanguage}"/>>
								</div>
							</c:when>
						</c:choose>
				</c:forEach>
				<div class="col-sm-4"></div>
		</div>
	</div>
</section>
<c:import url="/WEB-INF/jsp/footer.jsp" />