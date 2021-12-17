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

</head>
<body>
	<!-- 메뉴바 영역 -->
	<div>
		<c:import url="MenuNavbar_new.jsp"></c:import>
	</div>
	
	<!-- 아이디 찾기 -->
	<form class="form-signin">
		<div class="text-center mb-4">
			<h1 class="h3 mb-3 font-weight-normal">아이디 찾기</h1>
			<p>회원정보에 등록한 이름과 휴대전화 번호를 통해<br>인증할 수 있습니다.</p>
		</div>
		
		<div class="form-label-group">
			<input type="text" id="name" name="name" class="form-control" required autofocus>
			<label for="name">이름</label>
		</div>
		<div class="form-label-group">
			<input type="text" id="tel" name="tel" class="form-control" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required>
			<label for="tel">휴대폰 번호 (숫자만 입력)</label>
		</div>

		<button class="btn btn-lg btn-primary btn-block" type="submit">아이디 찾기</button>
	</form>



</body>
</html>
