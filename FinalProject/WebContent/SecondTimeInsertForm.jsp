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
	<!-- 점수 추가항목 작성 페이지! -->

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

			<div class="container">
				<div class="mb-3">
					<label for="title">추가항목 제목</label> <input type="text"
						class="form-control" id="title"
						placeholder="ex) 고척돔까지 걸리는 시간" required="">
					<div class="invalid-feedback">필수 입력 사항입니다.</div>
				</div>
				<div class="mb-3">
					<label for="comments">코멘트</label> <input type="text"
						class="form-control" id="comments" placeholder="ex) 산책로로 걸어서 갔을 때"
						required="">
				</div>
				<div class="mb-3">
					<label for="time">시간</label> <input type="text"
						class="form-control" id="time" placeholder="ex) 분 단위, 숫자만 입력.  ex) 30분 → 30"
						required="">
					<div class="invalid-feedback">필수 입력 사항입니다.</div>
				</div>
			<!-- 완료버튼 클릭시 인서트되고 ChecklistWrite_second.jsp 로 리다이렉트 되어 항목 추가된 것 확인 가능 -->
			<button class="btn btn-primary btn-lg btn-block" type="submit"
				id="next" style="margin-bottom: 50px;">입력 완료</button>
			
			</div>
		</form>
	</div>


</body>
</html>