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
<title>WriteIntroduction.jsp</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<!-- 
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
			if ($("#content").val() == "")
			{
				alert("필수 입력 항목이 누락되었습니다. 다시 입력해 주세요.");
				return; //-- submit 액션 처리 중단
			}

			// 폼 submit 액션 처리 수행
			$("#form").submit();

		});

	});
</script>
 -->
<script type="text/javascript">
	//$();        // jquery();
	$(document).ready(function()
	{
		// 직원 추가 버튼이 클릭되었을 때 수행해야 할 코드 처리
		$("#submitBtn").click(function()
		{
			// 실행 확인
			//alert("버튼이 클릭되었습니다.")
			
			
			// -> if 에서  alert까지 되면 밑에 return이 실행되는거고
			//	  실행이안되면 $("#form") 가는거,,  
			// return 은 실행이 완료되면 돌아간다는 뜻.!!
			// 데이터 검사(누락된 입력값이 있는지 없는지에 대한 여부 확인)
			if ($("#content").val() == "")
			{
				alert("필수 입력 항목이 누락되었습니다. 다시 입력해 주세요.");
				return; //-- submit 액션 처리 중단
			}

			// 폼 submit 액션 처리 수행
			$("#form").submit();

		});
		
		// 리셋버튼을 누르면 그냥 "" 공백으로 완성된다~! 돌아갈 필요가없지! 그니까 return 은 작성하지 않는다!
		
		$("#resetBtn").click(function()
		{
			/*
			alert("초기화 하시겠습니까?");
			$("#content").val() == " ";
			
			return;
			$("#form").submit();*/
			
			alert("초기화 하시겠습니까?");
			$('textarea').val('');
			
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
	<!-- 덮어쓰기  -->
	<!-- 메뉴 영역 -->
	<div>
		<c:import url="MenuNavbar_admin.jsp"></c:import>
	</div>

	<!-- 콘텐츠 영역 -->
	<br>
	<br>
	<article>
		<div class="container" role="main">
			<h2>서비스 소개 수정</h2>
			<br>
			<form name="form" id="form" role="form" method="post"
				action="introductioninsert.action">
				

				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="20" name="content"
						id="content">${view.content }</textarea>
					<!-- 여기에 값 받아오는 것 ! -->
				</div>

			</form>

			<br>
			<div align="right">
				<!-- <button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button> -->
				<button class="btn btn-danger" type="reset" id="resetBtn">초기화</button>
				<button class="btn btn-primary" type="submit" id="submitBtn">수정하기</button>
				<button class="btn btn-secondary" type="submit"
					onclick="location.href='introduction.action'">취소하기</button>
			</div>
		</div>

	</article>

</body>

</html>


</body>
</html>