<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<section>
	
	
	<div class="container" style="padding-top: 60px;">
  	<h1 class="page-header"><c:out value="${student.firstName}"/> <c:out value="${student.lastName}"/></h1>
  		<div class="row">
    	<!-- left column -->
    		<div class="col-md-4 col-sm-6 col-xs-12">
      		<div class="text-center">
        <img src="img/small_java_bear.png" class="avatar img-circle" id="javaBear" alt="avatar">
        <h4> <c:out value="${student.courseLanguage}"/> </h4>
      </div>
    </div>
    
    <!-- right column -->
    <div class="col-md-8 col-sm-6 col-xs-12 personal-info">
        <div class="col-md-8">
        <h3>Summary</h3>
        	<c:out value="${student.summary}"/>
        <h3>Personal Info</h3>
        <div class="table-responsive responsive-table">
  		<table class="table">
      		<tbody>
     			<tr>      
        			<td>FirstName:</td>
        			<td><c:out value="${student.firstName}"/></td> 
     			</tr>
     			<tr>      
        			<td>LastName:</td>
        			<td><c:out value="${student.lastName}"/></td> 
     			</tr>
     			<tr>      
        			<td>Address:</td>
        			<td><c:out value="${student.streetAddress}, "/><span><c:out value="${student.city}, ${student.state} ${student.postCode} "/></span></td> 
     			</tr>
     			<tr>    
        			<td>Phone Number:</td>
        			<td><c:out value="${student.phoneNumber}"/></td>       
     			</tr>
     			<tr>    
        			<td>Email:</td>
        			<td><c:out value="${student.emailAddress}"/></td>       
     			</tr>
     			
     		</tbody>
        </table>			
        </div>
 		
 		<h3>Student Info</h3>
        <div class="table-responsive responsive-table">
  		<table class="table">
      		<tbody>   			
     			<tr>    
        			<td>Cohort:</td>
        			<td><c:out value="${student.cohort}"/></td>       
     			</tr>
     			<tr>    
        			<td>Programming Language:</td>
        			<td><c:out value="${student.courseLanguage}"/></td>       
     			</tr>
     			<tr>    
        			<td>Degree:</td>
        			<td><c:out value="${student.academicBackground}"/></td>       
     			</tr>
     			<tr>    
        			<td>Professional Experience:</td>
        			<td><c:out value="${student.careerExperience}"/></td>       
     			</tr>
     			<tr>    
        			<td>Skills:</td>
        			<td><c:out value="${student.skills}"/></td>       
     			</tr>
     			<tr>    
        			<td>Interests:</td>
        			<td><c:out value="${student.interests}"/></td>       
     			</tr>
     					
     		</tbody>
        </table>
	        <div class="col-md-8">
				<c:url var="portfolioAction" value="studentPortfolio?userName=${student.username}" />
				<form id="portfolioAction" method="GET" action="${portfolioAction}">
					<button type="submit" class="btn btn-info" value="${student.username}" id="submit" name="userName">View Portfolio</button>
				</form>
			</div>			
        </div>
      </div>
      </div>
          
	</div>
	</div>
	
	
</section>
<c:import url="/WEB-INF/jsp/footer.jsp" />