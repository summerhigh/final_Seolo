<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MenuNavbar_admin.jsp</title>
<!-- 통일하기로 한 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" 
integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

<script type="text/javascript">

	
	$(document).ready(function()
	{
		$("#adminlogout").on("click", function()
		{
			if (confirm("로그아웃 하시겠습니까?"))
			{
				$(location).attr("href", "logout.action");
			}
				return;			
		});
		   		
		   		
		   		
		   		
	});

</script>


</head>
<body>


<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
  <a class="navbar-brand mr-auto mr-lg-0 font-weight-bold" href="mainadmin.action" >서로</a>
  <button class="navbar-toggler p-0 border-0" type="button" data-toggle="offcanvas">
    <span class="navbar-toggler-icon"></span>
  </button>
   
  <div class="navbar-collapse offcanvas-collapse" id="Main">
    <ul class="navbar-nav mr-auto">
       <li class="nav-item">
        <a class="nav-link" href="mainadmin.action">&nbsp;&nbsp;메인</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-expanded="false">&nbsp;&nbsp;알림/공지</a>
        <div class="dropdown-menu" aria-labelledby="dropdown01">
          <a class="dropdown-item" href="noticelist.action">공지사항</a>
          <a class="dropdown-item" href="introduction.action">서비스 소개</a>
          <a class="dropdown-item" href="faqlist.action">자주 묻는 질문</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-expanded="false">&nbsp;&nbsp;회원조회</a>
        <div class="dropdown-menu" aria-labelledby="dropdown01">
          <a class="dropdown-item" href="accountlist.action">회원 리스트</a>
          <a class="dropdown-item" href="withdrawalaccountlist.action">탈퇴회원 리스트</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="reportlist.action">&nbsp;&nbsp;신고처리</a>
      </li>
    </ul>
    
    <ul class="navbar-nav mr-auto navbar-right navbar-nav my-2 my-md-0 mr-md-3">
    	<li class="nav-item">
      		<a class="nav-link" href="#" id="adminlogout">&nbsp;&nbsp;로그아웃</a>
    	</li>
   	</ul>


   </div>
</nav>
</body>
</html>