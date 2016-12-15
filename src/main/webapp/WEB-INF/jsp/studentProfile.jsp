<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<section>
	
	
	<div class="container" style="padding-top: 60px;">
  	<h1 class="page-header"><c:out value="${student.firstName}"/></h1>
  		<div class="row">
    	<!-- left column -->
    		<div class="col-md-4 col-sm-6 col-xs-12">
      		<div class="text-center">
        <img src="img/small_java_bear.png" class="avatar img-circle" id="javaBear" alt="avatar">
      </div>
    </div>

	<div class="col-md-8 col-sm-6 col-xs-12 personal-info">
      
      
        <div class="col-md-8">
        <h3>Summary</h3>
        	<c:out value="${student.summary}"/>
		<h3>Portfolio Project Titles</h3>
        <div class="table-responsive responsive-table">
  		<table class="table">
      		<tbody>
      		<c:forEach var="projects" items="${projectList}">
     			<tr>      
        			<td><span class="glyphicon glyphicon-align-justify" id="space"></span> <c:out value="${projects.projectName}"/></td> 
     			</tr>
     		</c:forEach>
     		</tbody>
     	</table>
     	</div>

	
	
	</div>
	</div>
</section>
<c:import url="/WEB-INF/jsp/footer.jsp" />