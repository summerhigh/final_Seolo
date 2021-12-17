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
	p 
	{ 
		font-size: small;
		color: red; 
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		
		$("#submitBtn").click(function()
		{
			//alert("확인");
			$("#personalInsertForm").submit();
			
		});
		
		
		
		
	});
	

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
                <tr>
                  <th><span>아이디</span></th>
                  <td><input type="text" id="id" name="id" class="id" placeholder="ID를 입력하세요."></td>
                </tr>
                <tr>
                	<th></th>
                	<td><p>사용할 수 없는 아이디입니다.</p><p>아이디를 입력해주세요.</p></td>
                </tr>
                <tr>
                  <th><span>이름</span></th>
                  <td><input type="text" id="name" name="name" class="name" placeholder="이름을 입력하세요."></td>
                </tr>
                <tr>
                	<th></th>
                	<td><p>이름을 입력해주세요.</p></td>
                </tr>
                <tr>
                  <th><span>닉네임</span></th>
                  <td><input type="text" id="nickName" name="nickName" class="nickname" placeholder="닉네임을 입력하세요."></td>
                </tr>
                <tr>
                	<th></th>
                	<td><p>사용할 수 없는 닉네임입니다.</p><p>닉네임을 입력해주세요.</p></td>
                </tr>
                <tr>
                  <th><span>비밀번호</span></th>
                  <td><input type="text" id="password" name="password" class="password" placeholder="비밀번호를 입력하세요."></td>
                </tr>
                <tr>
                	<th></th>
                	<td><p>비밀번호를 입력해주세요.</p></td>
                </tr>
                <tr>
                  <th><span>번호확인</span></th>
                  <td><input type="text" class="password2" placeholder="비밀번호를 확인하세요."></td>
                </tr>
                 <tr>
                	<th></th>
                	<td><p>비밀번호를 확인해주세요.</p></td>
                </tr>
                <tr class="email">
                  <th><span>이메일</span></th>
                  <td>
                    <input type="text" id="email" name="email" class="email" placeholder="이메일을 입력하세요.">
                  </td>
                <tr>
                	<th></th>
                	<td><p>이메일을 입력해주세요.</p></td>
                </tr>  
                <tr>
                  <th><span>휴대폰 번호</span></th>
                  <td><input type="text" id="tel" name="tel" class="phone" placeholder="전화번호를 입력하세요."
                  	  onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
                  </td>
                </tr>
                <tr>
                	<th></th>
                	<td><p>이미 가입했거나, 현재 가입이 불가능한 번호입니다.</p>
						<p>휴대전화를 입력해주세요.</p></td>
                </tr>  
                <tr>
                  <th><span>인증번호</span></th>
                  <td><input type="text" class="send_number" placeholder="인증번호를 입력하세요.">
                      <button type="button" class="btn btn-secondary"><font size="2.5">인증번호 발송</font></button>
                  </td>
                </tr>
                <tr>
                  <th><span>주소</span></th>
                  <td><input type="text" class="upun" readonly="readonly" placeholder="우편번호">
                    <button type="button" class="btn btn-secondary"><font size="2.5">우편번호 검색</font></button>
					<!-- <input type="text" class="address" readonly="readonly" placeholder="주소"></input> -->
					<input type="text" id="roadAddr" name="roadAddr" class="address" placeholder="주소"></input>
					<input type="text" id="detailAddr" name="detailAddr" class="detailaddress" placeholder="상세주소를 입력해주세요."></input></td>
                </tr>
                <tr>
                	<th></th>
                	<td><p>주소를 입력해주세요.</p></td>
                </tr>  
                <tr>
              </tbody>
            </table>
            </form>
            <div class="exform_txt"><span>표시는 필수적으로 입력해주셔야 가입이 가능합니다.</span></div>
           
          </div><!-- join_form E  -->
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