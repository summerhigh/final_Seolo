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
<title>NoticeWrite.jsp</title>
<!-- 신고받은 것을 클릭시 보이는 상세 페이지 -->

<!-- 통일하기로 한 부트스트랩 -->
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
   integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
   crossorigin="anonymous">
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
   crossorigin="anonymous"></script>

</head>
<body>

   <!-- 내비바 -->
   <div>
      <c:import url="MenuNavbar_admin.jsp"></c:import>
   </div>

   <br>
   <br>
   <br>
   <br>
   <br>

   <div class="container">
      <!-- 게시판 메인 -->
      <div class="page-header">
         <h1 class="page-heading">신고 및 블라인드</h1>
         <hr>

         <br>
         <table class="table table-striped table-bordered">
            <tr>

               <tr>
            <!-- 신고 고유 번호 -->
               <th width="150px;">신고 번호</th>
               <!-- <td>{{ article.pk }}</td> -->
               <td>1</td>
               <th width="150px;">신고 카테고리</th>
               <!-- <td>{{ article.title }}</td> -->
               <td>도배</td>
            </tr><tr>
               <th width="150px;">신고자</th>
               <!-- <td>{{ article.author }}</td> -->
               <td>mildline</td>
               <th width="150px;">원글 작성자</th>
               <!-- <td>{{ article.author }}</td> -->
               <td>butter</td>
            </tr>
            <tr>
               <th>작성일시</th>
               <!-- <td>{{ article.created_at }}</td> -->
               <td>2021-12-15</td>
               <th width="150px;">작성 시간</th>
               <!-- <td>{{ article.author }}</td> -->
               <td>13:50</td>
            </tr>

            <tr>
               <th height="150px;">내용</th>
               <!-- <td>{{ article.content }}</td> -->
               <td colspan="3"><br>
               <br> 신고 당한 곳 주소 : http://seoro/List/131.com</td>
            </tr>
            <tr>
               <th height="100px;">신고 상세 사유</th>
               <!-- 회원이 입력한 내용 -->
               <td colspan="3"><br> 신고 카테고리가 기타일 경우에만 여기 입력된 상세사유가 나온다.
               </td>
            </tr>

         </table>




         <!-- 글쓰기 버튼 -->
         <div class="d-flex justify-content-end">
            <!-- 이 글쓰기 버튼은 관리자에게만 나타나는 버튼! -->
            <button type="button" class="btn btn-primary">승인</button>
            &nbsp;
            <button type="button" class="btn btn-primary"">반려</button>
            &nbsp;
            <button type="button" class="btn btn-primary">허위신고</button>
            &nbsp;
            <button type="button" class="btn btn-secondary">목록으로</button>
         </div>
         <br> <br>


      </div>
   </div>

</body>
</html>