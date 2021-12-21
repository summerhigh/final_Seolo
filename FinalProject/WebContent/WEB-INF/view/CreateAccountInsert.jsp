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
<script type="text/javascript">

	$(function()
	{
		// 인증번호 발송 flag변수 선언
		var flagIdn = false;
		
		// 아이디 중복 flag 변수 선언
		
		var idFlag = false;
		// 아이디 중복확인 ajax
		$("#idCheckBtn").click(function()
		{
						
			//$("#idErrMsg").html("");
			if ($("#id").val() == "")
			{
				$("#idErrMsg").css("color", "red");
				$("#idErrMsg").html("아이디를 입력해 주세요.");
				return;
			}
			
			$("#idErrMsg").css("display", "inline");
			confrimId();
			
			// 아이디 중복 버튼 클릭 확인
			idFlag = true;
			
		
		});
		
		// 닉네임 중복확인 ajax
		// $.post(요청 주소, 전송 데이터, 응답액션처리)
		$("#nickName").on("change keyup paste", function()
		{
			$("#nickErrMsg").html("");
			$("#nickOkMsg").html("");
			
			confirmNick();
		});
		
		
		// 인증번호 전송
		$("#idnBtn").click(function()
		{
			if ($("#name").val()=="" || $("#tel").val()=="")
			{
				$("#idnErrMsg").html("이름과 휴대폰번호를 입력해주세요.");
				return;
			}
			
			$("#idnNumber").removeAttr("disabled");
			$("#idnErrMsg").html("입력한 휴대폰번호로 인증번호가 발송되었습니다. 번호를 입력해주세요.");
			flagIdn = false;
		});
		
		// 인증번호 확인 (인증번호는 1234로 가정)
		$("#idnNumber").on("change keyup paste", function()
		{
			if ($("#idnNumber").val()=="1234")
			{
				$("#idnErrMsg").html("");
				$("#idnOkMsg").html("인증번호를 정확히 입력했습니다.");
				flagIdn = true;
			}
			else if ($("#idnNumber").val()!="1234")
			{
				$("#idnOkMsg").html("");
				$("#idnErrMsg").html("인증번호를 정확히 입력해주세요.");
				flagIdn = false;
			}
		});
		
		// 비밀번호 확인
		$("#password2").on("change keyup paste", function()
		{
			if ($("#password2").val() != $("#password").val())
			{
				$("#pw2ErrMsg").html("비밀번호가 일치하지 않습니다.");
			}
			else if ($("#password2").val() == $("#password").val())
			{
				$("#pw2ErrMsg").html("");
			}
		})
		
		// submit 전 유효성검사 → submit
		$("#submitBtn").click(function()
		{
					
			//  전화번호 중복처리--------------------------
			let result = confirmTel();
			
			if (!result)
			{
				$("#telErrMsg").html("이미 가입했거나, 현재 가입이 불가능한 번호입니다.");
				$("#tel").focus();
				return;
			}
			//--------------------------전화번호 중복처리
			
		
			if ($("#nickErrMsg").text()!="" || $("#idnErrMsg").text()!="" || $("#pw2ErrMsg").text()!="" )
			// ①닉네임 중복일 때, ②인증번호 입력 안했는데/잘못 입력했는데,  ③비밀번호 확인 제대로 입력 안했을 때
			// 가입 못하게 막음
			{
				return;
			}
			
			$(".errMsg").html("");	// 에러 메세지 초기화
			
			if ($("#id").val()=="")
			{
				$("#idErrMsg").html("아이디를 입력해주세요.");
				$("#id").focus();
				return;
			}
			
			if ($("#name").val()=="")
			{
				$("#nameErrMsg").html("이름을 입력해주세요.");
				$("#name").focus();
				return;
			}
			
			if ($("#nickName").val()=="")
			{
				$("#nickErrMsg").html("닉네임을 입력해주세요.");
				$("#nickName").focus();
				return;
			}
			
			if ($("#password").val()=="")
			{
				$("#pwErrMsg").html("비밀번호를 입력해주세요.");
				$("#password").focus();
				return;
			}
			
			if ($("#password2").val()=="")
			{
				$("#pw2ErrMsg").html("비밀번호를 입력해주세요.");
				$("#password2").focus();
				return;
			}
			
			if ($("#email").val()=="")
			{
				$("#emailErrMsg").html("이메일을 입력해주세요.");
				$("#email").focus();
				return;
			}
			
			if ($("#tel").val()=="")
			{
				$("#telErrMsg").html("휴대폰 번호를 입력해주세요.");
				$("#tel").focus();
				return;
			}

					
			if ($("#upun").val()=="" || $("#roadAddr").val()=="" || $("#detailAddr").val()=="" || $("#dong").val()=="")
			{
				$("#addrErrMsg").html("상세주소 포함 주소를 입력해주세요.");
				$("#detailAddr").focus();
				return;
			}
			
			// 인증번호 제대로 정확히 입력 안되어있으면
			if (!flagIdn)
			{
				$("#idnOkMsg").html("");
				$("#idnErrMsg").html("인증번호를 정확히 입력해주세요.");
				return;
			}
			
			// 아이디 중복확인 클릭 안했을 경우
			if (!idFlag)
			{
				$("#idErrMsg").css("color", "red");
				$("#idErrMsg").html("아이디 중복확인이 필요합니다.");		
				$("#id").focus();
				return;	
			}
			
			$("#personalInsertForm").submit();
		});
		
		
		// 아이디 ajax
		function confrimId()
		{
			$.post("confirmId.action", {id : $("#id").val() }, function(data)
			{
				let result = data;
				
				if (result == 1)
				{
					$("#idErrMsg").html("사용할 수 없는 아이디입니다");
					$("#idErrMsg").css("color", "red");
				}				
				else
				{
					$("#idErrMsg").html("사용 가능한 아이디 입니다.");
					$("#idErrMsg").css("color", "blue");
				}
				
			});
		}
		
		// 전화번호 ajax
		function confirmTel()
		{
			 
			let idFlag = true;
			
			$.ajax({
		        url : "confirmtel.action",
		        type : 'POST',					
		        async: false,
		        data : {tel : $("#tel").val()},
		        dataType : "json",
		        success : function(data){
		        	
		        	let perResult = data.perResult;
		        	let withResult = data.withResult;
		        	
		        	if (perResult == 1 || withResult == 1)
					{
		        		idFlag = false;
		        		
					}
		        	
		        }
			});
			
			return idFlag;
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		// 닉네임 ajax
		function confirmNick()
		{
			if ($("#nickName").val()=="")
			{
				$("#nickOkMsg").html("");
				$("#nickErrMsg").html("");
				return;
			}
			
			$.post("confirmnickname.action", {nickName : $("#nickName").val()}, function(data)
			{
				var result = data;

				if (data == 1)
				{
					$("#nickOkMsg").html("");
					$("#nickErrMsg").html("사용할 수 없는 닉네임입니다.");
				}
				else
				{
					$("#nickErrMsg").html("");
					$("#nickOkMsg").html("사용 가능한 닉네임입니다.");
				}
				
			});
		}
		
		
		
		
		
		
		
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
          <h2 class="sub_tit_txt">회원가입</h2>
          <hr>
          <p class="exTxt">회원가입 시 핸드폰 인증을 진행하셔야 합니다.</p>
          
          <div class="join_form">
          <form action="personalinsert.action" method="post" id="personalInsertForm">
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
                  <th><span>아이디</span></th>
                  <td><input type="text" class="send_number" placeholder="아이디를 입력하세요." id="id" name="id">
                      <button type="button" class="btn btn-secondary" id="idCheckBtn"><font size="1.5">아이디 중복확인</font>
                      </button>
                      <span id="idErrMsg" class="errMsg"></span>
                  </td>
                </tr>
                <tr>
                  <th><span>이름</span></th>
                  <td><input type="text" id="name" name="name" class="name" placeholder="이름을 입력하세요."></td>
                </tr>
                <tr>
                	<th></th>
                	<td><span id="nameErrMsg" class="errMsg"></span></td>
                </tr>
                <!-- ★ 소연 수정 -->
                <tr>
                  <th><span>닉네임</span></th>
                  <td>
					<input type="text" class="nickName" placeholder="닉네임을 입력하세요." id="nickName" name="nickName">
                  </td>
                </tr>
                <tr>
                	<th></th>
                	<td><span id="nickErrMsg" class="errMsg"></span><span id="nickOkMsg" class="okMsg"></span></td>
                </tr>
                <tr>
                  <th><span>비밀번호</span></th>
                  <td><input type="password" id="password" name="password" class="password" placeholder="비밀번호를 입력하세요."></td>
                </tr>
                <tr>
                	<th></th>
                	<td><span id="pwErrMsg" class="errMsg"></span></td>
                </tr>
                <tr>
                  <th><span>번호확인</span></th>
                  <td><input type="password" id="password2" class="password2" placeholder="비밀번호를 한번 더 입력해주세요."></td>
                </tr>
                 <tr>
                	<th></th>
                	<td><span id="pw2ErrMsg" class="errMsg"></span></td>
                </tr>
                <tr class="email">
                  <th><span>이메일</span></th>
                  <td>
                    <input type="text" id="email" name="email" class="email" placeholder="이메일을 입력하세요.">
                  </td>
                <tr>
                	<th></th>
                	<td><span id="emailErrMsg" class="errMsg"></span></td>
                </tr>  
                <tr>
                  <th><span>휴대폰 번호</span></th>
                  <td><input type="text" id="tel" name="tel" class="phone" placeholder="전화번호를 입력하세요."
                  	  onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
                  </td>
                </tr>
                <tr>
                	<th></th>
                	<td><!-- <p>이미 가입했거나, 현재 가입이 불가능한 번호입니다.</p> -->
						<span id="telErrMsg" class="errMsg"></span></td>
                </tr>  
                <tr>
                  <th><span>인증번호</span></th>
                  <td><input type="text" class="send_number" placeholder="인증번호를 입력하세요." id="idnNumber" name="idnNumber"
                  		onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" disabled="disabled">
                      <button type="button" class="btn btn-secondary" id="idnBtn"><font size="2.5">인증번호 발송</font>
                      </button>
                  </td>
                </tr>
                <tr>
                	<th></th>
                	<td><span id="idnErrMsg" class="errMsg"></span><span id="idnOkMsg" class="okMsg"></span></td>
                </tr>
                <tr>
                  <th><span>주소</span></th>
                  <td>					
					<input type="text" id="upun" name="upun" placeholder="우편번호" readonly="readonly">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="roadAddr" name="roadAddr" placeholder="주소" readonly="readonly"><br>
					<input type="text" id="detailAddr" name="detailAddr" placeholder="상세주소">
					<input type="text" id="dong" name="dong" placeholder="참고항목" readonly="readonly"></td>
                </tr>
                <tr>
                	<th></th>
                	<td><span id="addrErrMsg" class="errMsg"></span></td>
                </tr>  
                <tr>
              </tbody>
            </table>
            </form>
            <div class="exform_txt"><span>표시는 필수적으로 입력해주셔야 가입이 가능합니다.</span></div>
           
          </div><!-- join_form E  -->
          <div class="text-center">
          	<span id="flagMsg" class="errMsg"></span>
          </div>
          <div class="btn_wrap">
            <button type="button" class="btn btn-secondary">취소하기</button>
			<button type="button" id="submitBtn" class="btn btn-primary">가입하기</button>
          </div>
          <br>
        </div> <!-- form_txtInput E -->
      </div><!-- content E-->
    </div> <!-- container E -->

</body>
</html>