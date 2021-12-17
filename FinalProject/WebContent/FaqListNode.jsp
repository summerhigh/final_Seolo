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
<title>FaqListNode.jsp</title>

<!-- 통일하기로 한 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" 
integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

</head>
<body>

<!-- 내비바 -->
<div><c:import url="MenuNavbar_admin.jsp"></c:import></div>

<br><br><br><br><br>

<div class="container">
	<!-- 게시판 메인 -->
	<div class="page-header"><h1 class="page-heading">자주 묻는 질문</h1></div>
	<br><br>
	
	
	<!-- 질문 분류 -->
	<ul class="nav nav-tabs page-header-tabs" id="categori" role="tablist">
       <li class="nav-item">
         <a class="nav-link " href="">회원 관리</a>
       </li>
       <li class="nav-item">
         <a class="nav-link " href="">체크리스트</a>
       </li>
       <li class="nav-item">
         <a class="nav-link " href="">기타</a>
       </li>
    </ul>

	<!-- collapse/노드 확장  -->
		<div class="accordion" id="accordionExample">
			<div class="card">
				<div class="card-header" id="headingOne">
					<h2 class="mb-0">
						<button class="btn btn-link btn-block text-left" type="button"
							data-toggle="collapse" data-target="#collapseOne"
							aria-expanded="true" aria-controls="collapseOne">
							[체크리스트]&nbsp;&nbsp;스티커 기능은 뭔가요?</button>
					</h2>
				</div>
				
				<!-- 첫번째 노드는 페이지 오픈 시 늘 확장되어 있도록 함 -->
				<div id="collapseOne" class="collapse show"
					aria-labelledby="headingOne" data-parent="#accordionExample">
					<div class="card-body">
						<%-- Some placeholder content for the first accordion panel. This panel
						is shown by default, thanks to the
						<code>.show</code>
						class. --%>
						내가 북마크 해 놓은 체크리스트에 내가 표시하고 싶은 단어를 스티커처럼 붙일 수 있습니다.<br>
						한 번 만들어 놓은 스티커는 내 체크리스트에서 확인 가능하며, 다른 북마크한 체크리스트에 사용 할 수 있습니다.<br> 
						또한, 내 체크리스트에서 특정 스티커가 사용 된 체크리스트들을 확인할 수 있습니다.
						
						<!-- 수정하기/삭제하기 버튼은 관리자에게만 나타남 -->
						<br><br>
						<button type="submit" class="btn btn-primary">수정하기</button>
						<button type="submit" class="btn btn-primary">삭제하기</button>
					</div>
				</div>
			</div>
			
			<!-- 두번째 노드 이후로부터는 노드 클릭 시 확장됨 -->
			<div class="card">
				<div class="card-header" id="headingTwo">
					<h2 class="mb-0">
						<button class="btn btn-link btn-block text-left collapsed"
							type="button" data-toggle="collapse" data-target="#collapseTwo"
							aria-expanded="false" aria-controls="collapseTwo">
							[체크리스트]&nbsp;&nbsp;북마크는 어떻게 하나요?</button>
					</h2>
				</div>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionExample">
					<div class="card-body">하고 싶은 북마크를 잘 열심히 북마크합니다.
						<br><br>
						<button type="submit" class="btn btn-primary">수정하기</button>
						<button type="submit" class="btn btn-primary">삭제하기</button>
					</div>
				</div>
			</div>
			<div class="card">
				<div class="card-header" id="headingThree">
					<h2 class="mb-0">
						<button class="btn btn-link btn-block text-left collapsed"
							type="button" data-toggle="collapse" data-target="#collapseThree"
							aria-expanded="false" aria-controls="collapseThree">
							[회원 관리]&nbsp;&nbsp;탈퇴는 어떻게 하나요?</button>
					</h2>
				</div>
				<div id="collapseThree" class="collapse"
					aria-labelledby="headingThree" data-parent="#accordionExample">
					<div class="card-body">저기 탈퇴 버튼을 눌러주세용!
						<br><br>
						<button type="submit" class="btn btn-primary">수정하기</button>
						<button type="submit" class="btn btn-primary">삭제하기</button>
					</div>
				</div>
			</div>
			<div class="card">
				<div class="card-header" id="headingFour">
					<h2 class="mb-0">
						<button class="btn btn-link btn-block text-left collapsed"
							type="button" data-toggle="collapse" data-target="#collapseFour"
							aria-expanded="false" aria-controls="collapseFour">
							[체크리스트]&nbsp;&nbsp;내 신고 처리 사항은 어디서 확인하나요?</button>
					</h2>
				</div>
				<div id="collapseFour" class="collapse"
					aria-labelledby="headingFour" data-parent="#accordionExample">
					<div class="card-body">신고는 관리자만 확인 가능하다는 거!
						<br><br>
						<button type="submit" class="btn btn-primary">수정하기</button>
						<button type="submit" class="btn btn-primary">삭제하기</button>
					</div>
				</div>
			</div>
			<div class="card">
				<div class="card-header" id="headingFive">
					<h2 class="mb-0">
						<button class="btn btn-link btn-block text-left collapsed"
							type="button" data-toggle="collapse" data-target="#collapseFive"
							aria-expanded="false" aria-controls="collapseFive">
							[기타]&nbsp;&nbsp;이 기능은 어떻게 사용하는 건가요?</button>
					</h2>
				</div>
				<div id="collapseFive" class="collapse"
					aria-labelledby="headingFive" data-parent="#accordionExample">
					<div class="card-body">이렇게 저렇게 사용 가능합니다.
						<br><br>
						<button type="submit" class="btn btn-primary">수정하기</button>
						<button type="submit" class="btn btn-primary">삭제하기</button>
					</div>
				</div>
			</div>
		</div>
	
		<!-- collapse2 -->
		<!-- <br><br>
		<p>
		<b>Q</b>&nbsp;&nbsp;&nbsp;&nbsp;[기타]&nbsp;&nbsp;배가 너무 고파요&nbsp;&nbsp;
			<a class="btn btn-primary" data-toggle="collapse"
				href="#collapseExample" role="button" aria-expanded="false"
				aria-controls="collapseExample"> Link with href </a>
			<button class="btn btn-primary" type="button" data-toggle="collapse"
				data-target="#collapseExample" aria-expanded="false"
				aria-controls="collapseExample">▼</button>
		</p>
		<div class="collapse" id="collapseExample">
			<div class="card card-body">Some placeholder content for the
				collapse component. This panel is hidden by default but revealed
				when the user activates the relevant trigger.</div>
		</div> -->




		<br>
		<!-- 글쓰기 버튼 -->
		<div class="d-flex justify-content-end">
			<!-- 이 글쓰기 버튼은 관리자에게만 나타나는 버튼! -->
               <button type="submit" class="btn btn-primary">글쓰기</button>
           </div>
		<br><br>
			
			
		<!-- 페이징 처리 부분 -->
		<div class="dataTables_paginate paging_simple_numbers" style="text-align:center; id="datatable_paginate">
			<ul id="datatable_pagination" class="pagination datatable-custom-pagination justify-content-center">
				<!-- prev 부분도 필요할까봐 넣어둠!
				<li class="paginate_item page-item disabled">
					<a class="paginate_button previous page-link" aria-controls="datatable" data-dt-idx="0" tabindex="0" id="datatable_previous">
					<span aria-hidden="true">Prev</span></a>
				</li> -->
				<li class="paginate_item page-item active">
					<a class="paginate_button page-link" aria-controls="datatable" data-dt-idx="1" tabindex="0">1</a>
				</li>
				<li class="paginate_item page-item">
					<a class="paginate_button page-link" aria-controls="datatable" data-dt-idx="2" tabindex="0">2</a>
				</li>
				<li class="paginate_item page-item">
					<a class="paginate_button page-link" aria-controls="datatable" data-dt-idx="2" tabindex="0">3</a>
				</li>
				<li class="paginate_item page-item">
					<a class="paginate_button page-link" aria-controls="datatable" data-dt-idx="2" tabindex="0">4</a>
				</li>
				<li class="paginate_item page-item">
					<a class="paginate_button next page-link" aria-controls="datatable" data-dt-idx="3" tabindex="0" id="datatable_next">
					<span aria-hidden="true">Next</span></a>
				</li>
			</ul>
		</div>
	</div>
</div>

</body>
</html>