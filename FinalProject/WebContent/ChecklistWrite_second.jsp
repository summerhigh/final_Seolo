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
<title>ChecklistWrite_second.jsp</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
<style type="text/css">
.text-essential {
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
			<h1 style="margin-top: 50px; font-weight: bold;">체크리스트 추가항목 작성</h1>
			<p class="lead">추가할 항목을 자유롭게 작성해주세요.</p>
		</div>

		<!-- SecondTimeInsertForm.jsp -->
		<a href="secondtimeinsertform.action" role="button" class="btn btn-secondary" 
		id="btnAdd" style="vertical-align: bottom;">시간 관련항목 추가하기</a>
		
		<!-- SecondScoreInsertForm.jsp -->
		<a href="secondscoreinsertform.action" role="button" class="btn btn-secondary" 
		id="btnAdd" style="vertical-align: bottom;">점수 관련항목 추가하기</a>
		
		

		<br>
		<br>

		<table class="table table-striped table-condensed table-hover">
			<tr class="text-center">
				<td>추가항목명</td>
				<td>코멘트</td>
				<td>점수 / 시간</td>
				<td>수정</td>
				<td>삭제</td>
			</tr>
			<tr class="text-center">
				<td>도서관</td>
				<td>신축 도서관이 근처에 있음</td>
				<td>4.5</td>
				<td>
					<button type="button" class="btn btn-secondary">수정하기</button>
				</td>
				<td>
					<button type="button" class="btn btn-secondary">삭제하기</button>
				</td>
			</tr>
			<tr class="text-center">
				<td>고척돔까지</td>
				<td>고척돔까지 도보로 걸리는 시간</td>
				<td>30</td>
				<td>
					<button type="button" class="btn btn-secondary">수정하기</button>
				</td>
				<td>
					<button type="button" class="btn btn-secondary">삭제하기</button>
				</td>
			</tr>
		</table>


	</div>


</body>
</html>