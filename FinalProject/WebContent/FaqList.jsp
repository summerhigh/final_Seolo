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
<title>FaqList.jsp</title>

<!-- 통일하기로 한 부트스트랩 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
	crossorigin="anonymous"></script>

</head>
<body>

<!-- 내비바 -->
<div><c:import url="MenuNavbar_admin.jsp"></c:import></div>

	<br>
	<br>
	<br>
	<br>
	<br>

	<div class="container">
		<!-- 게시판 메인 -->
		<div class="page-header">
			<h1 class="page-heading">자주 묻는 질문</h1>
		</div>
		<br>
		<br>


		<!-- 질문 분류 -->
		<ul class="nav nav-tabs page-header-tabs" id="categori" role="tablist">
			<li class="nav-item"><a class="nav-link " href="">회원 관리</a></li>
			<li class="nav-item"><a class="nav-link " href="">체크리스트</a></li>
			<li class="nav-item"><a class="nav-link" href="">공동구매</a></li>
			<li class="nav-item"><a class="nav-link " href="">기타</a></li>
		</ul>

		<div class="table-responsive">
			<table class="card-text table table-striped">
				<thead>
					<tr>
						<th>순번</th>
						<th>질문 분류</th>
						<th style="text-align: center;">제목</th>
						<th>작성자</th>
						<th>날짜</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">35</th>
						<td>[기타]</td>
						<td>이 기능은 어떻게 사용하는 건가요?</td>
						<td>관리자1</td>
						<td>2021-12-13</td>
					</tr>
					<tr>
						<th scope="row">34</th>
						<td>[체크리스트]</td>
						<td>북마크는 어떻게 하나요?</td>
						<td>관리자2</td>
						<td>2021-11-22</td>
					</tr>
					<tr>
						<th scope="row">33</th>
						<td>[체크리스트]</td>
						<td>스티커 기능은 뭔가요?</td>
						<td>관리자1</td>
						<td>2021-11-10</td>
					</tr>
					<tr>
						<th scope="row">32</th>
						<td>[공동구매]</td>
						<td>내 신고처리사항은 어디서 확인하나요?</td>
						<td>관리자1</td>
						<td>2021-09-15</td>
					</tr>
					<tr>
						<th scope="row">31</th>
						<td>[공동구매]</td>
						<td>경고는 어떤 정책인가요?</td>
						<td>관리자1</td>
						<td>2021-11-10</td>
					</tr>
					<tr>
						<th scope="row">30</th>
						<td>[기타]</td>
						<td>사이트가 왜케 구려보이나요?</td>
						<td>관리자1</td>
						<td>2021-09-15</td>
					</tr>
					<tr>
						<th scope="row">29</th>
						<td>[체크리스트]</td>
						<td>회원가입 이벤트는 어떻게 참여하나요?</td>
						<td>관리자1</td>
						<td>2021-12-13</td>
					</tr>
					<tr>
						<th scope="row">28</th>
						<td>[공동구매]</td>
						<td>이제 질문 소재 고갈인가요?</td>
						<td>관리자2</td>
						<td>2021-11-22</td>
					</tr>
					<tr>
						<th scope="row">27</th>
						<td>[공동구매]</td>
						<td>환불 버튼은 어디있나요?</td>
						<td>관리자1</td>
						<td>2021-09-15</td>
					</tr>
					<tr>
						<th scope="row">26</th>
						<td>[회원 관리]</td>
						<td>탈퇴는 어떻게 하나요?</td>
						<td>관리자1</td>
						<td>2021-12-13</td>
					</tr>
				</tbody>
			</table>
			<br>

			<!-- 글쓰기 버튼 -->
			<div class="d-flex justify-content-end">
				<!-- 이 글쓰기 버튼은 관리자에게만 나타나는 버튼! -->
				<button type="submit" class="btn btn-primary">글쓰기</button>
			</div>
			<br>
			<br>


			<!-- 페이징 처리 부분 -->
			<div class="dataTables_paginate paging_simple_numbers"
				style="text-align: center;"datatable_paginate">
				<ul id="datatable_pagination"
					class="pagination datatable-custom-pagination justify-content-center">
					<!-- prev 부분도 필요할까봐 넣어둠!
				<li class="paginate_item page-item disabled">
					<a class="paginate_button previous page-link" aria-controls="datatable" data-dt-idx="0" tabindex="0" id="datatable_previous">
					<span aria-hidden="true">Prev</span></a>
				</li> -->
					<li class="paginate_item page-item active"><a
						class="paginate_button page-link" aria-controls="datatable"
						data-dt-idx="1" tabindex="0">1</a></li>
					<li class="paginate_item page-item"><a
						class="paginate_button page-link" aria-controls="datatable"
						data-dt-idx="2" tabindex="0">2</a></li>
					<li class="paginate_item page-item"><a
						class="paginate_button page-link" aria-controls="datatable"
						data-dt-idx="2" tabindex="0">3</a></li>
					<li class="paginate_item page-item"><a
						class="paginate_button page-link" aria-controls="datatable"
						data-dt-idx="2" tabindex="0">4</a></li>
					<li class="paginate_item page-item"><a
						class="paginate_button next page-link" aria-controls="datatable"
						data-dt-idx="3" tabindex="0" id="datatable_next"> <span
							aria-hidden="true">Next</span></a></li>
				</ul>
			</div>
		</div>
	</div>

</body>
</html>