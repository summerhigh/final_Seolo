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
<title>pwdSearchForm1.jsp</title>

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
			<h1 class="h3 mb-3 font-weight-normal">비밀번호 찾기</h1>
			<p>비밀번호를 찾고자 하는 아이디를 입력해 주세요.</p>
		</div>
		
		<div class="form-label-group">
			<input type="text" id="id" name="id" class="form-control" required autofocus>
			<label for="id">아이디</label>
		</div>
		<button class="btn btn-lg btn-primary btn-block" type="submit">다음</button>
		
		<div class="text-center mb-4">
			<p class="mt-5 mb-3 text-muted">아이디가 기억나지 않는다면? <a href="">아이디 찾기</a></p>
		</div>
		
	</form>



</body>
</html>
