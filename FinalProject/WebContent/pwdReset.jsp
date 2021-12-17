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

</head>
<body>
	<!-- 메뉴바 영역 -->
	<div>
		<c:import url="/nav.action"></c:import>
	</div>
	
	<!-- 아이디 찾기 -->
	<form class="form-signin">
		<div class="text-center mb-4">
			<h1 class="h3 mb-3 font-weight-normal">비밀번호 재설정</h1>
			<p>비밀번호를 변경해 주세요.</p>
		</div>
		
		<div class="form-label-group">
			<input type="text" id="newPwd" name="newPwd" class="form-control" required autofocus>
			<label for="newPwd">새 비밀번호</label>
		</div>
		<div class="form-label-group">
			<input type="text" id="confirmPwd" name="confirmPwd" class="form-control" required>
			<label for="confirmPwd">새 비밀번호 확인</label>
		</div>
		
		<div class="text-center mb-4">
			<p>8자 이상 16자 이하로 설정해주세요.</p>
			<p>영문, 숫자, 특수문자를 함께 사용하면 보다 안전합니다.</p>
		</div>

		<button class="btn btn-lg btn-primary btn-block" type="submit">확인</button>
	</form>
	
	
	
</body>
</html>
