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
<title>ChecklistTest.jsp</title>
<style type="text/css">
.table {
	display: table;
}

.tr {
	display: table-row;
}

.td {
	display: table-cell;
	border-bottom: 1px solid black;
	padding: 3px;
}

.plus {
	width: auto;
	list-style-image: url(<%=cp%>/images/minus25.png);
	list-style-type: disc;
}
</style>
</head>
<body>
	<!-- 메뉴 영역 -->
	<div>
		<c:import url="MenuNavbar.jsp"></c:import>
	</div>
	<!-- 콘텐츠 영역 -->
	<div>
		<h1>체크리스트 작성</h1>
	</div>
	<div>
		<form action="">
			<input type="button" value="작성">
			<input type="button" value="취소">

			<div>
				<span style="color: gray; font-size: small;">(*) 표시가 되어 있는 항목은 필수 입력 사항입니다.</span>
			</div>
			<div class="table">
				<div class="tr">
					<div class="td">거주여부(*)</div>
					<div class="td">
						<label><input type="radio" name="residence_no" value="1">거주자</label> <label><input type="radio" name="residence_no" value="2">거주예정자</label>
					</div>
				</div>
				<div class="tr">
					<div class="td">주소(*)</div>
					<div class="td">
						<input type="text" id="roadaddr" disabled="disabled" placeholder="주소검색 버튼을 눌러주세요">
						<button type="button">주소검색</button>
					</div>
				</div>
				<div class="tr">
					<div class="td">동</div>
					<div class="td">
						<span id="dong">마포구 서교동</span>
					</div>
				</div>
				<div class="tr">
					<div class="td">제목(*)</div>
					<div class="td">
						<input type="text" name="title" id="title">
					</div>
				</div>
				<div class="tr">
					<div class="td">주거비</div>
					<div class="td">
						<ul>
							<li>월세 보증금 <input type="text" name="deposit" id="deposit">원 | 월세 <input type="text" name="mwolse" id="mwolse">원
							</li>
							<li>전세 보증금 <input type="text" name="mjeonse" id="mjeonse">원
							</li>
							<li>매매 매매가 <input type="text" name="mmaemae" id="mmaemae">원
							</li>
						</ul>
					</div>
				</div>
				<div class="tr">
					<div class="td">치안</div>
					<div class="td">
						<select name="sec_scoreno" id="sec_scoreno">
							<c:forEach var="i" begin="1" end="11" step="1">
								<option value="i">${(i-1)*0.5 }</option>
							</c:forEach>
						</select>
						점<br>
						<textarea name="sec_comment" id="sec_comment" cols="30" rows="5" placeholder="코멘트를 작성해주세요."></textarea>
					</div>
				</div>
				<div class="tr">
					<div class="td">교통</div>
				</div>
				<div class="tr">
					<div class="td">주요 출근시간</div>
					<div class="td">
						<ul>
							<li>2호선 강남역 까지 [ <span id="gangnam">1</span> ] 분
							</li>
							<li>2호선 을지로입구역 까지 [ <span id="uljiro">2</span> ] 분
							</li>
							<li>9호선 여의도역 까지 [ <span id="yeouido">3</span> ] 분
							</li>
							<li>공항철도 홍대입구역 까지 [ <span id="hongdae">4</span> ] 분
							</li>
							<li>1호선 가산디지털단지역 까지 [ <span id="gadi">5</span> ] 분
							</li>
							<li>8호선 잠실역 까지 [ <span id="jamsil">6</span> ] 분
							</li>
						</ul>
					</div>
				</div>
				<div class="tr">
					<div class="td">나의 출근시간</div>
					<div class="td">
						<input type="text" name="place" id="place">
						까지
						<input type="text" name="time" id="time">
						분
					</div>
				</div>
				<div class="tr">
					<div class="td">대중교통</div>
					<div class="td">
						<select name="tra_scoreno" id="tra_scoreno">
							<c:forEach var="i" begin="1" end="11" step="1">
								<option value="i">${(i-1)*0.5 }</option>
							</c:forEach>
						</select>
						점<br>
						<textarea name="tra_comment" id="tra_comment" cols="30" rows="5" placeholder="코멘트를 작성해주세요."></textarea>
					</div>
				</div>
				<div class="tr">
					<div class="td">교통혼잡도</div>
					<div class="td">
						<select name="hon_scoreno" id="hon_scoreno">
							<c:forEach var="i" begin="1" end="11" step="1">
								<option value="i">${(i-1)*0.5 }</option>
							</c:forEach>
						</select>
						점<br>
						<textarea name="hon_comment" id="hon_comment" cols="30" rows="5" placeholder="코멘트를 작성해주세요."></textarea>
					</div>
				</div>
				<div class="tr">
					<div class="td">
						생활편의시설<br> <span>유무 표시</span>
					</div>
					<div class="td">
						<ul>
							<li>대형마트/소형마트/시장/편의점 <input type="radio" name="mart" id="mart1"><label for="mart1">유</label> <input type="radio" name="mart" id="mart0"><label for="mart0">무</label></li>
							<li>세탁소/빨래방/수선집 <input type="radio" name="laundry" id="laundry1"><label for="laundry1">유</label> <input type="radio" name="laundry" id="laundry0"><label for="laundry0">무</label></li>
							<li>동네병원/대형병원/약국 <input type="radio" name="hospital" id="hospital1"><label for="hospital1">유</label> <input type="radio" name="hospital" id="hospital0"><label for="hospital0">무</label></li>
							<li>음식점/카페/배달 <input type="radio" name="food" id="food1"><label for="food1">유</label> <input type="radio" name="food" id="food0"><label for="food0">무</label></li>
							<li>문화시설(영화관, 헬스장 등) <input type="radio" name="culture" id="culture1"><label for="culture1">유</label> <input type="radio" name="culture" id="culture0"><label for="culture0">무</label></li>
							<li>공원/산책로/자연환경 <input type="radio" name="park" id="park1"><label for="park1">유</label> <input type="radio" name="park" id="park0"><label for="park0">무</label></li>
						</ul>
					</div>
				</div>
				<div class="tr">
					<div class="td">반려동물</div>
					<div class="td">
						<select name="pet_scoreno" id="pet_scoreno">
							<c:forEach var="i" begin="1" end="11" step="1">
								<option value="i">${(i-1)*0.5 }</option>
							</c:forEach>
						</select>
						점<br>
						<textarea name="pet_comment" id="pet_comment" cols="30" rows="5" placeholder="코멘트를 작성해주세요."></textarea>
					</div>
				</div>
				<div class="tr">
					<div class="td">추가항목</div>
					<div class="td">
						<img src="<%=cp%>/images/plus25.png" onclick=""> 항목 추가
						<p>
							항목명
							<input type="text" name="plus_title" id="plus_title">
							평가기준
							<select name="timeorScore" id="timeorscore">
								<option value="time">시간</option>
								<option value="score">점수</option>
							</select>
						</p>
						<ul class="plus">
							<li>추가항목명1 점수 <select name="plus_scoreno1" id="plus_scoreno1">
									<c:forEach var="i" begin="1" end="11" step="1">
										<option value="i">${(i-1)*0.5 }</option>
									</c:forEach>
								</select> 점<br> <textarea name="plus_comment1" id="plus_comment1" cols="30" rows="5" placeholder="코멘트를 작성해주세요."></textarea>
							</li>
							<li>추가항목명2 시간 <input type="text" name="plus_time2" id="plus_time2"> 분<br> <textarea name="plus_comment2" id="plus_comment2" cols="30" rows="5" placeholder="코멘트를 작성해주세요."></textarea>
							</li>
						</ul>
					</div>
				</div>
				<div class="tr">
					<div class="td">코멘트</div>
					<div class="td">
						<p>
							장점<br>
							<textarea name="content_good" id="content_good" cols="30" rows="5" placeholder="자유롭게 작성해주세요."></textarea>
						</p>
						<p>
							단점<br>
							<textarea name="content_bad" id="content_bad" cols="30" rows="5" placeholder="자유롭게 작성해주세요."></textarea>
						</p>
						<p>
							기타<br>
							<textarea name="content_etc" id="content_etc" cols="30" rows="5" placeholder="자유롭게 작성해주세요."></textarea>
						</p>
					</div>
				</div>
				<div class="tr">
					<div class="td">
						비밀 코멘트<br> <span>비공개 영역</span>
					</div>
					<div class="td">
						<textarea name="secret_content" id="secret_content" cols="30" rows="5" placeholder="자유롭게 작성해주세요."></textarea>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>