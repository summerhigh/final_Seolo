# Seolo Project

### '서'울 사는 솔'로'들이 서로서로 돕는 문화를 만드는, 서로 프로젝트
* 대상 : 서울에 사는 1인 가구를 타겟으로 한 웹 사이트입니다.
* 주제 선정 이유, 기능 설명   
: 서울의 1인 가구는 약 98만 가구로, 현재 전체 가구의 27%를 차지하고 있습니다.   
  이렇게 많은 사람들이 1인 가구로 살아가는 데에 있어 식사, 주거, 안전 등 기본생활에서 겪는 불편함을   
  덜어주는 웹 사이트를 제작하고 싶었습니다.   
  저희는 체크리스트 기능을 통해 관심있는(혹은 이사를 고려하고 있는) 서울 지역의 집에 대한    
  정보를 쉽게 정리, 비교할 수 있을 뿐 아니라
  서울의 각 구별, 동별 특징을 손쉽게 비교, 파악할 수 있어    
  1인 가구 거주에 도움이 되는 정보를 공유할 수 있습니다.  
  
  그리고 배달 음식이 보통 2~3인분 기준으로 하기 때문에,    
  일명 '혼밥러'인 1인 가구들에게는 배달음식이 너무 많다는 문제점을 해결하기 위해   
  배달음식을 서울의 같은 지역에 사는 사람들끼리 분배할 수 있는    
  공동 구매 서비스를 제공합니다.
* 주요 기능 : 체크리스트, 공동 구매
* 부가 기능 : 회원가입, 로그인, 마이페이지, 회원 탈퇴, 신고(블라인드, 경고, 이용정지)
* 관리자 기능 : 공지사항, 서비스소개, 자주 묻는 질문
* 개발 도구 및 환경   
  : JAVA, Oracle   
  : jQuery, AJAX, Spring, MyBatis, JSP, CSS, Bootstrap, ApacheTomcat, KaKaoMaps API
* 프로젝트에서 제가 맡은 기능 : 체크리스트 작성, 북마크 기능
* 제가 맡은 기능에 대한 부연 설명   
  : 작성은 기본 입력사항, 추가 입력사항, 스티커 총 세 번의 입력 페이지를 거쳐 작성이 완료됩니다.    
    기본 입력사항은 사이트에서 제공하는 입력 항목들로 구성된 폼이며, 필수입력항목과 선택입력항목으로 구분됩니다.   
    추가 입력사항은 이용자가 추가적으로 입력할 수 있는 사항이며,      
    평가기준은 점수와 시간 중에 선택 가능합니다. 입력사항의 개수 제한은 없습니다.   
    스티커란 이용자가 체크리스트를 조회할 때에 같은 스티커를 붙여 둔 체크리스트를 모아 볼 수 있도록 구성한 기능입니다.    
    이용자가 작성하고 있는 체크리스트, 북마크하는 체크리스트에 스티커를 붙일 수 있습니다. 스티커 개수 제한은 없습니다.   
* 해당되는 jsp   
  - 작성 폼 : ChecklistWrite_first.jsp, ChecklistWrite_second.jsp, ChecklistWrite_third.jsp    
  - ajax 처리 :  Adress_ok.jsp       
  - 점수 관련한 추가 입력사항 입력, 수정 폼 : SecondScoreInsertForm.jsp, SecondScoreUpdateForm.jsp   
  - 시간 관련한 추가 입력사항 입력, 수정 폼 : SecondTimeInsertForm.jsp, SecondTimeUpdateForm.jsp      
  - 체크리스트, 지역정보 북마크 : AddCheckBookMark.jsp, AddRegionBookmark.jsp     
* 해당되는 DTO 
  - ChecklistDTO.java
  - PlusDTO.java
  - StickerDTO.java
  - ScoreDTO.java
  - BookmarkDTO.java
* 해당되는 IDAO 
   - IChecklistDAO.java
   - IPlusDAO.java
   - IStickerDAO.java
* 해당되는 mybatis mapper 
  - ChecklistDAO.xml
  - CheckStickerDAO.xml
  - PlusDAO.xml
  
