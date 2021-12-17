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
<title>NoticeList.jsp</title>

<!-- 통일하기로 한 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" 
integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</head>
<body>

<!-- 내비바 -->
<div><c:import url="MenuNavbar_admin.jsp"></c:import></div>

<br><br><br><br><br>

<div class="container">
	<!-- 게시판 메인 -->
	<div class="page-header"><h1 class="page-heading">공지사항</h1></div>
	<br><br>
	
	<!-- 공지 분류 -->
	<ul class="nav nav-tabs page-header-tabs" id="categori" role="tablist">
       <li class="nav-item">
         <a class="nav-link " href="">공지 사항</a>
       </li>
       <li class="nav-item">
         <a class="nav-link " href="">점검 알림</a>
       </li>
    </ul>
	
	
	<div class="table-responsive">
		<table class="card-text table table-striped">
			<thead>
				<tr>
					<th>순번</th>
					<th>공지 분류</th>
					<th style="text-align: center;">제목</th>
					<th>작성자</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">35</th>
					<td>[공지사항]</td>
					<td>2021년 12월 이벤트</td>
					<td>관리자1</td>
					<td>2021-12-13</td>
				</tr>
				<tr>
					<th scope="row">34</th>
					<td>[공지사항]</td>
					<td>개인정보처리방침 변경 안내</td>
					<td>관리자2</td>
					<td>2021-11-22</td>
				</tr>
				<tr>
					<th scope="row">33</th>
					<td>[점검 알림]</td>
					<td>2021-11-20 추가 점검 예정 알림</td>
					<td>관리자1</td>
					<td>2021-11-10</td>
				</tr>
				<tr>
					<th scope="row">32</th>
					<td>[점검 알림]</td>
					<td>2021-09-20 점검 예정 알림</td>
					<td>관리자1</td>
					<td>2021-09-15</td>
				</tr>
				<tr>
					<th scope="row">31</th>
					<td>[점검 알림]</td>
					<td>2021-11-20 추가 점검 예정 알림</td>
					<td>관리자1</td>
					<td>2021-11-10</td>
				</tr>
				<tr>
					<th scope="row">30</th>
					<td>[점검 알림]</td>
					<td>2021-09-20 점검 예정 알림</td>
					<td>관리자1</td>
					<td>2021-09-15</td>
				</tr>
				<tr>
					<th scope="row">29</th>
					<td>[공지사항]</td>
					<td>2021년 12월 이벤트</td>
					<td>관리자1</td>
					<td>2021-12-13</td>
				</tr>
				<tr>
					<th scope="row">28</th>
					<td>[공지사항]</td>
					<td>개인정보처리방침 변경 안내</td>
					<td>관리자2</td>
					<td>2021-11-22</td>
				</tr>
				<tr>
					<th scope="row">27</th>
					<td>[점검 알림]</td>
					<td>2021-09-20 점검 예정 알림</td>
					<td>관리자1</td>
					<td>2021-09-15</td>
				</tr>
				<tr>
					<th scope="row">26</th>
					<td>[공지사항]</td>
					<td>2021년 12월 이벤트</td>
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
		<br><br>
			
			
		<!-- 페이징 처리 부분 -->
		<div class="dataTables_paginate paging_simple_numbers" style="text-align:center; id="datatable_paginate">
			<ul id="datatable_pagination" class="pagination datatable-custom-pagination justify-content-center">
				<!-- prev 부분도 필요할까봐 넣어둠!
				<li class="paginate_item page-item disabled">
					<a class="paginate_button previous page-link" aria-controls="datatable" data-dt-idx="0" tabindex="0" id="datatable_previous">
					<span aria-hidden="true">Prev</span></a>
				</li> -->
				<li class="paginate_item page-item active">
					<a class="paginate_button page-link" aria-controls="datatable" data-dt-idx="1" tabindex="0">1</a>
				</li>
				<li class="paginate_item page-item">
					<a class="paginate_button page-link" aria-controls="datatable" data-dt-idx="2" tabindex="0">2</a>
				</li>
				<li class="paginate_item page-item">
					<a class="paginate_button page-link" aria-controls="datatable" data-dt-idx="2" tabindex="0">3</a>
				</li>
				<li class="paginate_item page-item">
					<a class="paginate_button page-link" aria-controls="datatable" data-dt-idx="2" tabindex="0">4</a>
				</li>
				<li class="paginate_item page-item">
					<a class="paginate_button next page-link" aria-controls="datatable" data-dt-idx="3" tabindex="0" id="datatable_next">
					<span aria-hidden="true">Next</span></a>
				</li>
			</ul>
		</div>
	</div>
</div>

</body>
</html>