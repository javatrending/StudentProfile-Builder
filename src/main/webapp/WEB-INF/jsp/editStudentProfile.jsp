<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />
<section>

<div class="container">
	<c:url var="formAction" value="editStudentProfile?userName=${editedProfile.username}" />
	<form class="form-horizontal" id="editStudentForm" method="POST" action="${formAction}">
<%-- <input type="hidden" value="${CSRF_TOKEN}" name="CSRF_TOKEN"/> --%>
	<div class="row">
		<div class="col-sm-11">
			<h2 class="register">Edit Your Profile</h2>
			
			<div class="form-group">
				<label class="col-lg-3 control-label">Summary:</label>
          		<div class="col-lg-8">
					<textarea class="form-control" rows="5" name="summary">${editedProfile.summary}</textarea></div>
          	</div>
			<div class="form-group">
				<label class="col-lg-3 control-label">First name:</label>
          		<div class="col-lg-8">
            		<input class="form-control" value="${editedProfile.firstName}" name="firstName" type="text">
          		</div>
          	</div>
          	<div class="form-group">
				<label class="col-lg-3 control-label">Last name:</label>
          		<div class="col-lg-8">
            		<input class="form-control" value="${editedProfile.lastName}" name="lastName" type="text">
          		</div>
          	</div>
          	<div class="form-group">
				<label class="col-lg-3 control-label">Street Address:</label>
          		<div class="col-lg-8">
            		<input class="form-control" value="${editedProfile.streetAddress}" name="staddress" type="text">
          		</div>
          	</div>
          	<div class="form-group">
				<label class="col-lg-3 control-label">City:</label>
          		<div class="col-lg-8">
            		<input class="form-control" value="${editedProfile.city}" name="city" type="text">
          		</div>
          	</div>
          	<div class="form-group">
          		<label class="col-lg-3 control-label" id="stateOption" for="state">State:</label> 
					<select name="state" id="state">
						<option value="AL">Alabama</option>
						<option value="AK">Alaska</option>
						<option value="AZ">Arizona</option>
						<option value="AR">Arkansas</option>
						<option value="CA">California</option>
						<option value="CO">Colorado</option>
						<option value="CT">Connecticut</option>
						<option value="DE">Delaware</option>
						<option value="DC">District Of Columbia</option>
						<option value="FL">Florida</option>
						<option value="GA">Georgia</option>
						<option value="HI">Hawaii</option>
						<option value="ID">Idaho</option>
						<option value="IL">Illinois</option>
						<option value="IN">Indiana</option>
						<option value="IA">Iowa</option>
						<option value="KS">Kansas</option>
						<option value="KY">Kentucky</option>
						<option value="LA">Louisiana</option>
						<option value="ME">Maine</option>
						<option value="MD">Maryland</option>
						<option value="MA">Massachusetts</option>
						<option value="MI">Michigan</option>
						<option value="MN">Minnesota</option>
						<option value="MS">Mississippi</option>
						<option value="MO">Missouri</option>
						<option value="MT">Montana</option>
						<option value="NE">Nebraska</option>
						<option value="NV">Nevada</option>
						<option value="NH">New Hampshire</option>
						<option value="NJ">New Jersey</option>
						<option value="NM">New Mexico</option>
						<option value="NY">New York</option>
						<option value="NC">North Carolina</option>
						<option value="ND">North Dakota</option>
						<option value="OH">Ohio</option>
						<option value="OK">Oklahoma</option>
						<option value="OR">Oregon</option>
						<option value="PA">Pennsylvania</option>
						<option value="RI">Rhode Island</option>
						<option value="SC">South Carolina</option>
						<option value="SD">South Dakota</option>
						<option value="TN">Tennessee</option>
						<option value="TX">Texas</option>
						<option value="UT">Utah</option>
						<option value="VT">Vermont</option>
						<option value="VA">Virginia</option>
						<option value="WA">Washington</option>
						<option value="WV">West Virginia</option>
						<option value="WI">Wisconsin</option>
						<option value="WY">Wyoming</option>
					</select>
          	</div>
          	<div class="form-group">
				<label class="col-lg-3 control-label">Post Code:</label>
          		<div class="col-lg-8">
            		<input class="form-control" value="${editedProfile.postCode}" name ="postcode" type="text">
          		</div>
          	</div>
          	<div class="form-group">
				<label class="col-lg-3 control-label">Phone Number:</label>
          		<div class="col-lg-8">
            		<input class="form-control" value="${editedProfile.phoneNumber}" name="phno" type="text">
          		</div>
          	</div>
          	<div class="form-group">
				<label class="col-lg-3 control-label">Email:</label>
          		<div class="col-lg-8">
            		<input class="form-control" value="${editedProfile.emailAddress}" name="email" type="text">
          		</div>
          	</div>
          	<div class="form-group">
				<label class="col-lg-3 control-label">Programming Language:</label>
				<c:choose>
				
						<c:when test="${editedProfile.courseLanguage=='.net'}">
							<label class="radio-inline"><input type="radio" name="lang" value=".net" checked="checked">.net</label>
							<label class="radio-inline" id="radioEdit"><input type="radio" name="lang" value="java">Java</label>
						</c:when>
						<c:otherwise>
							<label class="radio-inline"><input type="radio" name="lang" value=".net">.net</label>
							<label class="radio-inline" id="radioEdit"><input type="radio" name="lang" value="java" checked="checked">Java</label>
						</c:otherwise>
				</c:choose>
			</div>
          	<div class="form-group">
				<label class="col-lg-3 control-label">Degree:</label>
				<c:choose>
				<c:when test="${editedProfile.academicBackground=='High school'}">
				<label class="radio-inline" id="radioEdit"><input type="radio" name="degree" value="High school" checked="checked">High school</label>
				<label class="radio-inline"><input type="radio" name="degree" value="Bachelor's degree">Bachelor's degree</label>
				<label class="radio-inline"><input type="radio" name="degree" value="Master's degree">Master's degree</label>
				<label class="radio-inline"><input type="radio" name="degree" value="Doctoral">Doctoral</label>
				</c:when>
				
				<c:when test="${editedProfile.academicBackground=='Bachelor\\'s degree'}">
				<label class="radio-inline" id="radioEdit"><input type="radio" name="degree" value="High school">High school</label>
				<label class="radio-inline"><input type="radio" name="degree" value="Bachelor's degree" checked="checked">Bachelor's degree</label>
				<label class="radio-inline"><input type="radio" name="degree" value="Master's degree">Master's degree</label>
				<label class="radio-inline"><input type="radio" name="degree" value="Doctoral">Doctoral</label>
				</c:when>
				
				<c:when test="${editedProfile.academicBackground=='Master\\'s degree'}">
				<label class="radio-inline" id="radioEdit"><input type="radio" name="degree" value="High school" checked="checked">High school</label>
				<label class="radio-inline"><input type="radio" name="degree" value="Bachelor's degree" >Bachelor's degree</label>
				<label class="radio-inline"><input type="radio" name="degree" value="Master's degree" checked="checked">Master's degree</label>
				<label class="radio-inline"><input type="radio" name="degree" value="Doctoral">Doctoral</label>
				</c:when>
				
				<c:otherwise>
			<label class="radio-inline" id="radioEdit"><input type="radio" name="degree" value="High school">High school</label>
				<label class="radio-inline"><input type="radio" name="degree" value="Bachelor's degree">Bachelor's degree</label>
				<label class="radio-inline"><input type="radio" name="degree" value="Master's degree">Master's degree</label>
				<label class="radio-inline"><input type="radio" name="degree" value="Doctoral" checked="checked">Doctoral</label>
				</c:otherwise>
				</c:choose>
          	</div>
          	<div class="form-group">
				<label class="col-lg-3 control-label">Professional Experience:</label>
          		<div class="col-lg-8">
            		<input class="form-control" value="${editedProfile.careerExperience}" name="exp" type="text">
          		</div>
          	</div>
          	<div class="form-group">
				<label class="col-lg-3 control-label">Skills:</label>
          		<div class="col-lg-8">
            		<input class="form-control" value="${editedProfile.skills}" name="skills" type="text">
          		</div>
          	</div>
          	<div class="form-group">
				<label class="col-lg-3 control-label">Interests:</label>
          		<div class="col-lg-8">
            		<input class="form-control" value="${editedProfile.interests}" name="interests" type="text">
          		</div>
          	</div>	
          		
         </div>
         	<label class="col-md-3 control-label"></label>
			<div class="col-md-8">
				<button type="submit" class="btn btn-info">Save</button>
				
          	</div>	
          		
			
		</div>
		

	</form>
</div>


</section>
<c:import url="/WEB-INF/jsp/footer.jsp" />