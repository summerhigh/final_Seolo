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
<title>JoinInfo.jsp</title>

<style type="text/css">
	p 
	{ 
		font-size: small;
		color: red; 
	}
</style>

</head>
<body>

<div>
	<h1>서로</h1>
</div>

<div>
	<form action="">
		아이디 <input type="text" />
		<p>사용할 수 없는 아이디입니다.</p><p>아이디를 입력해주세요.</p><br />
		
		비밀번호 <input type="password" /><p>비밀번호를 입력해주세요.</p><br />
		
		비밀번호 확인 <input type="password" />
		<p>비밀번호 확인을 입력해주세요.</p><br />
		
		이름 <input type="text" />
		<p>이름을 입력해주세요.</p><br />
		
		닉네임 <input type="text" />
		<p>사용할 수 없는 닉네임입니다.</p><p>아이디를 입력해주세요.</p><br />
		
		이메일 <input type="email" />
		<p>이메일을 입력해주세요.</p><br />
		
		휴대전화 <input type="tel" placeholder="전화번호 입력"><button>인증번호 받기</button><br />
		<input type="text" placeholder="인증번호를 입력하세요." />
		<p>이미 가입했거나, 현재 가입이 불가능한 번호입니다.</p>
		<p>휴대전화를 입력해주세요.</p>
		
		주소
		<input type="text" readonly="readonly" placeholder="우편번호"><button>우편번호 검색</button><br />
		<input type="text" readonly="readonly" placeholder="주소"></input>
		<input type="text" placeholder="상세주소 입력"></input>
		<p>주소를 입력해주세요.</p>
		
		<button type="submit">가입하기</button>
	</form>
</div>


</body>
</html>