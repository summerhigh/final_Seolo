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
<title>CreateAccountYakgwanView.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
crossorigin="anonymous">
</head>
<body>

<div>
	
	<!-- 메뉴 영역 -->
	<div>
	<!-- (서로)                                홈 / 이용안내 / 체크리스트 / 공동구매 / 게시판 / 마이페이지  -->
	<c:import url="MenuNavbar_new.jsp"></c:import>
	</div>

	<!-- 콘텐츠 영역 -->
	<div id="content" style="text-align: center;">
	
	<form action="">
	<br><br><br><br>
	<h1>회원 약관 동의</h1>
	<hr>
		
		<input class="form-check-input" type="checkbox" id="checkAll">
        <label class="form-check-label" for="checkAll">
        <font size="4">모든 이용약관에 동의합니다.</font>
        </label>
		<br><br>
		
		<!-- @ 이용약관 1 -->
		<textarea readonly="readonly" name="text1" id="text1" rows="5" cols="66">
제 1 조 (목적)
이 약관은 네이버 주식회사 ("회사" 또는 "네이버")가 제공하는 네이버 및 네이버 관련 제반 서비스의 
이용과 관련하여 회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.

제 2 조 (정의)

이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
①"서비스"라 함은 구현되는 단말기(PC, TV, 휴대형단말기 등의 각종 유무선 장치를 포함)와 상관없이 
"회원"이 이용할 수 있는 네이버 및 네이버 관련 제반 서비스를 의미합니다.
②"회원"이라 함은 회사의 "서비스"에 접속하여 이 약관에 따라 "회사"와 이용계약을 체결하고 
"회사"가 제공하는 "서비스"를 이용하는 고객을 말합니다.
③"아이디(ID)"라 함은 "회원"의 식별과 "서비스" 이용을 위하여 "회원"이 정하고 "회사"가 
승인하는 문자와 숫자의 조합을 의미합니다.
④"비밀번호"라 함은 "회원"이 부여 받은 "아이디와 일치되는 "회원"임을 확인하고 비밀보호를 위해 
"회원" 자신이 정한 문자 또는 숫자의 조합을 의미합니다.
⑤"유료서비스"라 함은 "회사"가 유료로 제공하는 각종 온라인디지털콘텐츠(각종 정보콘텐츠, VOD, 
아이템 기타 유료콘텐츠를 포함) 및 제반 서비스를 의미합니다.
⑥"포인트"라 함은 서비스의 효율적 이용을 위해 회사가 임의로 책정 또는 지급, 조정할 수 있는 
재산적 가치가 없는 "서비스" 상의 가상 데이터를 의미합니다.
⑦"게시물"이라 함은 "회원"이 "서비스"를 이용함에 있어 "서비스상"에 게시한 부호ㆍ문자ㆍ음성ㆍ
음향ㆍ화상ㆍ동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다. 
		</textarea>
		
   		<br>
        <input class="form-check-input" type="checkbox" id="gridCheck1">
        <label class="form-check-label" for="gridCheck1">
        <font size="2">서울사는 솔로 이용약관 동의(필수)</font>
        </label>
   
   		<!--@ 이용약관 2  -->
   		<br><br>
		<textarea readonly="readonly" name="text2" id="text2" rows="5" cols="66">
정보통신망법 규정에 따라 네이버에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.


1. 수집하는 개인정보

이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 네이버 서비스를 회원과 동일하게 이용할 수 있습니다. 
이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 
네이버는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
		</textarea>
		
   		<br>
        <input class="form-check-input" type="checkbox" id="gridCheck2">
        <label class="form-check-label" for="gridCheck2">
        <font size="2">개인정보 수집 및 이용 동의(필수)</font>
        </label>
		
		<!--@ 이용약관 3  -->
   		<br><br>
		<textarea readonly="readonly" name="text3" id="text3" rows="5" cols="66">
위치정보 이용약관에 동의하시면, 위치를 활용한 광고 정보 수신 등을 포함하는 네이버 위치기반 서비스를 이용할 수 있습니다.

제 1 조 (목적)
이 약관은 네이버 주식회사 (이하 “회사”)가 제공하는 위치정보사업 또는 위치기반서비스사업과 관련하여 회사와 개인위치정보주체와의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.

제 2 조 (약관 외 준칙)
이 약관에 명시되지 않은 사항은 위치정보의 보호 및 이용 등에 관한 법률, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전기통신기본법, 전기통신사업법 등 관계법령과 회사의 이용약관 및 개인정보처리방침, 회사가 별도로 정한 지침 등에 의합니다.
		</textarea>
		
   		<br>
        <input class="form-check-input" type="checkbox" id="gridCheck3">
        <label class="form-check-label" for="gridCheck3">
        <font size="2">위치정보 이용약관 동의(필수)</font>
        </label>
   		
   		
   		<!--@ 이용약관 4  -->
   		<br><br>
		<textarea readonly="readonly" name="text4" id="text4" rows="5" cols="66">
네이버에서 제공하는 이벤트/혜택 등 다양한 정보를 휴대전화(네이버앱 알림 또는 문자), 이메일로 받아보실 수 있습니다. 일부 서비스(별도 회원 체계로 운영하거나 네이버 가입 이후 추가 가입하여 이용하는 서비스 등)의 경우, 개별 서비스에 대해 별도 수신 동의를 받을 수 있으며, 이때에도 수신 동의에 대해 별도로 안내하고 동의를 받습니다.
		</textarea>
		
   		<br>
        <input class="form-check-input" type="checkbox" id="gridCheck4">
        <label class="form-check-label" for="gridCheck4">
        <font size="2">프로모션 정보 수신 동의(선택)</font>
        </label>
		
		<br><br>
		<button type="submit" class="btn btn-secondary">취소하기</button>
		<button type="submit" class="btn btn-primary">확인하기</button>
		<br><br>
		</form>
		</div>
			
		
</div>

</body>
</html>