<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />
<section>
		<div class="container">
			<h2 class="centerAlign">Cohort Roster</h2>
			<div class="row">
					<c:forEach var="student" items="${studentList}">  
						<c:url var="studentProfileHref" value="/authStudentProfile?userName=${student.username}"/>
						<c:set var="courseLanguage" value="${student.courseLanguage}"/>
							<c:choose>
								<c:when test="${courseLanguage != 'java'}">
									<div class="col-sm-4 student">
										<div>
											<a href="${studentProfileHref}"><img class="img-responsive listPic" src="img/small_java_bear.png" alt="profile photo"/></a>
										</div>										
										<c:set var="languagePhoto" value="img/dot_net_logo_2.png"/>
										<a href="${studentProfileHref}" class="list-group-item centerAlign nameLink"><c:out value="${student.firstName}"/> <c:out value="${student.lastName}"/></a>
										<p class="cohort"><c:out value="${student.cohort}"/></p><img class="language" src="${languagePhoto}" alt=<c:out value="${student.courseLanguage}"/>>
										<p class="cohort"><c:out value="${student.emailAddress}"/>
										<p class="cohort"><c:out value="${student.phoneNumber}"/>
									</div>
								</c:when>
								<c:when test="${courseLanguage == 'java'}">
									<div class="col-sm-4 student">
										<div>
											<a href="${studentProfileHref}"><img class="img-responsive listPic" src="img/small_java_bear.png" alt="profile photo"/></a>
										</div>
										<c:set var="languagePhoto" value="img/java.png"/>
										<a href="${studentProfileHref}" class="list-group-item centerAlign nameLink"><c:out value="${student.firstName}"/> <c:out value="${student.lastName}"/></a>
										<p class="cohort"><c:out value="${student.cohort}"/></p><img class="language" src="${languagePhoto}" alt=<c:out value="${student.courseLanguage}"/>>
										<p class="cohort"><c:out value="${student.emailAddress}"/>
										<p class="cohort"><c:out value="${student.phoneNumber}"/>
									</div>
								</c:when>
							</c:choose>
					</c:forEach>
					<div class="col-sm-4"></div>
			</div>
		</div>
</section>
<c:import url="/WEB-INF/jsp/footer.jsp" />