<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<section>

	<c:url var="formAction" value="editStudentPortfolio?project_id=${project.project_id}" />
	<form class="form-horizontal" id="editPortfolio" method="POST" action="${formAction}">
<%-- <input type="hidden" value="${CSRF_TOKEN}" name="CSRF_TOKEN"/> --%>

	<div class="row">
		<div class="col-sm-11">
			<h2 class="register">Edit Project</h2>
			
				<div class="form-group">
				<label class="col-lg-3 control-label">Project Name:</label>
          		<div class="col-lg-8">
					<input type="text" class="form-control"name="projectName" value="${project.projectName}"/>
          		</div>
          		</div>
          		
          		<div class="form-group">
				<label class="col-lg-3 control-label">Project Type:</label>
					<c:choose>
						<c:when test="${project.projectType=='Group'}">
							<label class="radio-inline" id="radioEdit"><input type="radio" name="projectType" value="Group" checked>Group</label>
							<label class="radio-inline" id="radioEdit"><input type="radio" name="projectType" value="Individual">Individual</label>
							
						</c:when>
						<c:otherwise>
							<label class="radio-inline" id="radioEdit"><input type="radio" name="projectType" value="Group">Group</label>
							<label class="radio-inline" id="radioEdit"><input type="radio" name="projectType" value="Individual" checked>Individual</label>
						</c:otherwise>
					</c:choose>
				</div>
					
          		<div class="form-group">
				<label class="col-lg-3 control-label">Project Description:</label>
          		<div class="col-lg-8">
            		<textarea class="form-control" rows="5" name="description">${project.description}</textarea>
          		</div>
          		</div>

	 
         	<label class="col-md-3 control-label"></label>
			<div class="col-md-8">
				<button type="submit" class="btn btn-info">Save</button>
				<input type="hidden" name="userName" value="${project.userName}"/>
			</div>
			
    </div>	
	</div>
	</form>



	
        












</section>
<c:import url="/WEB-INF/jsp/footer.jsp" />