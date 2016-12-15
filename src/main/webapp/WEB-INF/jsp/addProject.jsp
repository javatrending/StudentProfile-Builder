<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<section>
     
	<c:url var="formAction" value="addProject" />
	<form class="form-horizontal" id="addProject" method="POST" action="${formAction}">
<%-- <input type="hidden" value="${CSRF_TOKEN}" name="CSRF_TOKEN"/> --%>
<input type="hidden" value="${userName}" name="userName">
	<div class="row">
		<div class="col-sm-11">
			<h2 class="register">Add New Project</h2>
			
				<div class="form-group">
				<label class="col-lg-3 control-label">Project Name:</label>
          		<div class="col-lg-8">
					<input type="text" class="form-control"name="projectName" />
          		</div>
          		</div>
          		
          		<div class="form-group">
				<label class="col-lg-3 control-label">Project Type:</label>
				<label class="radio-inline" id="radioEdit"><input type="radio" name="projectType" value="Group">Group</label>
							<label class="radio-inline" id="radioEdit"><input type="radio" name="projectType" value="Individual">Individual</label>
		</div>
					
          		<div class="form-group">
				<label class="col-lg-3 control-label">Project Description:</label>
          		<div class="col-lg-8">
            		<textarea class="form-control" rows="5" name="description"></textarea>
          		</div>
          		</div>

	 
         	<label class="col-md-3 control-label"></label>
			<div class="col-md-8">
				<button type="submit" class="btn btn-info">Save</button>
				
			</div>
			
    </div>	
	</div>
	</form>
</section>
<c:import url="/WEB-INF/jsp/footer.jsp" />