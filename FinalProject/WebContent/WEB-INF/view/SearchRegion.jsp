<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Region.jsp</title>

<!-- 통일하기로 한 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" 
integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	
	$(function()
	{	
		const url = new URL(window.location.href);
		
		//URLSearchParams 객체
		const urlParams = url.searchParams;
		
		var guNo = urlParams.get("guNo");
		var dongNo = urlParams.get("dongNo");
		
		$("#guNo").val("region.action?guNo="+guNo+"&dongNo=").prop("selected", true);
		$("#dongNo").val("region.action?guNo="+guNo+"&dongNo="+dongNo).prop("selected", true);
		
	});
	
</script>

</head>
<body>

<div>
	<c:import url="/nav.action"></c:import>
</div>

<div class="container">
	<div class="title" style="padding-top: 80px;">
		<h1>지역 조회</h1>
		<hr />
	</div>
	
	<div class="row mx-auto">
	   <div class="col-md-3 mb-3">
	     <label for="guNo">지역구</label>
	     <select class="custom-select d-block w-100" id="guNo" name="guNo" onchange="location.href=(this.value);">
	     	<option value="region.action?guNo=&dongNo="> - 선택 - </option>
			<c:forEach var="gu" items="${guList }">
			<option value="region.action?guNo=${gu.guNo }&dongNo=">${gu.guName }</option>
			</c:forEach>
	     </select>
	   </div>
	   <div class="col-md-3 mb-3">
	     <label for="dongNo">동</label>
	     <select class="custom-select d-block w-100" id="dongNo" name="dongNo" onchange="location.href=(this.value);">
	     	<option value="region.action?guNo=${param.guNo }&dongNo="> - 선택 - </option>
	     	<c:if test="${param.guNo ne '' }">
     			<c:forEach var="dong" items="${dongList }">
		     	<option value="region.action?guNo=${dong.guNo }&dongNo=${dong.dongNo }">${dong.dongName }</option>
		     	</c:forEach>
     		</c:if>
	     </select>
	   </div>
	</div>

	<hr />
	<div class="map mx-auto text-center" style="padding: 30px 0;">
		<img src="<%=cp%>/images/seoulmap.gif" class="border border-info center-block mx-auto" border="0", alt="" usemap="#Map">
		<map name="Map">
			<!-- 강남구 --><area shape="rect" coords="296,261,340,290" href="region.action?guNo=1&dongNo="> 
			<!-- 강동구 --><area shape="rect" coords="392,196,433,221" href="region.action?guNo=2&dongNo=">
			<!-- 강북구 --><area shape="rect" coords="253,86,296,110" href="region.action?guNo=3&dongNo=">
			<!-- 강서구 --><area shape="rect" coords="51,181,103,207" href="region.action?guNo=4&dongNo=">
			<!-- 관악구 --><area shape="rect" coords="186,305,228,324" href="region.action?guNo=5&dongNo=">
			<!-- 광진구 --><area shape="rect" coords="338,207,370,225" href="region.action?guNo=6&dongNo=">
			<!-- 구로구 --><area shape="rect" coords="129,301,69,266" href="region.action?guNo=7&dongNo=">
			<!-- 금천구 --><area shape="rect" coords="135,298,167,327" href="region.action?guNo=8&dongNo=">
			<!-- 노원구 --><area shape="rect" coords="325,70,359,108" href="region.action?guNo=9&dongNo=">
			<!-- 도봉구 --><area shape="rect" coords="285,54,317,82" href="region.action?guNo=10&dongNo=">
			<!-- 동대문구 --><area shape="rect" coords="301,62,343,182" href="region.action?guNo=11&dongNo=">
			<!-- 동작구 --><area shape="rect" coords="190,257,225,278" href="region.action?guNo=12&dongNo=">
			<!-- 마포구 --><area shape="rect" coords="142,188,187,204" href="region.action?guNo=13&dongNo=">
			<!-- 서대문구 --><area shape="rect" coords="174,166,220,184" href="region.action?guNo=14&dongNo=">
			<!-- 서초구 --><area shape="rect" coords="247,278,294,297" href="region.action?guNo=15&dongNo=">
			<!-- 성동구 --><area shape="rect" coords="288,199,327,217" href="region.action?guNo=16&dongNo=">
			<!-- 성북구 --><area shape="rect" coords="250,128,303,164" href="region.action?guNo=17&dongNo=">
			<!-- 송파구 --><area shape="rect" coords="356,250,402,271" href="region.action?guNo=18&dongNo=">
			<!-- 양천구 --><area shape="rect" coords="92,240,133,254" href="region.action?guNo=19&dongNo=">
			<!-- 영등포구 --><area shape="rect" coords="146,226,198,261" href="region.action?guNo=20&dongNo=">
			<!-- 용산구 --><area shape="rect" coords="267,259,218,215" href="region.action?guNo=21&dongNo=">
			<!-- 은평구 --><area shape="rect" coords="171,101,208,139" href="region.action?guNo=22&dongNo=">
			<!-- 종로구 --><area shape="rect" coords="224,159,263,175" href="region.action?guNo=23&dongNo=">
			<!-- 중구 --><area shape="rect" coords="238,190,277,203" href="region.action?guNo=24&dongNo=">
			<!-- 중랑구 --><area shape="rect" coords="344,133,384,182" href="region.action?guNo=25&dongNo=">
		</map>
	</div>
	
	<hr>
	<div class="custom-control custom-checkbox text-center">
		<label class="checkAll">
			<input type="checkbox" id="checkAll" name="checkAll"> 전체선택
		</label>
		<label class="btn1">
			<input type="checkbox"> 주거비(월세)
		</label>
		<label class="btn2">
			<input type="checkbox"> 주거비(전세)
		</label>
		<label class="btn3">
			<input type="checkbox"> 주거비(매매)
		</label>
		<label class="btn4">
			<input type="checkbox"> 치안
		</label>
		<label class="btn5">
			<input type="checkbox"> 대중교통
		</label>
		<label class="btn6">
			<input type="checkbox"> 교통혼잡도
		</label>
		<label class="btn7">
			<input type="checkbox"> 생활편의시설
		</label>
		<label class="btn8">
			<input type="checkbox"> 반려동물
		</label>
		
		<div style="text-align: right; padding-right: 350pt;">
			<button type="button" class="btn btn-primary">필터 적용</button>
		</div>
	</div>
	<hr />

	<div class="searchTable">
        <table class="table table-striped table-sm text-center">	<!-- 이 클래스명 변경하면 안 됨! -->
          <thead>
            <tr>
              <th>
              	<select class="custom-select d-block w-100" id="selectGu">
         			<option value="">동</option>
        			 <option>동 오름차순</option>
        			 <option>동 내림차순</option>
    			</select>
              </th>
              <th>
              	<select class="custom-select d-block w-100" id="selectWolse">
         			<option value="">월세</option>
        			 <option>월세 오름차순</option>
        			 <option>월세 내림차순</option>
    			</select>
              </th>
              <th>
              	<select class="custom-select d-block w-100" id="selectJeonse">
         			<option value="">전세</option>
        			 <option>전세 오름차순</option>
        			 <option>전세 내림차순</option>
    			</select>
              </th>
              <th>
              	<select class="custom-select d-block w-100" id="selectMaemae">
         			<option value="">매매</option>
        			 <option>매매 오름차순</option>
        			 <option>매매 내림차순</option>
    			</select>
              </th>
              <th>
              	<select class="custom-select d-block w-100" id="selectSecurity">
         			<option value="">치안</option>
        			 <option>점수 오름차순</option>
        			 <option>점수 내림차순</option>
    			</select>
              </th>
              <th>
              	<select class="custom-select d-block w-100" id="selectTranspt">
         			<option value="">대중교통</option>
        			 <option>점수 오름차순</option>
        			 <option>점수 내림차순</option>
    			</select>
              </th>
              <th>
              	<select class="custom-select d-block w-100" id="selectHonjob">
         			<option value="">교통혼잡도</option>
        			 <option>점수 오름차순</option>
        			 <option>점수 내림차순</option>
    			</select>
              </th>
              <th>
              	<select class="custom-select d-block w-100" id="selectConv">
         			<option value="">생활편의시설</option>
        			 <option>점수 오름차순</option>
        			 <option>점수 내림차순</option>
    			</select>
              </th>
              <th>
              	<select class="custom-select d-block w-100" id="selectPet">
         			<option value="">반려동물</option>
        			 <option>점수 오름차순</option>
        			 <option>점수 내림차순</option>
    			</select>
              </th>
            </tr>
          </thead>
          <tbody>
          	<c:if test="${empty localList }">
          		<tr>
          			<td colspan="9" style="padding: 30px 0;">지역을 선택해 주세요.</td>
          		</tr>
          	</c:if>
          	<c:if test="${!empty localList && param.dongNo eq '' }">
          		<c:forEach var="local" items="${localList }">
	          		<tr onclick="location.href='readlocal.action?dongNo=${local.dongNo}'">
		              <td>${local.dongName }</td>
		              <c:choose>
						<c:when test="${local.mWolse eq -1 || local.deposit eq -1}"><td> - 만원</td></c:when>
						<c:otherwise><td>${local.deposit }/${local.mWolse } 만원</td></c:otherwise>
					  </c:choose>
					  <c:choose>
						<c:when test="${local.mJeonse eq -1 }"><td> - 만원</td></c:when>
						<c:otherwise><td>${local.mJeonse } 만원</td></c:otherwise>
					  </c:choose>
					  <c:choose>
						<c:when test="${local.mMaemae eq -1 }"><td> - 만원</td></c:when>
						<c:otherwise><td>${local.mMaemae } 만원</td></c:otherwise>
					  </c:choose>
					  <c:choose>
						<c:when test="${local.security_score eq -1 }"><td> - </td></c:when>
						<c:otherwise><td>${local.security_score }</td></c:otherwise>
					  </c:choose>
					  <c:choose>
						<c:when test="${local.transport_score eq -1 }"><td> - </td></c:when>
						<c:otherwise><td>${local.transport_score }</td></c:otherwise>
					  </c:choose>
					  <c:choose>
						<c:when test="${local.honjap_score eq -1 }"><td> - </td></c:when>
						<c:otherwise><td>${local.honjap_score }</td></c:otherwise>
					  </c:choose>
					  <c:choose>
						<c:when test="${local.convenience_score eq -1 }"><td> - </td></c:when>
						<c:otherwise><td>${local.convenience_score }</td></c:otherwise>
					  </c:choose>
					  <c:choose>
						<c:when test="${local.pet_score eq -1 }"><td> - </td></c:when>
						<c:otherwise><td>${local.pet_score }</td></c:otherwise>
					  </c:choose>
		            </tr>
	          	</c:forEach>
          	</c:if>
          	<c:if test="${param.dongNo ne '' && empty checkList  }">
          		<tr>
          			<td colspan="9" style="padding: 30px 0;">해당 지역의 데이터가 존재하지 않습니다.</td>
          		</tr>
          	</c:if>
          	<c:if test="${!empty localList && !empty checkList }">
          		<c:forEach var="check" items="${checkList }">
	          		<tr onclick="location.href='readcheck.action?checkNo=${check.checkNo}'">
		              <td>${check.dongName }</td>
		              <c:choose>
						<c:when test="${check.mWolse eq '-1' || check.deposit eq '-1'}"><td> - 만원</td></c:when>
						<c:otherwise><td>${check.deposit }/${check.mWolse } 만원</td></c:otherwise>
					  </c:choose>
					  <c:choose>
						<c:when test="${check.mJeonse eq '-1' }"><td> - 만원</td></c:when>
						<c:otherwise><td>${check.mJeonse } 만원</td></c:otherwise>
					  </c:choose>
					  <c:choose>
						<c:when test="${check.mMaemae eq '-1' }"><td> - 만원</td></c:when>
						<c:otherwise><td>${check.mMaemae } 만원</td></c:otherwise>
					  </c:choose>
					  <c:choose>
						<c:when test="${check.security_score eq '-1' }"><td> - </td></c:when>
						<c:otherwise><td>${check.security_score }</td></c:otherwise>
					  </c:choose>
					  <c:choose>
						<c:when test="${check.transport_score eq '-1' }"><td> - </td></c:when>
						<c:otherwise><td>${check.transport_score }</td></c:otherwise>
					  </c:choose>
					  <c:choose>
						<c:when test="${check.honjap_score eq '-1' }"><td> - </td></c:when>
						<c:otherwise><td>${check.honjap_score }</td></c:otherwise>
					  </c:choose>
					  <c:choose>
						<c:when test="${check.convenience eq -1 }"><td> - </td></c:when>
						<c:otherwise><td>${check.convenience }</td></c:otherwise>
					  </c:choose>
					  <c:choose>
						<c:when test="${check.pet_score eq '-1' }"><td> - </td></c:when>
						<c:otherwise><td>${check.pet_score }</td></c:otherwise>
					  </c:choose>
		            </tr>
	          	</c:forEach>
          	</c:if>
          </tbody>
        </table>
      </div>
      
	<div class="footer" style="padding: 50px 0 30px 0;">
      	<p class="float-right">
			<a href="#">▲ top</a>
		</p>
		<p>
			&copy; 2021 Seolo, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a>
		</p>
	</div>
</div>

</body>
</html>