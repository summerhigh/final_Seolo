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
<title>IdSearch.jsp</title>

<link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/starter-template/">

<!-- Bootstrap core CSS -->
<link href="<%=cp%>/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">

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
<link href="<%=cp%>/css/starter-template.css" rel="stylesheet">
</head>
<body>
	<!-- 메뉴바 영역 -->
	<div>
		<c:import url="MenuNavbar_new.jsp"></c:import>
	</div>

	<!-- 본문 영역 -->
	<div class="container">
		<div class="starter-template">
			<h3>아이디 찾기 결과</h3>
			<hr class="mb-4">
			
			<c:choose>
				<c:when test="${result == 0 }">
					<div class="card" id="yesResult">
						<div class="card-body">
			    			고객님의 정보와 일치하는 아이디가 존재하지 않습니다.
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="card" id="yesResult">
						<div class="card-body" >
			    			고객님의 정보와 일치하는 아이디는 <span style="font-weight: bold;">${id }</span> 입니다.
						</div>
					</div>
				</c:otherwise>
			</c:choose>
			
		</div>
	</div>

</body>
</html>