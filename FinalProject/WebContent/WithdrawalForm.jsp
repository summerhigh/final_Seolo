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
<meta charset="UTF-8">
<title>WithdrawalForm.jsp</title>
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

#errMsg {
	color: red;
	font-weight: bold;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		
		$("#submitBtn").click(function()
		{
			var result = confirm("탈퇴 시 6개월간 재가입을 할 수 없습니다. 정말로 탈퇴하시겠습니까?");

	        if (result)
	        {
	        	$("#withdrawalForm").submit();
	        }
		});
		
		$("#returnBtn").click(function()
		{
			// 마이페이지로 돌아가는 링크...
		});
		
	});


</script>
</head>
<body>

	<!-- 메뉴바 영역 -->
	<div>
		<c:import url="/nav.action"></c:import>
	</div>
	<div class="container" style="margin-top: 80px; margin-bottom: 80px;">
		<div class="jumbotron">
			<h1>회원 탈퇴</h1>
			<p class="lead">회원 탈퇴를 신청하기 전에 안내사항을 꼭 확인해주세요.</p>
		</div>
		<div>
			<ul class="list-group list-group-flush">
			  <li class="list-group-item">1. 탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.
			  삭제를 원하는 게시글이 있다면 탈퇴 전 삭제를 부탁드립니다.</li>
			  <li class="list-group-item">2. 탈퇴 후 6개월간은 같은 휴대폰번호로 재가입이 불가능합니다.</li>
			  <li class="list-group-item">3. 아이디, 이름, 전화번호를 제외한 정보는 탈퇴 시 즉시 파기됩니다.</li>
			  <li class="list-group-item">4. 탈퇴일 이후 6개월이 경과하면 아이디, 이름, 전화번호 정보 또한 모두 파기됩니다.</li>
			  <li class="list-group-item">5. 탈퇴 후에는 본 사이트의 회원용 서비스를 이용할 수 없습니다.</li>
			</ul>
		</div>
		
		<div style="margin-top: 30px;">
			<form action="" id="withdrawalForm">
				<div class="form-group form-check">
				    <input type="checkbox" class="form-check-input" id="exampleCheck1">
				    <label class="form-check-label" for="exampleCheck1"><strong>안내사항을 확인하였으며, 이에 동의합니다.</strong></label>
				</div>
				
				<hr style="margin: 50px 0;">
				
				<h3 class="h3 mb-3 font-weight-normal">서비스 탈퇴 사유</h3>
				<div class="card">
				  <div class="card-body">
				    <div class="form-check">
					  <input class="form-check-input" type="radio" name="wirNo" id="wirNo1" value="1">
					  <label class="form-check-label" for="wirNo1">1. 콘텐츠 내용 부족</label>
					</div>
					<div class="form-check">
					  <input class="form-check-input" type="radio" name="wirNo" id="wirNo2" value="2">
					  <label class="form-check-label" for="wirNo2">2. 서비스 이용 불편</label>
					</div>
					<div class="form-check">
					  <input class="form-check-input" type="radio" name="wirNo" id="wirNo3" value="3">
					  <label class="form-check-label" for="wirNo3">3. 시스템 장애</label>
					</div>
					<div class="form-check">
					  <input class="form-check-input" type="radio" name="wirNo" id="wirNo4" value="4">
					  <label class="form-check-label" for="wirNo4">4. 개인정보 노출 우려</label>
					</div>
					<div class="form-check">
					  <input class="form-check-input" type="radio" name="wirNo" id="wirNo5" value="5">
					  <label class="form-check-label" for="wirNo5">5. 기타</label>
					</div>
					
					<div style="margin: 30px 0;">
						<h5 class="h5 font-weight-normal">탈퇴 상세 사유</h5>
						<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="의견을 자유롭게 작성해주세요. 사이트의 발전에 큰 도움이 됩니다."></textarea>
					</div>

				  </div>
				</div>
				
				<div class="text-center" style="margin-top: 30px;">
					<span id="errMsg"></span><br>
					<button type="button" class="btn btn-primary btn-lg" id="returnBtn">돌아가기</button>
					<button type="button" class="btn btn-secondary btn-lg" id="submitBtn">탈퇴하기</button>
				</div>
				
			</form>
		</div>
		
	</div>

</body>
</html>