<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	pageContext.setAttribute("replaceChar", "\n");
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
	
<title>Introduction.jsp</title>
</head>
<body>
	<!-- 파일덮어쓰기 -->
	<!-- 메뉴 영역 -->
	<!-- 내비바 -->
   <div>
   		<c:choose>
			<c:when test="${!empty adminLogin }">
				<c:import url="MenuNavbar_admin.jsp"></c:import>
			</c:when>
			<c:otherwise>
				<c:import url="/nav.action"></c:import>
			</c:otherwise>
   		</c:choose>
   </div>
	<%-- 
	<div>
		<c:import url="MenuNavbar_admin.jsp"></c:import>
	</div>
 --%>
	<!-- 콘텐츠 영역 -->
	<br>
	<br>
	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<div class="col-md-6">
					<img class="card-img-top mb-5 mb-md-0"
						src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbOGRoC%2Fbtrops663eP%2FM81FWcPmrZe4IZ1AKK39d0%2Fimg.jpg" alt="...">
						<!-- src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..."> -->
						<!-- 나중에 서로 손 잡고있는 사진 등으로 교체하기! 600x700  -->
				</div>
				<div class="col-md-6" style="align-content: flex-start;">
					<!--＠ 서로란/서울사는 솔로(1인가구~) 고정 -->
					<h1 class="display-5 fw-bolder"><b>서로</b>란?</h1>
					<div class="fs-5 mb-5">
						<span class="text-decoration-line-through"><b>서</b>울 사는
							솔<b>로</b>(1인 가구)들을 위한 사이트</span>
					</div>
				 <div>
				 
				 <!-- controller에 view로 내가 설정한 이름에 content(DTO)에있는아이를 데랴와서 출력 -->
				 <%-- <p style="font-size: 18px;">${view.content }</p> --%>
				 <p style="font-size: 18px;">${fn:replace(view.content, replaceChar, "<br/>") }</p>
				 </div>
				 </div>
			</div>
			<div class="d-flex justify-content-end">
				<c:if test="${!empty adminLogin}">
					<button type="submit"class="btn btn-primary"
					onclick="location.href='introductionform.action'"
					>수정하기</button>
					<%-- href="<%=cp%>/UpdateIntroduction.jsp" --%>
				</c:if>
			</div>
			<br><br>
		</div>


	</section>


</body>
</html>