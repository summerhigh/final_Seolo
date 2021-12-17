<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login.jsp</title>
</head>
<body>

<div>
	<h1>서로</h1>
</div>

<div>
	<form action="">
		아이디 <input type="text" /> <br>
		비밀번호 <input type="text" /> <br>
		<button type="submit">로그인</button>
	</form>
</div>

<br>

<div>
	<a href="">비밀번호 찾기</a>
	<a href="">아이디 찾기</a>
	<a href="">회원가입</a>
</div>



</body>
</html> -->


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<!-- 참조: 상대경로 지정 필요 -->
<!-- <link rel="icon" href="../../favicon.ico"> -->

<title>Login.jsp</title>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- 부트스트랩 -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- 폰트: Noto Sans Korean -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<style type="text/css">
a {
	font-family: 'Noto Sans Korean';
}
</style>

<!-- 위 CSS 로 갈음될 듯 -->
<!-- 
Bootstrap core CSS
<link href="../../dist/css/bootstrap.min.css" rel="stylesheet">

Custom styles for this template
<link href="signin.css" rel="stylesheet">
-->

<!-- 참조: 상대경로 지정 필요 -->
<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<!-- <script src="../../assets/js/ie-emulation-modes-warning.js"></script> -->

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--
[if lt IE 9]>
     <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
     <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]
-->

</head>

<body>

	<div class="container">

		<form class="form-signin">
			<h2 class="form-signin-heading">Please sign in</h2>
			<label for="inputId" class="sr-only">Id</label>
			<input type="text" id="inputId" class="form-control" placeholder="Id" required autofocus>
			<label for="inputPassword" class="sr-only">Password</label>
			<input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
			
			<!-- 로그인 저장 -->
			<div class="checkbox">
				<label> <input type="checkbox" value="remember-me"> Remember me
				</label>
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
		</form>

		<br>
		<div style="text-align: center;">
			<a href="">비밀번호 찾기</a>
			|
			<a href="">아이디 찾기</a>
			|
			<a href="">회원가입</a>
		</div>
	</div>
	<!-- /container -->

	<!-- 참조: 상대경로 지정 필요 -->
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<!-- <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script> -->

	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="js/bootstrap.min.js"></script>

</body>
</html>
