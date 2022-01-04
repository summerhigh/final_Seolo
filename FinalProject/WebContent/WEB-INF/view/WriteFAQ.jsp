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
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
<title>WriteFAQ.jsp</title>
<script type="text/javascript">
	
   //$();        // jquery();
   $(document).ready(function()
   {
      // 직원 추가 버튼이 클릭되었을 때 수행해야 할 코드 처리
      $("#submitBtn").click(function()
	{
    	 // 실행 확인
    	 //alert("버튼이 클릭되었습니다.")
    	 
		// 데이터 검사(누락된 입력값이 있는지 없는지에 대한 여부 확인)
		if( $("#title").val()=="" || $("#content").val()=="" || $("#faq_no").val()=="-1")
		{
			alert("필수 입력 항목이 누락되었습니다. 다시 입력해 주세요.");
			return;					//-- submit 액션 처리 중단
		}
		
		// 폼 submit 액션 처리 수행
		$("#faqinsertform").submit();

	});
      
   });

   
</script>
<style>
body {
	padding-top: 70px;
	padding-bottom: 30px;
}
</style>
</head>

<body>
	<!-- 메뉴 영역 -->
	<div>
		<c:import url="MenuNavbar_admin.jsp"></c:import>
	</div>

	<!-- 콘텐츠 영역 -->
	<br>
	<br>
	<article>
		<div class="container" role="main">
			<h2>자주 묻는 질문 작성</h2>
			<br>
			<form name="faqinsertform" id="faqinsertform" role="form" method="post"
				action="faqinsert.action">
				<div class="mb-3">
					<label for="title">제목</label> <input type="text"
						class="form-control" name="title" id="faq_title"
						placeholder="제목을 입력하세요">
				</div>

				<div class="mb-3">
					<label for="qs_no">분류</label> 
					<select class="form-control" name="qs_no" id="qs_no">
						<option value="-1">========</option>
						<option value="1">체크리스트</option>
						<option value="2">공동구매</option>
						<option value="3">회원 관리</option>
						<option value="4">기타</option>
					</select>
				</div>

				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="13" name="content" id="content"
						placeholder="내용을 입력하세요"></textarea>
				</div>

			</form>
			
			<br>
			<div align="right">
				<!-- <button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button> -->
				<button class="btn btn-primary" type="submit" id="submitBtn">등록하기</button>
				<button class="btn btn-secondary" type="submit" onclick="location.href='faqlist.action'">취소하기</button>
			</div>

		</div>

	</article>

</body>

</html>


</body>
</html>