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
<title>NoticeWrite.jsp</title>
<!-- 공지사항 작성 페이지 -->

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
	<div>
		<c:import url="MenuNavbar_admin.jsp"></c:import>
	</div>

	<br>
	<br>
	<br>
	<br>
	<br>

	<div class="container">
		<!-- 게시판 메인 -->
		<div class="page-header">
			<h1 class="page-heading">공지사항</h1>
		</div>
		<hr>
		<br>

		<form action="/" method="post">
			<select name="value" id="value" style="width:120px; text-align: center;">
				<option value="prPen">공지사항</option>
				<option value="pen">점검사항</option>
			</select>
		</form>
		<br>

		<form action='<c:url value='/board/boardInsert'/>' method="post">
			<div class="form-group">
				<label for="exampleFormControlInput1">제목</label> <input type="text"
					class="form-control" id="exampleFormControlInput1" name="title"
					placeholder="제목을 작성해주세요.">
			</div>

			<div class="form-group">
				<label for="exampleFormControlTextarea1">내용</label>
				<textarea class="form-control" id="exampleFormControlTextarea1"
					name="contents" rows="12" placeholder="내용을 입력해주세요."></textarea>
			</div>

		</form>



		<!-- 글쓰기 버튼 -->
		<div class="d-flex justify-content-end">
			<!-- 이 글쓰기 버튼은 관리자에게만 나타나는 버튼! -->
			<button type="submit" class="btn btn-primary">등록하기</button>
			&nbsp;
			<button type="submit" class="btn btn-primary">삭제하기</button>
			&nbsp;
			<button type="button" class="btn btn-secondary">목록으로</button>
		</div>
		<br> <br>


	</div>
	</div>

</body>
</html>