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
<title>addRegionBookmark.jsp</title>
<!-- 지역 평균 정보 확인하고 관심지역(북마크) 추가 버튼 -->

<!-- 통일하기로 한 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" 
integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
	
	
<style type="text/css">
.text-essential {
	color: #FFA7A7;
}
</style>
</head>
<body>
	<!-- 체크리스트 작성 뷰 페이지 -->

<!-- 메뉴바 영역 -->
<div>
	<c:import url="MenuNavbar_new.jsp"></c:import>
</div>

<!-- 본문 영역 -->
<div class="container">
		<div class="py-5 text-center">
			<h2 style="margin-top: 50px;">지역 정보</h2>
		</div>
		
		<br><br>
		
<table class="table table-bordered">
    <tr>
      <th scope="row" style="text-align: center; width:30%">주거비 평균
      (단위 : 만원)</th>
      <td>
      보증금<input type="text" class="form-control" disabled id="deposit" value="1천" required="">
      월세<input type="text" class="form-control" disabled id="mwolse" value="60" required="">
      전세<input type="text" class="form-control" disabled id="mjeonse" value="3천" required="">
      매매<input type="text" class="form-control" disabled id="mmaemae" value="1억 5천" required="">
      </td>
    </tr>
    <tr>
      <th scope="row" style="text-align: center;">치안 평균 점수</th>
      <td colspan="2">
      	<input class="form-control" type="text" disabled id="sec_score" value="4.5">
      </td>
    </tr>
    <tr>
      <th scope="row" style="text-align: center;">대중교통 평균 점수</th>
      <td>
      	<input class="form-control" type="text" disabled id="trans_score" value="4.5">
      </td>
    </tr>
    <tr>
      <th scope="row" style="text-align: center;">교통혼잡도 평균 점수</th>
      <td>
      	<input class="form-control" type="text" disabled id="honjap_score" value="4.6">
      </td>
    </tr>
    <tr>
      <th scope="row" style="text-align: center;">생활편의시설 평균 점수</th>
      <td>
      	<input class="form-control" type="text" disabled id="conv_score" value="3.8">
      </td>
    </tr>
    <tr>
      <th scope="row" style="text-align: center;">반려동물 평균 점수</th>
      <td>
      	<input class="form-control" type="text" disabled id="pet_score" value="3.4">
      </td>
    </tr>
</table>
<br><br><br>

	<!-- 북마크 관련 추가 -->
			<div class="card-header"><h4 class="my-0 font-weight-normal">북마크에 추가하시겠습니까?</h4></div>
		        <div class="card-body">
					
					<div class="input-group mb-3">
					  <div class="input-group-prepend">
					    <span class="input-group-text" id="basic-addon1">북마크 제목</span>
					  </div>
					  <input type="text" class="form-control" required="required"
					   placeholder="북마크 제목을 붙여주세요. 15자 제한">
					</div>
					
		        	<br><br>
					<div class="text-center mb-4">
				    	<a class="btn btn-lg btn-outline-primary" href="#" role="button">추가하기</a>
				    	<a class="btn btn-lg btn-outline-primary" href="#" role="button" >취소하기</a>
			    	</div>
		     	</div>


</div>
	<!-- footer 영역 -->
	<div>
	</div>

</body>
</html>