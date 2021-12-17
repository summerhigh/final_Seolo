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
<title>addCheckBookmark.jsp</title>
<!-- 개별 체크리스트 확인하고 북마크 버튼 -->

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
			<h2 style="margin-top: 50px;">체크리스트</h2>
		</div>
		
		<button type="button" class="btn btn-outline-primary float-right">북마크 추가 / 해제</button>
		<br><br>
		<!-- 폼 시작 -->
		<form class="needs-validation" novalidate="">
			<h4 class="mb-3">거주여부</h4>
			<div class="d-block my-3" disabled>
				<div class="custom-control custom-radio">
					<input id="credit" name="paymentMethod" type="radio"
						class="custom-control-input" checked="checked" required=""> <label
						class="custom-control-label" for="credit">거주</label>
				</div>
				<div class="custom-control custom-radio">
					<input id="debit" name="paymentMethod" type="radio"
						class="custom-control-input" required=""> <label
						class="custom-control-label" for="debit">거주예정</label>
				</div>
				<div class="custom-control custom-radio">
					<input id="paypal" name="paymentMethod" type="radio"
						class="custom-control-input" required=""> <label
						class="custom-control-label" for="paypal">비거주</label>
				</div>
			</div>

			<hr class="mb-4">

			<div class="row">
				<!-- 본문 우측 영역 -->
				<div class="col-md-4 order-md-2 mb-4">
					
					<h4 class="mb-3">지역분류</h4>
					<div class="row mb-3" style="align-items: center; display: flex; justify-content: center;">
						<ul class="col list-group col-md-4 themed-grid-col">
							<li class="list-group-item">영등포구</li>
						</ul>
						<ul class="col list-group col-md-5 themed-grid-col"> 
							<li class="list-group-item">영등포동1가</li>
						</ul>
					</div>
					
					<hr class="mb-4">
					<h4 class="d-flex justify-content-between align-items-center mb-3">
						<span class="mb-3">주요 출근시간</span>
					</h4>
					<ul class="list-group mb-3">
						<li
							class="list-group-item d-flex justify-content-between lh-condensed">
							<div>
								<h6 class="my-0">2호선 강남역 까지</h6>
							</div> <span class="badge badge-secondary">15분</span>
						</li>
						<li
							class="list-group-item d-flex justify-content-between lh-condensed">
							<div>
								<h6 class="my-0">2호선 을지로입구역 까지</h6>
							</div> <span class="badge badge-secondary">22분</span>
						</li>
						<li
							class="list-group-item d-flex justify-content-between lh-condensed">
							<div>
								<h6 class="my-0">9호선 여의도역 까지</h6>
							</div> <span class="badge badge-secondary">35분</span>
						</li>
						<li
							class="list-group-item d-flex justify-content-between lh-condensed">
							<div>
								<h6 class="my-0">공항철도 홍대입구역 까지</h6>
							</div> <span class="badge badge-secondary">14분</span>
						</li>
						<li
							class="list-group-item d-flex justify-content-between lh-condensed">
							<div>
								<h6 class="my-0">1호선 가산디지털단지역 까지</h6>
							</div> <span class="badge badge-secondary">35분</span>
						</li>
						<li
							class="list-group-item d-flex justify-content-between lh-condensed">
							<div>
								<h6 class="my-0">8호선 잠실역 까지</h6>
							</div> <span class="badge badge-secondary">46분</span>
						</li>
					</ul>

					<hr class="mb-4">

				</div><!-- 본문 우측 영역 끝 -->

				<!-- 본문 좌측 영역 -->
				<div class="col-md-8 order-md-1">
					<h4 class="mb-3">주거비</h4>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="deposit">월세 보증금</label> 
							<input type="text" class="form-control" disabled 
							id="deposit" value="1천" required="">만원
						</div>
						<div class="col-md-6 mb-3">
							<label for="mwolse">월세</label> 
							<input type="text" class="form-control" disabled
							id="mwolse" value="60" required="">만원
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="mjeonse">전세 보증금</label> 
							<input type="text" class="form-control" disabled
							id="mjeonse" value="3천" required="">만원
						</div>
					</div>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="mmaemae">매매가</label> 
							<input type="text" class="form-control" disabled
							id="mmaemae" value="1억 5천" required="">만원
						</div>
					</div>

					<hr class="mb-4">
					<h4 class="mb-3">치안</h4>
					<div class="row">
						<div class="col-md-3 mb-3">
							<label for="sec_score">점수</label> <select
								class="custom-select d-block w-100" disabled id="sec_score" required="">
									<option value="i">4.5</option>
							</select>
						</div>
						<div class="col-md-9 mb-3">
							<textarea class="form-control" disabled name="" id="sec_comments" rows="3"
								>꽤 좋아요~</textarea>
						</div>
					</div>

					<hr class="mb-4">
					<h4 class="mb-3">대중교통</h4>
					<div class="row">
						<div class="col-md-3 mb-3">
							<label for="trans_score">점수</label> <select
								class="custom-select d-block w-100" disabled id="trans_score" required="">
									<option value="i">3.5</option>
							</select>
						</div>
						<div class="col-md-9 mb-3">
							<textarea class="form-control" disabled name="" id="trans_comments"
								rows="3" >좀 먼듯 하지만 걸을만 해</textarea>
						</div>
					</div>

					<h4 class="mb-3">교통혼잡도</h4>
					<div class="row">
						<div class="col-md-3 mb-3">
							<label for="honjap_score">점수</label> <select
								class="custom-select d-block w-100" disabled id="honjap_score"
								required="">
									<option value="i">4.0</option>
							</select>
						</div>
						<div class="col-md-9 mb-3">
							<textarea class="form-control" disabled name="" id="honjap_comments"
								rows="3">한번에 쭉 가서 굿</textarea>
						</div>
					</div>

					<hr class="mb-4">
					<h4 class="mb-3">생활편의시설</h4>
					<div class="row mb-3" style="align-items: center; display: flex; justify-content: center;">
						<ul class="col list-group col-md-8 themed-grid-col">
							<li class="list-group-item">대형마트/소형마트/시장/편의점</li>
							<li class="list-group-item">세탁소/빨래방/수선집</li>
							<li class="list-group-item">동네병원/대형병원/약국</li>
							<li class="list-group-item">음식점/카페/배달</li>
							<li class="list-group-item">문화시설(영화관, 헬스장 등)</li>
							<li class="list-group-item">공원/산책로/자연환경</li>
						</ul>
						<ul class="col list-group col-md-2 themed-grid-col disabled">
							<li class="list-group-item"><input type="radio" name="mart" value="1" checked="checked">유 
														<input type="radio" name="mart" value="2" >무</li>
							<li class="list-group-item"><input type="radio" name="laundry" value="1">유 
														<input type="radio" name="laundry" value="2" checked="checked">무</li>
							<li class="list-group-item"><input type="radio" name="hospital" value="1" checked="checked">유 
														<input type="radio" name="hospital" value="2">무</li>
							<li class="list-group-item"><input type="radio" name="food" value="1" checked="checked">유 
														<input type="radio" name="food" value="2" >무</li>
							<li class="list-group-item"><input type="radio" name="culture" value="1" checked="checked">유 
														<input type="radio" name="culture" value="2">무</li>
							<li class="list-group-item"><input type="radio" name="park" value="1" checked="checked">유 
														<input type="radio" name="park" value="2">무</li>
						</ul>
					</div>
					<div class="row mb-3" style="align-items: center; display: flex; justify-content: center;">
						<textarea class="form-control col list-group col-md-11 themed-grid-col" disabled 
						name="" id="conv_comments" rows="3"> 대형마트도 있고 백화점도 있음! 배달시킬곳 짱많음~ 까꿍이 산책하기 넘 좋다 여기
						</textarea>
					</div>

					<hr class="mb-4">
					<h4 class="mb-3">반려동물</h4>
					<div class="row">
						<div class="col-md-3 mb-3">
							<label for="pet_score">점수</label> <select
								class="custom-select d-block w-100" disabled id="pet_score" required="">
									<option value="i">4.5</option>
							</select>
						</div>
						<div class="col-md-9 mb-3">
							<textarea class="form-control" disabled 
							name="" id="pet_comments" rows="3">5분거리에 동물병원 있음. 여기 의사 유명하고 종합검진 저렴하다더라
							</textarea>
						</div>
					</div>

					<!-- 추가항목 시작 -->
					
					<hr class="mb-4">
					<div class="row">
						<h5 class="mb-3 col-sm-4">도서관</h5>
					</div>
					<div class="row">
						<div class="col-md-3 mb-3">
							<label for="plus_score1">점수</label> <select
								class="custom-select d-block w-100" disabled id="plus_score1" required="">
									<option value="i">5.0</option>
							</select>
						</div>
						<div class="col-md-9 mb-3">
							<textarea class="form-control" disabled name="" id="plus_comments1" rows="3"
							>신축 도서관이 집 바로 앞임! 시험공부하기 짱짱</textarea>
						</div>
					</div>
					<hr class="mb-4">
					<div class="row">
						<h5 class="mb-3 col-sm-4">한강공원</h5>
					</div>
					<div class="row">
						<div class="col-md-3 mb-3">
							<label for="plus_time2">시간</label>
							<input type="text" class="form-control" disabled id="deposit" value="20">분
						</div>
						<div class="col-md-9 mb-3">
							<textarea class="form-control" disabled name="" id="plus_comments2" rows="3"
							>한강공원 나의 대힐링,,,</textarea>
						</div>
					</div>
					<!-- 추가항목 끝 -->
				</div>
			</div><!-- 본문 좌측 영역 끝 -->

			<hr class="mb-4">
			<h4 class="mb-3">코멘트</h4>
			<div class="col-md-12 mb-3">
				<label for="good">장점</label>
				<textarea class="form-control" disabled name="" id="good" rows="3"
				>살기 진짜 좋은듯... 집근처에 다 있어</textarea>

				<label for="bad">단점</label>
				<textarea class="form-control" disabled name="" id="bad" rows="3"
				>비 싸 ㅠㅠ 영끌해야됨..</textarea>

				<label for="etc">기타</label>
				<textarea class="form-control" disabled name="" id="etc" rows="3"
				></textarea>
			</div>


			<hr class="mb-4">
		</form>
	</div>



	<!-- footer 영역 -->
	<div>
	</div>

</body>
</html>