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
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
   integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
   crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
   integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
   crossorigin="anonymous">
<title>Main.jsp</title>
</head>
<body>

   <!-- 메뉴 영역 -->
   <%-- <div>
      <c:import url="MenuNavbar_admin.jsp"></c:import>
   </div> --%>

   <!-- 콘텐츠 영역 -->
   <br>
   <br>

   <main role="main">

      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron">
         <div class="container">
            <h1 class="display-3">안녕하세요💗</h1>
            <br>
            <h2>서로 홈페이지에 오신 것을 환영합니다!</h2>
            <p>
               서로란 ?
                <br>1인 자취가구들을 위해 지역정보, 체크리스트, 공동구매 등 다양한 서비스들을 제공해줍니다.
            </p>    
            <p>   Hello ! We offer Various services such as local
               information, checklist, and joint purchase are provided for
               single-person households.
            </p>
            <!-- 서비스 소개로 가는 버튼 -->
            <p>
               <a class="btn btn-primary btn-lg" href="<%=cp%>/Introduction_user.jsp" role="button">서로를
                  알아보러 갈까요? »</a>
            </p>
         </div>
      </div>

      <div class="container">
         <!-- Example row of columns -->
         <div class="row" style="width: 153%">
            <div class="col-md-4">
               <h2>인기 체크리스트</h2>
               <p>Will you do the same for me? It's time to face the music I'm
                  no longer your muse. Heard it's beautiful, be the judge and my
                  girls gonna take a vote. I can feel a phoenix inside of me. Heaven
                  is jealous of our love, angels are crying from up above. Yeah, you
                  take me to utopia.</p>
               <p>
                  <a class="btn btn-secondary" href="<%=cp%>/.jsp" role="button">보러가기 »</a>
               </p>
            </div>
            <div class="col-md-4">
               <h2>인기 지역정보</h2>
               <p>Standing on the frontline when the bombs start to fall.
                  Heaven is jealous of our love, angels are crying from up above.
                  Can't replace you with a million rings. Boy, when you're with me
                  I'll give you a taste. There’s no going back. Before you met me I
                  was alright but things were kinda heavy. Heavy is the head that
                  wears the crown.</p>
               <p>
                  <a class="btn btn-secondary" href="<%=cp%>/.jsp" role="button">보러가기 »</a>
               </p>
            </div>

         </div>

         <hr>

         <div class="row">
            <div class="col-md-4">
               <h2>공지사항</h2>
               <p>Will you do the same for me? It's time to face the music I'm
                  no longer your muse. Heard it's beautiful, be the judge and my
                  girls gonna take a vote. I can feel a phoenix inside of me. Heaven
                  is jealous of our love, angels are crying from up above. Yeah, you
                  take me to utopia.</p>
               <p>
                  <a class="btn btn-secondary" href="<%=cp%>/NoticeList_user.jsp" role="button">보러가기 »</a>
               </p>
            </div>
            <div class="col-md-4">
               <h2>지역정보</h2>
               <p>Standing on the frontline when the bombs start to fall.
                  Heaven is jealous of our love, angels are crying from up above.
                  Can't replace you with a million rings. Boy, when you're with me
                  I'll give you a taste. There’s no gong back. Before you met me I
                  was alright but things were kinda heavy. Heavy is the head that
                  wears the crown.</p>
               <p>
                  <a class="btn btn-secondary" href="<%=cp%>/.jsp" role="button">보러가기 »</a>
               </p>
            </div>
            <div class="col-md-4">
               <h2>자주 묻는 질문</h2>
               <p>Playing ping pong all night long, everything's all neon and
                  hazy. Yeah, she's so in demand. She's sweet as pie but if you
                  break her heart. But down to earth. It's time to face the music
                  I'm no longer your muse. I guess that I forgot I had a choice.</p>
               <p>
                  <a class="btn btn-secondary" href="<%=cp%>/FaqList.jsp" role="button">보러가기 »</a>
               </p>
            </div>
         </div>

      </div>
      <!-- /container -->

   </main>


</body>
</html>