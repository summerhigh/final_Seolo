<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<title>MyInfoUpdateFn.jsp</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">
 
	$(document).ready(function()
	{
		alert("회원정보 수정이 완료되었습니다.")

		$(location).attr("href", "myinfo.action");
	});

		


</script>


</head>
<body>
	
</body>
</html>