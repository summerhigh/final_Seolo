<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SecondScoreInsertForm.jsp</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
<style type="text/css">
	.text-essential 
	{
		color: #FFA7A7;
	}
</style>

</head>
<body>
	<!-- 체크리스트 작성 뷰 페이지 : 추가항목 작성 페이지! -->

	<!-- 메뉴바 영역 -->
	<div>
		<c:import url="MenuNavbar_new.jsp"></c:import>
	</div>

	<!-- 본문 영역 -->
	<div class="container">
	
		<div class="py-5 text-center">
			<h2 style="margin-top: 50px;">체크리스트 추가항목 작성</h2>
			<p class="lead">추가할 항목을 자유롭게 작성해주세요.</p>
		</div>


		<!-- 폼 시작 -->
		<form class="needs-validation" novalidate="">
			<div class="form-group row" style="align-items: center; display: flex; justify-content: center;">
			    <label for="title" class="col-sm-2 col-form-label">추가항목 제목</label>
			    <div class="col-sm-7">
			      <input type="text" class="form-control" id="title" name="title"
			       placeholder="ex) 주변 도서관 상태(점수), 고척돔까지(시간)">
			    </div>
			</div>
			<div class="form-group row" style="align-items: center; display: flex; justify-content: center;">
			    <label for="title" class="col-sm-2 col-form-label">코멘트</label>
			    <div class="col-sm-7">
			      <input type="text" class="form-control" id="title" name="title"
			       placeholder="ex) 도서관이 가깝고 도서관 규모도 짱크고 완전 새삥이라 만족~!!">
			    </div>
			</div>
			
			
			<div class="col-sm-2">
			    	<!-- 이 버튼을 누르면 인서트 되고 다시 이 페이지로 redirect. -->
			    	<button type="button" class="btn btn-secondary btn-sm">항목추가</button>
			    </div>
			
			

		</form>
		
	</div> <!-- 컨테이너 -->


</body>
</html>