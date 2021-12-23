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
<title>ChecklistWrite_third.jsp</title>

<!-- 통일하기로 한 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" 
integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>


</head>
<body>



<div>
	<c:import url="MenuNavbar_new.jsp"></c:import>
</div>

<br><br><br><br><br>

<main role="main" class="container">
  
	<div class="card mb-4 shadow-sm">
		<div class="card-header">
			<h2 class="my-0 font-weight-bold" style="text-align: center;">이 체크리스트에 스티커를 추가하시겠습니까?</h2><br>
			<p class="lead" style="text-align: center;">'나의 체크리스트'에서 같은 스티커를 붙여둔 체크리스트끼리 모아서 확인할 수 있습니다.</p>
		</div>
      
      	<!-- 1. 내가 이전에 작성했었던 스티커들을 가져와서 버튼의 value로 가져오기.. 가능한..? 
      			버튼 말고 해결할 방법이.. a태그..?
      			선택하면 3번에 들어가고 다시 클릭하면 빠지고.-->
        <div class="card-body">
        	<h3 class="card-title">내가 작성한 스티커</h3>
        	<p class="card-text">
        		<button type="button" class="btn btn-link">#너무좋음</button>
        		<button type="button" class="btn btn-link">#참고용</button>
        		<button type="button" class="btn btn-link">#자주볼거</button>
        		<button type="button" class="btn btn-link">#홍대근처</button>
        		<button type="button" class="btn btn-link">#역근처</button>
        		<button type="button" class="btn btn-link"></button>
        	</p>
        	
        	<!-- 2. 추가하기 버튼 클릭시 유효성 검사후 3번에 추가되도록 + 나의 스티커 테이블에 삽입되어야겠지..  -->
        	<h3 class="card-title">추가할 스티커</h3>
        	<div class="input-group mb-3">
			  <input type="text" class="form-control" 
			  placeholder="띄어쓰기 없이 #과 함께 작성해주세요. 특수기호 사용불가">
			  <div class="input-group-append">
			    <button class="btn btn-outline-secondary" type="button" id="addSticker">추가하기</button>
			  </div>
			</div>
        	<br>
        	
        	<!-- 3. 여기에 선택된 스티커들이 모두 보여짐. -->
        	<h3 class="card-title">선택한 스티커</h3>
        	<div class="input-group mb-3">
			  <input type="text" class="form-control" id="selectedSticker">
			  <div class="input-group-append">
			  </div>
			</div>
        	<br>
        	
        
			<div class="text-center mb-4">
				<!-- 추가하기 버튼 클릭시 유효성 검사 후 이 페이지 다시 로드해서 내 -->
		    	<a class="btn btn-lg btn-primary" href="#" role="button">작성 완료</a>
	    	</div>
     	</div>
	</div>
</main>

</body>
</html>