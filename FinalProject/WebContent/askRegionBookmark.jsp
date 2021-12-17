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
<title>askRegionBookmark.jsp</title>
<!-- 팝업창! 관심지역 추가 -->

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
		<div class="card-header"><h4 class="my-0 font-weight-normal">관심 지역에 추가하시겠습니까?</h4></div>
      
        <div class="card-body">
        	<h3 class="card-title">내가 작성한 북마크 스티커</h3>
        	<p class="card-text">
        		<button type="button" class="btn btn-link">#너무좋음</button>
        		<button type="button" class="btn btn-link">#참고용</button>
        		<button type="button" class="btn btn-link">#자주볼거</button>
        		<button type="button" class="btn btn-link">#홍대근처</button>
        		<button type="button" class="btn btn-link">#역근처</button>
        	</p>
        	<br>
        	<h3 class="card-title">추가할 북마크 스티커</h3>
        	<div class="input-group mb-3">
			  <input type="text" class="form-control" placeholder="띄어쓰기 없이 #과 함께 작성해주세요. 특수기호사용불가" 
			    aria-label="Recipient's username" aria-describedby="button-addon2">
			    
			  <!-- 이쪽에 추가하기 버튼이 있는 것도 괜찮을 것 같은데 .. ! 일단은 원래 형태대로..
			  <div class="input-group-append">
			    <button class="btn btn-outline-secondary" type="button" id="button-addon2">추가하기</button>
			  </div> -->
			</div>
        	
        
			<div class="text-center mb-4">
		    	<a class="btn btn-lg btn-primary" href="/docs/4.6/components/navbar/" role="button">추가하기</a>
		    	<a class="btn btn-lg btn-primary" href="/docs/4.6/components/navbar/" role="button" >취소하기</a>
	    	</div>
     	</div>
	</div>
</main>

</body>
</html>

