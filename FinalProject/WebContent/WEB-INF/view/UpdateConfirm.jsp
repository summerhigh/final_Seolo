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
<title>WithdrawalConfirm.jsp</title>

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
		$("#submitBtn").click(function()
		{
			$("#updateConfirm").submit();
		});
	});


</script>

</head>
<body>
	<!-- 메뉴바 영역 -->
	<div>
		<c:import url="/nav.action"></c:import>
	</div>
	
	<div class="container">
	<!-- 비밀번호 확인 -->
		<form class="form-signin" action="infoupdateconfirm.action" method="post" id="updateConfirm">
        <c:if test="${errMsg != null}">
            <div class="alert alert-primary alert-dismissible fade show text-center" role="alert" id="errMsg">
                <strong>비밀번호가 <br>올바르지 않습니다!</strong>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                   <span aria-hidden="true">&times;</span>
                </button>
            </div>
        </c:if>
         
			<div class="text-center mb-4">
				<h1 class="h3 mb-3 font-weight-normal">회원정보 수정</h1>
				<h3 class="h4 mb-3 font-weight-normal">비밀번호 확인</h3>
				<p>본인 확인을 위해 비밀번호를 한번 더 입력해주세요.</p>
			</div>
			
			<div class="form-label-group">
                <input type="text" id="id" name="id" class="form-control" readonly="readonly" value="${userLogin.getPe_Id() }" required>
                <label for="id">아이디</label>
			</div>
			<div class="form-label-group">
                <input type="password" id="pwd" name="pwd" class="form-control" required autofocus>
                <label for="pwd">비밀번호</label>
			</div>
	
			<button class="btn btn-lg btn-primary btn-block" type="submit" id="submitBtn">확인</button>
			<button class="btn btn-lg btn-secondary btn-block" id="returnBtn" onclick="history.back()">취소</button>
		</form>
	</div>

</body>
</html>
