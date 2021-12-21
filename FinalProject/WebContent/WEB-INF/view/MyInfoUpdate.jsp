<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<title>MyInfoUpdate.jsp</title>
<!-- Bootstrap core CSS -->
<link href="<%=cp%>/css/bootstrap.min.css" rel="stylesheet">

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.errMsg {
	color: red;
	font-size: small;
}

</style>

<!-- Custom styles for this template -->
<link href="<%=cp %>/css/starter-template.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

<script type="text/javascript">
	
	$(function()
	{
		$("#updateBtn").click(function()
		{
			if (confirm("회원 정보를 수정하시겠습니까?"))
			{
				$("#updateForm").submit();
			}
		});
		
	});
	
</script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	function sample6_execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수
	
	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	
	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	                // 조합된 참고항목을 해당 필드에 넣는다.
	                document.getElementById("dong").value = extraAddr;
	            
	            } else {
	                document.getElementById("dong").value = '';
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('upun').value = data.zonecode;
	            document.getElementById("roadAddr").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("detailAddr").focus();
	        }
	    }).open();
	}
</script>

</head>
<body>
	<div>
		<c:import url="/nav.action"></c:import>
	</div>
	<div class="contaner">
		<div class="starter-template">
			<h1>내 정보 수정</h1>
		</div>
		
		<hr style="width: 60%;">
		
		<div class="starter-template">
			<form action="" id="updateForm" method="post">
				<!-- 프로필사진 업로드구역 -->
				<div class="col-md-4 mx-auto">
					<img src="<%=cp %>/images/profile.jpg"><br>
					<button type="button" class="btn btn-primary">사진 바꾸기</button>
				</div>
				
				<hr class="col-md-7 mx-auto" style="margin: 50px 0;">
				
				<table class="table col-md-7 mx-auto">
					  <tbody>
					    <tr>
					      <th scope="row" class="col-md-2 table-secondary">사용자 ID</th>
					      <td class="col-md-5"><input type="text" class="form-control" id="id" name="id" value="" readonly></td>
					    </tr>
					    <tr>
					      <th scope="row" class="col-md-2 table-secondary">사용자 이름</th>
					      <td><input type="text" class="form-control" id="name" name="name" value="" readonly></td>
					    </tr>
					    <tr>
					      <th scope="row" class="col-md-2 table-secondary">닉네임</th>
					      <td><input type="text" class="form-control" id="nickName" name="nickName" value="">
					      <span class="errMsg" id="nickErrMsg">닉네임 에러 메세지</span></td>
					    </tr>
					    <tr>
					      <th scope="row" class="col-md-2 table-secondary">휴대전화</th>
					      <td><input type="text" class="form-control" id="name" name="name" value="" readonly></td>
					    </tr>
					    <tr>
					      <th scope="row" class="col-md-2 table-secondary">이메일</th>
					      <td><input type="text" class="form-control" id="email" name="email" value="">
					      <span class="errMsg" id="emailErrMsg">이메일 에러 메세지</span></td>
					    </tr>
					    <tr>
					      <th scope="row" class="col-md-2 table-secondary">주소</th>
					      <td>
					      	<input type="text" class="form-control col-md-9" id="upun" name="upun" placeholder="우편번호" readonly="readonly">
							<input type="button" class="btn btn-secondary" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
							<input type="text" class="form-control col-md-9" id="roadAddr" name="roadAddr" placeholder="주소" readonly="readonly"><br>
							<input type="text" class="form-control col-md-9" id="detailAddr" name="detailAddr" placeholder="상세주소">
							<input type="text" class="form-control col-md-9" id="dong" name="dong" placeholder="참고항목" readonly="readonly">
						  </td>
					    </tr>
					  </tbody>
				</table>
				<br>
				<button type="button" class="btn btn-primary" id="updateBtn">수정하기</button>
				<button type="button" class="btn btn-secondary" onclick="history.back()">뒤로가기</button>
			</form>
			
		</div>
	</div>
</body>
</html>