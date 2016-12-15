<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" 
           uri="http://java.sun.com/jsp/jstl/functions" %>
<c:import url="/WEB-INF/jsp/header.jsp" />
<section>
<div class="container">

<div class="row">
<div class="col-sm-4"></div>
<div class="col-sm-4">
<c:url var="formAction" value="/employer" />
<form method="GET" action="${formAction}">
<div class="emp">
<h3 class="heading">Search By</h3>
<div>
<ul class="styleforul">
<li><label class="labelstyle">Course Language  </label>
<input type="text" name="courseLanguage" value="${courseLanguage}"/></li>
<li><label class="labelstyled">Highest Degree </label>
<select id="degree" name="degree">

<c:choose>

<c:when test="${degree=='High school'}">
<option value=""></option>
<option value="High school" selected>High school</option>
<option value="Bachelor's degree">Bachelor's Degree</option>
<option value="Master's degree">Master's Degree</option>
<option value="Doctoral">Doctoral</option></c:when>

<c:when test="${degree=='Bachelor\\'s degree'}">
<option value=""></option>
<option value="High school">High school</option>
<option value="Bachelor's degree" selected>Bachelor's Degree</option>
<option value="Master's degree">Master's Degree</option>
<option value="Doctoral">Doctoral</option></c:when>

<c:when test="${degree=='Master\\'s degree'}">
<option value=""></option>
<option value="High school">High school</option>
<option value="Bachelor's degree">Bachelor's Degree</option>
<option value="Master's degree" selected>Master's Degree</option>
<option value="Doctoral">Doctoral</option></c:when>

<c:when test="${degree=='Doctoral'}">
<option value=""></option>
<option value="High school">High school</option>
<option value="Bachelor's degree">Bachelor's Degree</option>
<option value="Master's degree">Master's Degree</option>
<option value="Doctoral" selected>Doctoral</option></c:when>

<c:otherwise>
<option value="" selected></option>
<option value="High school">High school</option>
<option value="Bachelor's degree">Bachelor's Degree</option>
<option value="Master's degree">Master's Degree</option>
<option value="Doctoral">Doctoral</option>
</c:otherwise>
</c:choose>
</select></li>
<li><label class="labelstyle">Prior Experience </label>
<input type="text" name="experience" value="${experience}"/></li>

<li><label class="labelstyle">Skills </label>
<input type="text" name="technologies" value="${technologies}"/></li>
</ul>
</div>

<div>
<input type="submit" value="Search" class="search"/>
</div>
</div>
</form>
<div class="col-sm-4"></div>
</div>
</div>
</div>
<div class="container">
		<div class="row">
		<c:choose>
			<c:when test="${studentList!=null && fn:length(studentList) lt 1}">
			<p class="notFound"><strong>Results not found!!</strong></p>
			</c:when>
		<c:otherwise>
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
								</div>
							</c:when>
						</c:choose>
				</c:forEach>
			</c:otherwise>
			</c:choose>
			<div class="col-sm-4"></div>
		</div>
		
</div>


</section>


<c:import url="/WEB-INF/jsp/footer.jsp" />