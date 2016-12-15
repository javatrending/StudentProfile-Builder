<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<section>

	<div class="container" style="padding-top: 60px;">
  		<h1><c:out value="${student.firstName}"/> <c:out value="${student.lastName}'s Portfolio"/></h1>
  	<div class="row">
  	
    
    
    
    <div class="col-md-10">
      
        <div class="table-responsive responsiv-table">
  		<c:forEach var="project" items="${projectList}"> 
  		<table class="table" id="portfolioTable">
      		
      		<tbody>
      		
     			<tr id="portfolioTitle"> 
        			<td><c:out value="${project.projectName}"/></td> 
        		</tr>
        		
     			<tr>      
        			<td id="projectTypeRow">
        			<c:choose>
        				<c:when test="${project.projectType=='Individual'}">
        					<span class="glyphicon glyphicon-user"></span> 
        				</c:when>
        				<c:otherwise>
        					<span class="glyphicon glyphicon-user"></span><span class="glyphicon glyphicon-user"></span>  	
        				</c:otherwise>
        			</c:choose>
        			</td> 
     			</tr> 
     			
     			<tr>  
        			<td id="portfolioDescription"><c:out value="${project.description}"/></td> 
     			</tr>
     			
     			<tr>
        			<td id="portfolioBtn">
        				<c:set var="userCheck" value="${currentUser.userType}"/>
        				<c:choose>
        					<c:when test="${userCheck == 'student'}">
								<c:url var="editPortfolioAction" value="editStudentPortfolio?project_id=${project.project_id}" />
								<form id="editStudentPortfolio" method="GET" action="${editPortfolioAction}">
								<button type="submit" class="btn btn-info pull-right marginBottom20" value="${project.project_id}" id="submit" name="project_id">Edit Project</button>
								</form>
							</c:when>
					</c:choose>
					</td>	
				</tr>
     			
			
     		</tbody>
        </table>
        </c:forEach>
        <div class="col-md-8">
        <c:url var="addProjectAction" value="addProject?userName=${userName}"/>
        <form id="addProject" method="GET" action="${addProjectAction}">
				<button type="submit" class="btn btn-info" value="${userName}" name="userName">Add Project</button>
				</form>
				
				</div>
      	
        </div>
        </div>
      
        
        
    </div>
    </div> 
    

</section>
<c:import url="/WEB-INF/jsp/footer.jsp" />