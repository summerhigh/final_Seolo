<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<title>Login.jsp</title>
<link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/sign-in/">

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
<link href="<%=cp%>/css/signin.css" rel="stylesheet">
</head>
<body>
	<!-- 메뉴바 영역 -->
	<div>
		<c:import url="/nav.action"></c:import>
	</div>
	
	<!-- 로그인 영역 -->
	<div class="container text-center">
		<form action="login.action" class="form-signin" id="loginForm">
			<h1 class="h3 mb-3 font-weight-normal">로그인</h1>
			<label for="id" class="sr-only">ID</label>
			<input type="text" id="id" name="id" class="form-control" placeholder="User ID" required autofocus>
			<label for="pwd" class="sr-only">Password</label>
			<input type="password" id="pwd" name="pwd" class="form-control" placeholder="Password" required>
			
			<!-- 로그인 상태 유지 기능 -->
			<div class="checkbox mb-3">
				<label>
					<input type="checkbox" value="remember-me"> 로그인 상태 유지
				</label>
			</div>
			
			<button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
			<p></p>
			<p class="mt-5 mb-3 text-muted"><a href="">아이디 찾기</a> / <a href="">비밀번호 찾기</a> /  <a href="">회원가입</a></p>
			<p></p>
			<button type="button" class="btn btn-outline-secondary btn-sm">ADMIN</button>
		</form>
	</div>
</body>
</html>