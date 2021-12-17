<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

// test 
// test

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberProfile.jsp(회원 프로필)</title>


</head>
<body>

<!-- 메뉴 영역 -->
	<div>
	<c:import url="MenuNavbar.jsp"></c:import>
	</div>


<div>

	<table border="1">
		<tr style="background: navy; width: 500px; height: 20px;">
			<td colspan="3" style="text-align: left; width: 425px; color: white;"> superman님의 회원 프로필</td>
		</tr>
		<tr>
			<td style="text-align: center; color: blue;"> 회원 프로필 </td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td style="text-align: center;"><img src="images/profile.jpg"style="width: 100px; height: 100px; border-radius: 70%; "></td>
			<td colspan="2" style="vertical-align: middle;">
				&nbsp;<span>superman님</span><br>
				&nbsp;<span style="font-size: small;">매너 등급 :</span>
				<span style="font-weight: bolder;">3등급</span>
			</td>
			
		</tr>
		<tr>
			<td style="text-align: center; font-weight: bolder; width: 100px;">최고에요</td>
			<td style="text-align: center; font-weight: bolder; width: 100px;">좋아요</td>
			<td style="text-align: center; font-weight: bolder; width: 100px;">별로에요</td>
		</tr>
		<tr>
			<td style="text-align: center; width: 100px;">15개</td>
			<td style="text-align: center; width: 100px;">21개</td>
			<td style="text-align: center; width: 100px;">7개</td>
		</tr>		
		<tr>
			<td colspan="3">
				<span style="color: blue;">superman 님이 받은 매너 평가</span>
			</td>
		</tr>
	</table>
	
	
	<table border="1">
		<tr style="width: 350px; height: 20px;">	
			<td style="width: 80px; font-size: small; font-weight: bolder;">평점</td>
			<td style="width: 205px; font-size: small; font-weight: bolder;">코멘트</td>
			<td style="width: 20px; font-size: small; font-weight: bolder;">작성자</td>
			<td style="width: 90px; font-size: small; font-weight: bolder;">날짜</td>
		</tr>
		<tr>
			<td>최고에요</td>
			<td>빠르게 배달 해주셨어요!</td>
			<td>emk123</td>
			<td>2021-11-23</td>
		</tr>
		<tr>
			<td>좋아요</td>
			<td></td>
			<td>mmm99</td>
			<td>2021-11-21</td>
		</tr>
		<tr>
			<td>별로에요</td>
			<td>상품 상태가 별로에요...</td>
			<td>ppp55</td>
			<td>2021-11-20</td>
		</tr>
		<tr>
			<td>좋아요</td>
			<td>응답 빨라요.</td>
			<td>alp777</td>
			<td>2021-11-15</td>
		</tr>
		<tr>
			<td>최고에요</td>
			<td>매너 좋아요!</td>
			<td>koll13</td>
			<td>2021-11-13</td>
		</tr>									
		<tr style="height: 50px;">
			<td colspan="4" style="text-align: center;">
				prev 1 2 3 4 5 next
			</td>
		</tr>
	</table>

</div>

</body>
</html>