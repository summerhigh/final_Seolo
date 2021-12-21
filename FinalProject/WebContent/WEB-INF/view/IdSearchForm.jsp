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
<title>IdSearchForm.jsp</title>

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

		// 이름 유효성 검사 (특수문자,영어,숫자는 사용할수 없음. 최소 2~10자 이상)
		$("#name").on("change keyup paste", function()
		{
			var n_RegExp = /^[가-힣]{2,10}$/; //이름 유효성검사 정규식
			var name = $("#name").val();	
			
			// value값이 없을경우
			if ($("#name").val() == "")
			{
				$("#nameErrMsg").html("");
				return;
			}
			
	        if(!n_RegExp.test(name)){  //아이디 유효성검사
				$("#nameErrMsg").html("2~10자의 한글만 입력하여주세요.");
				$("#nameErrMsg").css({"color" : "red" , "font-size" : "small"});
	            return;
	        }
	        
	        $("#nameErrMsg").html("");
		});		
		
		// 전화번호 유효성 검사(숫자만 입력)
		$("#tel").on("keyup", function() 
		{ 
			$("#telErrMsg").html("");
			$(this).val($(this).val().replace(/[^0-9]/g,""));
			
		});
		
		
		// submit 전 유효성검사 → submit
		$("#submitBtn").click(function()
		{
			if ($("#name").val() == "")
			{
				$("#nameErrMsg").html("이름을 입력해주세요.");
				$("#nameErrMsg").css({"color" : "red" , "font-size" : "small"});
				$("#name").focus();
				return false;
			}
			
			if ($("#tel").val() == "")
			{
				$("#telErrMsg").html("휴대폰 번호를 입력해주세요.");
				$("#telErrMsg").css({"color" : "red" , "font-size" : "small"});
				$("#telErrMsg").focus();
				return false;
			}
			
			$("#idSearchForm").submit();
			
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
	<form class="form-signin" action="idsearch.action" method="post" id="idSearchForm">
		<div class="text-center mb-4">
			<h1 class="h3 mb-3 font-weight-normal">아이디 찾기</h1>
			<p>회원정보에 등록한 이름과 휴대전화 번호를 통해<br>인증할 수 있습니다.</p>
		</div>
		
		<div class="form-label-group">
			<input type="text" id="name" name="name" class="form-control" maxlength="10">
			<label for="name">이름</label>
			<span id="nameErrMsg" class="errMsg"></span>
		</div>
		<div class="form-label-group">
			<input type="text" id="tel" name="tel" class="form-control" maxlength="11">
			<label for="tel">휴대폰 번호 (숫자만 입력)</label>
			<span id="telErrMsg" class="errMsg"></span>
		</div>

		<button class="btn btn-lg btn-primary btn-block"  id="submitBtn">아이디 찾기</button>
	</form>



</body>
</html>
