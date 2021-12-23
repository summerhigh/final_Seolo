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
<title>CreateAccountInsert.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/CreateAccountInsert.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
crossorigin="anonymous">
<style type="text/css">
	p { font-size: small; color: red; }
	.errMsg { font-size: small; color: red; }
	.okMsg { font-size: small; color: blue; }
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="<%=cp%>/js/regex.js"></script>

<script type="text/javascript">

		var nickFlag = false;	// 닉네임 중복확인 flag
		var checkFlag = false;  // 중복확인 버튼 체크 flag
		
		$(function()
		{

			// 기존의 본인의 닉네임, 이메일 수정없이 수정하기 버튼 눌렀을 경우
			if ($("#preNickName").val() == $("#nickName").val())
			{
				checkFlag = true;
				nickFlag = true;
			}
			
			// 닉네임 중복확인 flag처리
			$("#nickName").on("change keyup paste", function()
			{		
				checkFlag = false; 
					
			});		
			
			// 닉네임 중복확인 ajax
			$("#nickCheckBtn").click(function()
			{
				$("#nickErrMsg").html("");
				$("#nickOkMsg").html("");
				
				// 닉네임 중복확인 버튼 클릭 flag
				checkFlag = true;
							
				if ($("#nickName").val() == "")
				{
					$("#nickOkMsg").html("");
					$("#nickErrMsg").css("color", "red");
					$("#nickErrMsg").html("닉네임을 입력해 주세요.");
					nickFlag = false;
					return;
				}
				
				// 기존의 본인의 닉네임 수정없이 갈 경우
				if ($("#preNickName").val() == $("#nickName").val())
				{
					$("#nickOkMsg").html("사용 가능한 닉네임입니다.");
				}
				else if ($("#preNickName").val() != $("#nickName").val())	// 하나라도 수정할 경우
				{
					confirmNick(); // 닉네임 중복확인 ajax 처리
				}
			});
			

			
			
			
			
			
			// 수정하기 버튼누르면 서브밋 처리 !!!!!
			$("#updateBtn").click(function()
			{
				
				if (confirm("회원 정보를 수정하시겠습니까?"))
				{
					// 닉네임란 공백일 경우
					if ($("#nickName").val() == "")
					{
						$("#nickErrMsg").html("닉네임을 입력해주세요.");
						$("#nickName").focus();
						return false;						
					}	
					
					
					// 이메일 유효성 검사 전체
					if ($("#email").val() == "")	// 이메일란이 공백인경우
					{
						$("#emailErrMsg").html("이메일를 입력해주세요.");
						$("#email").focus();
						return false;						
					}
					else							// 이메일 작성했을경우
					{
						// 이메일 정규표현식 처리
						var result = checkEmail();
						
						// 이메일 메소드로 처리 부분
						if (!result)
						{
							$("#emailErrMsg").html("이메일 유효성에 맞지 않습니다.");
							return false;
						}
						else
						{
							$("#emailErrMsg").html("");
						}
						
					}
					
					
					// 닉네임 중복확인 버튼 여부처리
					if (!checkFlag)
					{
						$("#nickOkMsg").text("");	// change keyup paste 때문에 (바꾸고 닉네임 중복누르고 또 바꾸고 닉네임 중복)
						$("#nickErrMsg").css("color", "red");
						$("#nickErrMsg").html("닉네임 중복확인 버튼을 눌러주세요");		
						$("#nickName").focus();
						return false;	
					}
					
					// 닉네임 중복처리 여부
					if (!nickFlag)
					{
						$("#nickErrMsg").css("color", "red");
						$("#nickErrMsg").html("닉네임이 중복입니다.");		
						$("#nickName").focus();						
						
						return false;
					}
					
					
					// 마지막 최종 서브밋실행
					///$("#updateForm").attr("action", "myinfoupdate.action");
					$("#updateForm").submit();
					
				}
				
			}); // click event end
			
			
		}); // jquery end;

		
		
		// 닉네임 ajax함수
		function confirmNick()
		{
			$.post("confirmnickname.action", {nickName : $("#nickName").val()}, function(data)
			{
				var result = data;

				if (data == 1)
				{
					$("#nickOkMsg").html("");
					$("#nickErrMsg").html("사용할 수 없는 닉네임입니다.");
					nickFlag = false;
					
				}
				else
				{
					$("#nickErrMsg").html("");
					$("#nickOkMsg").html("사용 가능한 닉네임입니다.");
					nickFlag = true;
				}
				
			});
		}

		
		// 주소 함수
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

	<!-- 메뉴 영역 -->
	<div>
	<c:import url="/nav.action"></c:import>
	</div>

	<!-- 콘텐츠 영역 -->
	<div class="wrap wd668">
	<!-- <div class="container" style="width:50%; text-align: left;"> -->
        <div class="form_txtInput">
        <br>
          <h2 class="sub_tit_txt">내 정보 수정</h2>
          <hr>
          
          <div class="join_form">
          <form action="myinfoupdate.action" method="post" id="updateForm">
            <table>
              <colgroup>
                <col width="30%"/>
                <col width="auto"/>
              </colgroup>
              <tbody>
                <!-- 
                <tr>
                  <th><span>아이디</span></th>
                  <td><input type="text" id="id" name="id" class="id" placeholder="ID를 입력하세요."></td>
                </tr>
                <tr>
                 -->
                <tr>
                  <th>아이디</th>
                  <td><input type="text" class="send_number" id="id" name="pe_Id" maxlength="12"
                  style="width: 550px; background-color : #e9ecef;" value="${user.pe_Id }" readonly="readonly">
                      <span id="idErrMsg" class="errMsg"></span>
                  </td>
                </tr>
                <tr>
                  <th>이름</th>
                  <td><input type="text" id="name" name="name" class="name" style="background-color: #e9ecef;" readonly="readonly"
                  value="${user.name }"></td>
                </tr>
                <tr>
                	<th></th>
                	<td><span id="nameErrMsg" class="errMsg"></span></td>
                </tr>
                <tr>
                  <th>닉네임</th>
                  <td>
					<input type="text" class="nickName"id="nickName" name="nickName" maxlength="10" value="${user.nickName }"
					style="width: 400px;">&nbsp;
                      <button type="button" class="btn btn-secondary" id="nickCheckBtn"><font size="1.5">닉네임 중복확인</font>
                      </button>
                  </td>
                </tr>
                <tr>
                	<th></th>
                	<td><span id="nickErrMsg" class="errMsg"></span><span id="nickOkMsg" class="okMsg"></span></td>
                </tr>
                <tr class="email">
                  <th>이메일</th>
                  <td>
                    <input type="text" id="email" name="email" class="email" value="${user.email }">
                  </td>
                <tr>
                	<th></th>
                	<td><span id="emailErrMsg" class="errMsg"></span></td>
                </tr>  
                <tr>
                  <th>휴대전화</th>
                  <td><input type="text" id="tel" name="tel" class="phone"maxlength="11" style="background-color: #e9ecef;"
                   readonly="readonly" value="${user.tel }">
                  </td>
                </tr>
                <tr>
                	<th></th>
                	<td><!-- <p>이미 가입했거나, 현재 가입이 불가능한 번호입니다.</p> -->
						<span id="telErrMsg" class="errMsg"></span></td>
                </tr>  
                <tr>
                	<th></th>
                	<td><span id="idnErrMsg" class="errMsg"></span><span id="idnOkMsg" class="okMsg"></span></td>
                </tr>
                <tr>
                  <th>주소</th>
                  <td>					
					<input type="text" id="upun" name="upun" placeholder="우편번호" readonly="readonly" style="background-color: #e9ecef;">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="roadAddr" name="roadAddr" placeholder="주소" readonly="readonly" style="background-color: #e9ecef;" value="${user.roadAddr }"><br>
					<input type="text" id="detailAddr" name="detailAddr" placeholder="상세주소" value="${user.detailAddr }">
					<input type="text" id="dong" name="dong" placeholder="참고항목" readonly="readonly" style="background-color: #e9ecef;"></td>
                </tr>
                <tr>
                	<th></th>
                	<td><span id="addrErrMsg" class="errMsg"></span></td>
                </tr>  
                <tr>
              </tbody>
            </table>
            </form>
           
          </div><!-- join_form E  -->
          <div class="text-center">
          	<span id="flagMsg" class="errMsg"></span>
          </div>
          <div class="btn_wrap">
				<button type="button" class="btn btn-primary" id="updateBtn"
				value="${user.pe_Id }">수정하기</button>
				<button type="button" class="btn btn-secondary" onclick="history.back()">뒤로가기</button>
				<input type="hidden" id="preNickName" value="${user.nickName }">
          </div>
          <br>
        </div> <!-- form_txtInput E -->
      </div><!-- content E-->
    </div> <!-- container E -->

</body>
</html>