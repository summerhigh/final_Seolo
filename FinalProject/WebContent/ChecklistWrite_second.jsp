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
			    <label for="title" class="col-sm-2 col-form-label">항목명</label>
			    <div class="col-sm-7">
			      <input type="text" class="form-control" id="title" name="title"
			       placeholder="ex) 주변 도서관 상태(점수), 고척돔까지(시간)">
			    </div>
			</div>
			<div class="form-group row" style="align-items: center; display: flex; justify-content: center;">
				<label for="timeorScore" class="col-sm-2 col-form-label">평가기준</label>
				<div class="col-sm-5">
			    	<select class="custom-select mr-sm-3" name="timeorScore" id="timeorscore">
						<option value="time">시간</option>
						<option value="score">점수</option>
					</select>
			    </div>
			    <div class="col-sm-2">
			    	<!-- 이 버튼을 누르면 인서트 되고 다시 이 페이지로 redirect. -->
			    	<button type="button" class="btn btn-secondary btn-sm">항목추가</button>
			    </div>
			</div>
			
			<hr class="mb-4">
			<div class="row">
				<h5 class="mb-3 col-sm-4">추가항목명1(점수)</h5>
				<div class="col-sm-2">
					<!-- 이 버튼 누르면 딜리트되고 다시 이 페이지로 redirect -->
			    	<button type="button" class="btn btn-secondary btn-sm">항목삭제</button>
			    </div>
			</div>
			<div class="row">
				<div class="col-md-3 mb-3">
					<label for="plus_score1">점수</label> <select
						class="custom-select d-block w-100" id="plus_score1" required="">
						<c:forEach var="i" begin="1" end="11" step="1">
							<option value="i">${(i-1)*0.5 }</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-md-9 mb-3">
					<textarea class="form-control" name="" id="plus_comments1" rows="3"
						placeholder="코멘트를 입력해주세요"></textarea>
				</div>
			</div>
			<hr class="mb-4">
			<div class="row">
				<h5 class="mb-3 col-sm-4">추가항목명2(시간)</h5>
				<div class="col-sm-2">
			    	<button type="button" class="btn btn-secondary btn-sm">항목삭제</button>
			    </div>
			</div>
			<div class="row">
				<div class="col-md-3 mb-3">
					<label for="plus_time2">시간(분 단위)</label>
					<input type="text" class="form-control" id="deposit" placeholder="ex) 30">
				</div>
				<div class="col-md-9 mb-3">
					<textarea class="form-control" name="" id="plus_comments2" rows="3"
						placeholder="코멘트를 입력해주세요"></textarea>
				</div>
			</div>

			<hr class="mb-4">
			<!-- 이 버튼을 누르면 다음 페이지로  -->
			<button class="btn btn-primary btn-lg btn-block" type="submit" style="margin-bottom: 50px;">작성 완료</button>
		</form>
	</div>






<!-- 이걸로 수정 -->

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
			    <label for="title" class="col-sm-2 col-form-label">항목명</label>
			    <div class="col-sm-7">
			      <input type="text" class="form-control" id="title" name="title"
			       placeholder="ex) 주변 도서관 상태(점수), 고척돔까지(시간)">
			    </div>
			</div>
			<div class="form-group row" style="align-items: center; display: flex; justify-content: center;">
				<label for="timeorScore" class="col-sm-2 col-form-label">평가기준</label>
				<div class="col-sm-5">
			    	<select class="custom-select mr-sm-3" name="timeorScore" id="timeorscore">
						<option value="time">시간</option>
						<option value="score">점수</option>
					</select>
			    </div>
			    <div class="col-sm-2">
			    	<!-- 이 버튼을 누르면 인서트 되고 다시 이 페이지로 redirect. -->
			    	<button type="button" class="btn btn-secondary btn-sm">항목추가</button>
			    </div>
			</div>
			<hr class="mb-4">
			
			<h1>10. 부트스트랩 테이블 종합<small>클래스 활용</small></h1>
			
			<table class="table table-striped table-condensed table-hover">
				<tr>
					<td>추가항목명</td>
					<td>점수</td>
					<td>코멘트</td>
					<td>삭제</td>
				</tr>
				<tr>
					<td>cell</td>
					<td>cell</td>
					<td>cell</td>
					<td>cell</td>
				</tr>
			</table>

		</form>
		
	</div> <!-- 컨테이너 -->







	<!-- footer 영역 -->
	<div>
	</div>

</body>
</html>