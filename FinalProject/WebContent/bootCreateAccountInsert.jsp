<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bootTest.jsp</title>

<style type="text/css">
	.help-block{ color:#b94a48; }
</style>

<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

</head>
<body>



<!------ Include the above in your HEAD tag ---------->

<div class="container">

		<!-- 메뉴 영역 -->
	<div>
	<c:import url="MenuNavbar.jsp"></c:import>
	</div>

	<!-- 콘텐츠 영역 -->
	


	<div class="row">
	<form class="form-horizontal">
<fieldset>

<!-- Form Name -->
<legend>::: Addmission</legend>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="full_name">Full Name</label>
  <div class="controls">
    <input id="full_name" name="full_name" placeholder="Enter your full name" class="input-xlarge" type="text">
    <p class="help-block">Error</p>
  </div>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="father_name">Father's Name</label>
  <div class="controls">
    <input id="father_name" name="father_name" placeholder="Enter Your Father" class="input-xlarge" type="text">
    <p class="help-block">Error</p>
  </div>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="mother_name">Mother's Name</label>
  <div class="controls">
    <input id="mother_name" name="mother_name" placeholder="placeholder" class="input-xlarge" type="text">
    <p class="help-block">Error</p>
  </div>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="email">Email</label>
  <div class="controls">
    <input id="email" name="email" placeholder="Enter Your Email." class="input-xlarge" type="text">
    <p class="help-block">Error</p>
  </div>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="mobile">Mobile No.</label>
  <div class="controls">
    <input id="mobile" name="mobile" placeholder="Enter Your Mobile Number" class="input-xlarge" type="text">
    <p class="help-block">Error</p>
  </div>
</div>

<!-- Appended Input-->
<div class="control-group">
  <label class="control-label" for="dob">Date of Birth</label>
  <div class="controls">
    <div class="input-append">
      <input id="dob" name="dob" class="input-large" placeholder="YYYY-MM-DD" type="text">
      <span class="add-on">DOB</span>
    </div>
    <p class="help-block">Error</p>
  </div>
</div>

<!-- Multiple Radios (inline) -->
<div class="control-group">
  <label class="control-label" for="gender">Gender</label>
  <div class="controls">
    <label class="radio inline" for="gender-0">
      <input name="gender" id="gender-0" value="Male" checked="checked" type="radio">
      Male
    </label>
    <label class="radio inline" for="gender-1">
      <input name="gender" id="gender-1" value="Female" type="radio">
      Female
    </label>
  </div>
</div>

<!-- Select Basic -->
<div class="control-group">
  <label class="control-label" for="course">Apply For</label>
  <div class="controls">
    <select id="course" name="course" class="input-xlarge">
      <option>Select Course</option>
      <option>Computer Course</option>
      <option>University Course</option>
      <option>Other Course</option>
    </select>
  </div>
</div>

<!-- Textarea -->
<div class="control-group">
  <label class="control-label" for="Address">Address</label>
  <div class="controls">                     
    <textarea id="Address" name="Address">Address</textarea>
  </div>
</div>

<!-- File Button --> 
<div class="control-group">
  <label class="control-label" for="photo">Photo</label>
  <div class="controls">
    <input id="photo" name="photo" class="input-file" type="file">
  </div>
</div>

<!-- Button -->
<div class="control-group">
  <label class="control-label" for="submit"></label>
  <div class="controls">
    <button id="submit" name="submit" class="btn btn-primary">Submit</button>
  </div>
</div>

</fieldset>
</form>

	</div>
</div>