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
<title>MyInfo.jsp</title>
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
<link href="<%=cp %>/css/starter-template.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

<script type="text/javascript">
	
	$(function()
	{
		$("#updateBtn").click(function()
		{
			alert("수정");
		});
		
		$("#pwdUpdateBtn").click(function()
		{
			alert("비번");
		});
		
	});
	
</script>

</head>
<body>
	<div>
		<c:import url="/nav.action"></c:import>
	</div>
	<div class="contaner">
		<div class="starter-template">
			<h1>내 정보 수정</h1>
		</div>
		
		<hr style="width: 60%;">
		
		<div class="starter-template">
			<!-- 프로필사진 업로드구역 -->
			<div class="col-md-4 mx-auto">
				<img src="<%=cp %>/images/profile.jpg">
			</div>
			
			<hr class="col-md-7 mx-auto" style="margin: 50px 0;">
			
			<table class="table col-md-7 mx-auto">
				  <tbody>
				    <tr>
				      <th scope="row" class="col-md-2 table-secondary">사용자 ID</th>
				      <td class="col-md-5">Mark</td>
				    </tr>
				    <tr>
				      <th scope="row" class="col-md-2 table-secondary">사용자 이름</th>
				      <td>Jacob</td>
				    </tr>
				    <tr>
				      <th scope="row" class="col-md-2 table-secondary">닉네임</th>
				      <td>Larry</td>
				    </tr>
				    <tr>
				      <th scope="row" class="col-md-2 table-secondary">휴대전화</th>
				      <td>Larry</td>
				    </tr>
				    <tr>
				      <th scope="row" class="col-md-2 table-secondary">이메일</th>
				      <td>Larry</td>
				    </tr>
				    <tr>
				      <th scope="row" class="col-md-2 table-secondary">주소</th>
				      <td>Larry</td>
				    </tr>
				  </tbody>
			</table>
			<br>
			<button type="button" class="btn btn-primary" id="updateBtn">수정하기</button>
			<button type="button" class="btn btn-primary" id="pwdUpdateBtn">비밀번호 변경하기</button>
		</div>
	</div>
</body>
</html>