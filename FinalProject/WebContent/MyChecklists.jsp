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
<title>MyChecklists.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
</head>
<body>
   <!-- 나의 체크리스트 목록 -->

   <!-- 메뉴바 영역 -->
   <div>
      <c:import url="MenuNavbar_new.jsp"></c:import>
   </div>

   <!-- 본문 영역 -->
   <div class="container">
      <div class="py-5 text-center">
         <h1 style="margin-top: 70px;">나의 체크리스트</h1>
         <!-- <p class="lead">뭐라고 하징... 암튼 본문 쓸거없으면 삭제하기</p> -->
         <br><br>
         <a href="#" class="btn btn-primary my-2">새 체크리스트 작성</a>
      </div>

      <!-- 본문 상단영역(필터) 시작 -->
      <div class="card" style="margin-bottom: 20px;">
         <div class="card-header">알아볼 내용</div>
         <div class="card-body">
            <form action="">
				<div class="form-row">
					<div class="form-group col-md-3">
						<label for="inputState">분류</label> <select id="inputState1"
							class="form-control">
							<option value="1" selected class="text-center">-- 전체 보기 --</option>
							<option value="2">나의 체크리스트</option>
							<option value="3">북마크</option>
							<option value="4">지역정보</option>
						</select>
					</div>
					<div class="form-group col-md-3">
						<label for="inputState">지역 구</label> <select id="inputState2"
							class="form-control">
							<option value="1" selected class="text-center">-- 전체 보기 --</option>
							<option value="2">강남구</option>
							<option value="3">강동구</option>
							<option value="4">기타등등</option>
							<option value="26">25개</option>
						</select>
					</div>
					<div class="form-group col-md-3">
						<label for="inputState">지역 동</label> <select id="inputState3"
							class="form-control">
							<option value="1" selected class="text-center">-- 전체 보기 --</option>
							<option value="2">ㅁㅁ동</option>
							<option value="3">ㄴㄴ동</option>
							<option value="4">ㅇㅇ동</option>
							<option value="5">ㅎㅎ동</option>
						</select>
					</div>
				</div>
				<button type="reset" class="btn btn-secondary btn-sm" id="reset">초기화</button>
			</form>
         </div>
      </div>

      <div class="card" style="margin-bottom: 20px;">
         <div class="card-header">비교할 내용</div>
         <div class="card-body">
         	<form action="">
	            <div class="form-row">
	               <div class="form-group col-md-1.5">
	                  <div class="custom-control custom-switch">
	                     <input type="checkbox" class="custom-control-input" id="wolse" name="bigyo">
	                     <label class="custom-control-label" for="wolse">월세</label>
	                  </div>
	               </div>
	               <div class="form-group col-md-1.5">
	                  <div class="custom-control custom-switch">
	                     <input type="checkbox" class="custom-control-input" id="jeonse" name="bigyo">
	                     <label class="custom-control-label" for="jeonse">전세</label>
	                  </div>
	               </div>
	               <div class="form-group col-md-1.5">
	                  <div class="custom-control custom-switch">
	                     <input type="checkbox" class="custom-control-input" id="maemae" name="bigyo">
	                     <label class="custom-control-label" for="maemae">매매</label>
	                  </div>
	               </div>
	               <div class="form-group col-md-1.5">
	                  <div class="custom-control custom-switch">
	                     <input type="checkbox" class="custom-control-input" id="security" name="bigyo">
	                     <label class="custom-control-label" for="security">치안</label>
	                  </div>
	               </div>
	               <div class="form-group col-md-1.5">
	                  <div class="custom-control custom-switch">
	                     <input type="checkbox" class="custom-control-input" id="transportation" name="bigyo">
	                     <label class="custom-control-label" for="transportation">대중교통</label>
	                  </div>
	               </div>
	               <div class="form-group col-md-1.5">
	                  <div class="custom-control custom-switch">
	                     <input type="checkbox" class="custom-control-input" id="honjap" name="bigyo">
	                     <label class="custom-control-label" for="honjap">교통혼잡도</label>
	                  </div>
	               </div>
	               <div class="form-group col-md-1.5">
	                  <div class="custom-control custom-switch">
	                     <input type="checkbox" class="custom-control-input" id="conv" name="bigyo">
	                     <label class="custom-control-label" for="conv">생활편의시설</label>
	                  </div>
	               </div>
	               <div class="form-group col-md-1.5">
	                  <div class="custom-control custom-switch">
	                     <input type="checkbox" class="custom-control-input" id="pet" name="bigyo">
	                     <label class="custom-control-label" for="pet">반려동물</label>
	                  </div>
	               </div>
            	</div>
            	<button type="reset" class="btn btn-secondary btn-sm" id="reset2">초기화</button>
         	</form>
         </div>
      </div>

      <div class="card" style="margin-bottom: 20px;">
         <div class="card-header">나의 스티커</div>
         <div class="card-body">
         	<!-- 데이터가 존재하지 않을 때 
         	<br>
         	<p class="text-center">나의 스티커가 존재하지 않습니다.</p> -->
            <div class="btn-group-toggle" data-toggle="buttons">
            <form action="">
               <label class="btn btn-outline-primary"> <input type="checkbox" name="sticker"> 스티커1
               </label> <label class="btn btn-outline-primary"> <input type="checkbox" name="sticker"> 스티커2
               </label> <label class="btn btn-outline-primary"> <input type="checkbox" name="sticker"> 반복문 써서
               </label> <label class="btn btn-outline-primary"> <input type="checkbox" name="sticker"> 값 받아와서 출력하면 됨
               </label>
               <br>
               <button type="reset" class="btn btn-secondary btn-sm" id="reset3">초기화</button>
			</form>	             
            </div>
         </div>
      </div>
      <!-- 본문 상단영역(필터) 끝 -->
      <hr class="mb-4">

      <!-- 본문 하단영역(체크리스트 목록) 출력 -->
      <div class="table-responsive">
         <table class="card-text table table-striped">
            <thead>
               <tr>
                  <th>분류</th>
                  <th>지역</th>
                  <th>제목</th>
                  <th>보증금</th>
                  <th>월세</th>
                  <th>전세</th>
                  <th>매매</th>
                  <th>치안</th>
                  <th>대중교통</th>
                  <th>교통혼잡도</th>
                  <th>생활편의시설</th>
                  <th>반려동물</th>
               </tr>
            </thead>
            <tbody>
            	<!-- 데이터가 존재하지 않을 때
            	<tr>
            		<td colspan="12">
            			<br>
            			<p class="text-center">나의 체크리스트가 존재하지 않습니다.</p>
            			<p class="text-center">체크리스트를 작성해주세요.</p>
            		</td>
               	</tr> -->
               <tr>
                  <td>나의 체크리스트</td>
                  <td>관악구 신림동</td>
                  <td>신림역 좋아보임!</td>
                  <td>3000 만원</td>
                  <td>40 만원</td>
                  <td>35000 만원</td>
                  <td>42000 만원</td>
                  <td>3.5</td>
                  <td>4.5</td>
                  <td>4.0</td>
                  <td>4 / 6점</td>
                  <td>3.5</td>
               </tr>
               <tr>
                  <td colspan="12">나의 스티커 : #회사30분컷 #산책로있음 #신축 살고싶은동네 #아이고졸려 #그만하고싶다 #해시태그1 #해시태그2</td>
               </tr>
               <tr>
                  <td>북마크</td>
                  <td>마포구 합정동</td>
                  <td>내가 북마크했당</td>
                  <td>2000 만원</td>
                  <td>50 만원</td>
                  <td></td>
                  <td></td>
                  <td>2.5</td>
                  <td></td>
                  <td>4.0</td>
                  <td>1 / 6점</td>
                  <td></td>
               </tr>
               <tr>
                  <td colspan="12">나의 스티커 : #해시태그1 #해시태그2 #해시태그1 #해시태그2 #해시태그1 #해시태그2 #해시태그1 #해시태그2 #해시태그1 #해시태그2 #해시태그1 #해시태그2 #해시태그1 #해시태그2 #해시태그1 #해시태그2 #해시태그길게써보기이이이 #해시태그기이이일게</td>
               </tr>
               <tr>
                  <td>지역정보</td>
                  <td>양천구 목동</td>
                  <td>양천구 목동 평균</td>
                  <td>3142 만원</td>
                  <td>52 만원</td>
                  <td>12303 만원</td>
                  <td>41004 만원</td>
                  <td>3.7</td>
                  <td>3.3</td>
                  <td>4.1</td>
                  <td>3.8 / 6점</td>
                  <td>2.8</td>
               </tr>
               <tr>
                  <td colspan="12">나의 스티커 : #얘는평균값이라 #값이5로안떨어진당 #평균값은값전부출력</td>
               </tr>
               <tr>
                  <td>북마크</td>
                  <td>마포구 합정동</td>
                  <td>내가 북마크했당2</td>
                  <td>2000 만원</td>
                  <td>50 만원</td>
                  <td></td>
                  <td></td>
                  <td>2.5</td>
                  <td></td>
                  <td>4.0</td>
                  <td>1 / 6점</td>
                  <td>5.0</td>
               </tr>
               <tr>
                  <td colspan="12">나의 스티커 : #뷰페이지를위해서 #복붙중입니다 #허허허</td>
               </tr>
               <tr>
                  <td>북마크</td>
                  <td>마포구 합정동</td>
                  <td>내가 북마크했당3</td>
                  <td>2000 만원</td>
                  <td>50 만원</td>
                  <td></td>
                  <td></td>
                  <td>3.0</td>
                  <td></td>
                  <td>4.0</td>
                  <td>3 / 6점</td>
                  <td></td>
               </tr>
               <tr>
                  <td colspan="12">나의 스티커 :</td>
               </tr>
               <tr>
                  <td>북마크</td>
                  <td>마포구 서교동</td>
                  <td>내가 북마크했당4</td>
                  <td>3000 만원</td>
                  <td>40 만원</td>
                  <td></td>
                  <td></td>
                  <td>2.5</td>
                  <td>3.0</td>
                  <td>4.0</td>
                  <td>5 / 6점</td>
                  <td>4.0</td>
               </tr>
               <tr>
                  <td colspan="12">나의 스티커 : #위에건스티커없당 #ㅎㅎㅎ #해시태그1 #해시태그2</td>
               </tr>
               <tr>
                  <td>북마크</td>
                  <td>마포구 서교동</td>
                  <td>내가 북마크했당4</td>
                  <td>3000 만원</td>
                  <td>40 만원</td>
                  <td></td>
                  <td>27000</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td>4.0</td>
               </tr>
               <tr>
                  <td colspan="12">나의 스티커 :</td>
               </tr>
               <tr>
                  <td>북마크</td>
                  <td>마포구 서교동</td>
                  <td>내가 북마크했당4</td>
                  <td>3000 만원</td>
                  <td>40 만원</td>
                  <td></td>
                  <td>27000</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td>4.0</td>
               </tr>
               <tr>
                  <td colspan="12">나의 스티커 : #위에건스티커없당 #ㅎㅎㅎ #해시태그1 #해시태그2</td>
               </tr>
               <tr>
                  <td>북마크</td>
                  <td>마포구 서교동</td>
                  <td>내가 북마크했당4</td>
                  <td>3000 만원</td>
                  <td>40 만원</td>
                  <td></td>
                  <td>27000</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td>4.0</td>
               </tr>
               <tr>
                  <td colspan="12">나의 스티커 :</td>
               </tr>
               <tr>
                  <td>북마크</td>
                  <td>마포구 서교동</td>
                  <td>내가 북마크했당4</td>
                  <td>3000 만원</td>
                  <td>40 만원</td>
                  <td></td>
                  <td>27000</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td>4.0</td>
               </tr>
               <tr>
                  <td colspan="12">나의 스티커 : #위에건스티커없당 #ㅎㅎㅎ #해시태그1 #해시태그2</td>
               </tr>
            </tbody>
         </table>
      </div>

      <hr class="mb-4">

      <div style="margin-bottom: 50px;"></div>
   </div>

   <!-- footer 영역 -->
   <div></div>

</body>
</html>