<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<title>PwdChange.jsp</title>

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
}
</style>

<!-- Custom styles for this template -->
<link href="<%=cp%>/css/floating-labels.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
   
   $(function()
   {
      $("#submitBtn").click(function()
      {
         // 경고 폼 초기화
         $("#formErrMsg").html("");
         
         // 현재 비밀번호 유효성 검사 → 입력했는지, 안했는지만 검사하고 맞는지 아닌지는 폼 submit 후 검사
         if ($("#nowPwd").val()=="")
         {
            $("#formErrMsg").html("현재 비밀번호를 입력해주세요.");
            return;
         }
         
         // 새 비밀번호 유효성 검사
         // 1. 입력여부
         // 2. 형식이 맞는지 (8~12자 하나 이상의 숫자, 문자, 특문 포함) → 1, 2번을 같이 검사
         // 3. 새 비밀번호, 비밀번호 확인이 같은지
         
         var pw_RegExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,12}$/;
         var newPwd = $("#newPwd").val();
         
         if (newPwd=="" || !pw_RegExp.test(newPwd))   // 1, 2번
         {
            $("#formErrMsg").html("새 비밀번호는 8~12자의, 하나 이상의 문자와 숫자 및 특수문자를 포함하여 입력하여 주세요.");
            return;
         }
         
         if ($("#newPwd").val() != $("#confirmPwd").val())   // 3번
         {
            $("#formErrMsg").html("새 비밀번호와 확인이 일치하지 않습니다");
            return;
         }
         
         $("#pwdChangeForm").submit();
      });
   });
   
</script>
</head>
<body>
   <!-- 메뉴바 영역 -->
   <div>
      <c:import url="/nav.action"></c:import>
   </div>
   
   <!-- 아이디 찾기 -->
   <form action="pwdchange.action" class="form-signin text-center" id="pwdChangeForm" method="post">
      <c:if test="${errMsg != null}">
         <div class="alert alert-primary alert-dismissible fade show" role="alert" id="errMsg">
            <strong>현재 비밀번호가 <br>올바르지 않습니다!</strong>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
               <span aria-hidden="true">&times;</span>
            </button>
         </div>
         </c:if>
   
      <div class="text-center mb-4">
         <h1 class="h3 mb-3 font-weight-normal">비밀번호 변경</h1>
         <p>현재 비밀번호와 새 비밀번호를 입력해주세요.</p>
         <p>새 비밀번호는 8~12자의 하나 이상의 문자와 숫자 및 특수문자를 포함하여 입력해주세요.</p>
      </div>
      
      <div class="form-label-group">
         <input type="password" id="nowPwd" name="nowPwd" class="form-control" maxlength="12" required="required">
         <label for="nowPwd" class="text-left">현재 비밀번호</label>
      </div>
      
      <hr style="margin: 25px 0;">
      
      <div class="form-label-group">
         <input type="password" id="newPwd" name="newPwd" class="form-control" maxlength="12" required="required">
         <label for="newPwd" class="text-left">새 비밀번호</label>
      </div>
      <div class="form-label-group">
         <input type="password" id="confirmPwd" class="form-control" maxlength="12" required="required">
         <label for="confirmPwd" class="text-left">새 비밀번호 확인</label>
      </div>
      
      <div class="text-center mb-4">
      </div>
      <span class="errMsg" id="formErrMsg"></span>
      <button type="button" class="btn btn-lg btn-primary btn-block" id="submitBtn" style="margin-top: 20px;">확인</button>
   </form>
   
   
</body>
</html>