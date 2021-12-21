<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<title>pwdReset.jsp</title>

<!-- Bootstrap core CSS -->
<link href="<%=cp%>/css/bootstrap.min.css" rel="stylesheet">

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>

<!-- Custom styles for this template -->
<link href="<%=cp%>/css/floating-labels.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		
		// 비밀번호 유효성 검사 (8~12자의 하나 이상의 문자와 숫자 및 특수문자를 포함)
		$("#newPwd").on("change keyup paste", function()
		{
			var pw_RegExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,12}$/;
			var pw = $("#newPwd").val();
			
			// value값이 없을경우
			if ($("#newPwd").val() == "")
			{
				$("#pwErrMsg").html("");
				return;
			}
			
			if (!pw_RegExp.test(pw))
			{
				$("#pwErrMsg").html("8~12자의 하나 이상의 문자와 숫자 및 특수문자를 포함하여 입력하여 주세요");
				$("#pwErrMsg").css({"color" : "red", "font-size" : "10px"});
				return;
			}
			$("#pwErrMsg").html("");

		});
		
		
		// 비밀번호 확인
		$("#confirmPwd").on("change keyup paste", function()
		{
			
			if ($("#newPwd").val() != $("#confirmPwd").val() && $("#confirmPwd").val() != "")
			{
				$("#confirmPwdErrMsg").text("비밀번호가 일치하지 않습니다.");
				$("#confirmPwdErrMsg").css({"color" : "red", "font-size" : "10px"});				
			}
			else if ($("#newPwd").val() == $("#confirmPwd").val())
			{
				$("#confirmPwdErrMsg").html("");
			}
		});	
	
		
		// submit버튼 유효성 확인 
		$("#submitBtn").click(function()
		{
					
			$("#pwdResetForm").attr("action", "pwdupdate.action?userId=" + $("#userId").val()
									+ "&newPwd=" + $("#newPwd").val());	
			
			
			if ($("#newPwd").val() == "")
			{
				$("#pwErrMsg").text("비밀번호를 입력하여주세요.");
				$("#pwErrMsg").css({"color" : "red", "font-size" : "12px"});
				return false;
			}
			
			if ($("#confirmPwd").val() == "")
			{
				$("#confirmPwdErrMsg").text("비밀번확인을 입력하여주세요.");		
				$("#confirmPwdErrMsg").css({"color" : "red", "font-size" : "12px"});
				return false;
			}
			
			
			
			$("#pwdResetForm").submit();
		
		});
		
	});
	
	

</script>



</head>
<body>
	<!-- 메뉴바 영역 -->
	<div>
		<c:import url="/nav.action"></c:import>
	</div>
	
	<!-- 아이디 찾기 -->
	<form class="form-signin" id="pwdResetForm" method="post">
		<div class="text-center mb-4">
			<h1 class="h3 mb-3 font-weight-normal">비밀번호 재설정</h1>
			<p>비밀번호를 변경해 주세요.</p>
		</div>
		
		<div class="form-label-group">
			<input type="password" id="newPwd" class="form-control" maxlength="12">
			<label for="newPwd">새 비밀번호</label>
			<span id="pwErrMsg"></span>
		</div>
		<div class="form-label-group">
			<input type="password" id="confirmPwd" class="form-control" maxlength="12">
			<label for="confirmPwd">새 비밀번호 확인</label>
			<span id="confirmPwdErrMsg"></span>
		</div>
		
		<div class="text-center mb-4">
		</div>

		<button class="btn btn-lg btn-primary btn-block" id="submitBtn">확인</button>
		<input type="hidden" id="userId" value="${id }">
	</form>
	
	
</body>
</html>
