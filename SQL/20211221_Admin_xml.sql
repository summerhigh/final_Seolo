SELECT *
FROM ADMIN;

SELECT *
FROM NOTICE_SORT;

SELECT USER
FROM DUAL;
--==>> TEAM_SEOLO

-- 리스트 조회
-- 순번   공지 분류   제목   작성자   날짜
SELECT NOTICE_NO, NOTICESORT_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE
FROM VIEW_NOTICE;

--공지사항 시퀸스
CREATE SEQUENCE NOTICESEQ
NOCACHE;

SELECT *
FROM USER SEQUENCES;

SELECT * FROM USER_SEQUENCES;   

--공지사항 분류 정렬
-- 공지사항
SELECT NOTICE_NO, NOTICESORT_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE
FROM VIEW_NOTICE
WHERE NOTICESORT_NO=1;
-- 점검
SELECT NOTICE_NO, NOTICESORT_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE
FROM VIEW_NOTICE
WHERE NOTICESORT_NO=2;



INSERT INTO NOTICE(NO_NO, AD_ID, NOS_NO, TITLE, CONTENT, NODATE) 
VALUES(NOTICESEQ.NEXTVAL, 'admin1', 2, '2021-10-15 점검 예정 알림', '2021-10-15 1:00 - 3:00 점검 예정입니다. 회원 여러분의 양해를 부탁드립니다.', TO_DATE('2021-10-10', 'YYYY-MM-DD')); 

INSERT INTO NOTICE(NO_NO, AD_ID, NOS_NO, TITLE, CONTENT, NODATE) 
VALUES(NOTICESEQ.NEXTVAL, 'admin2', 2, '2021-11-20 점검 예정 알림', '2021-11-20 2:00 - 3:00 점검 예정입니다. 회원 여러분의 양해를 부탁드립니다.', TO_DATE('2021-11-15', 'YYYY-MM-DD')); 

INSERT INTO NOTICE(NO_NO, AD_ID, NOS_NO, TITLE, CONTENT, NODATE) 
VALUES(NOTICESEQ.NEXTVAL, 'admin2', 2, '2021-12-25 점검 예정 알림', '2021-11-20 2:00 - 3:00 점검 예정입니다. 회원 여러분의 양해를 부탁드립니다.', TO_DATE('2021-12-20', 'YYYY-MM-DD')); 

commit;

select *
from notice;


--○ 공지사항 관련
SELECT USER
FROM DUAL;
--==>> TEAM_SEOLO

-- 리스트 조회
-- 순번   공지 분류   제목   작성자   날짜
SELECT NOTICE_NO, NOTICESORT_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE
FROM VIEW_NOTICE;

--공지사항 시퀸스
CREATE SEQUENCE NOTICESEQ
NOCACHE;

SELECT *
FROM USER SEQUENCES;

SELECT * FROM USER_SEQUENCES;   

--공지사항 분류 정렬
-- 공지사항
SELECT NOTICE_NO, NOTICESORT_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE
FROM VIEW_NOTICE
WHERE NOTICESORT_NO=1;
-- 점검
SELECT NOTICE_NO, NOTICESORT_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE
FROM VIEW_NOTICE
WHERE NOTICESORT_NO=2;



INSERT INTO NOTICE(NO_NO, AD_ID, NOS_NO, TITLE, CONTENT, NODATE) 
VALUES(NOTICESEQ.NEXTVAL, 'admin1', 1, '2021년 09월 이벤트', '새롭게 시작하는 저희 페이지 많은 관심 부탁드립니다.', SYSDATE); 
INSERT INTO NOTICE(NO_NO, AD_ID, NOS_NO, TITLE, CONTENT, NODATE) 
VALUES(NOTICESEQ.NEXTVAL, 'admin2', 1, '개인정보처리방침 변경 안내', '제3조(개인정보 보호 원칙) 이 바뀜에 따라 변경 사항을 적용할 예정입니다.', SYSDATE); 
INSERT INTO NOTICE(NO_NO, AD_ID, NOS_NO, TITLE, CONTENT, NODATE) 
VALUES(NOTICESEQ.NEXTVAL, 'admin1', 1, '2021년 10월 이벤트', '지속적으로 성장하는 저희 페이지를 사랑해주셔서 감사합니다.', SYSDATE); 

----->>
SELECT *
FROM NOTICE;

UPDATE NOTICE
SET
CONTENT = '지속적으로 성장하는 저희 페이지를 사랑해주셔서 감사합니다.'
WHERE
NO_NO = 5;

COMMIT;
SELECT * FROM COLS WHERE TABLE_NAME = 'NOTICE'
----------------------------------------------------------------공지사항 끝-----

-- 공지사항 생성
INSERT INTO NOTICE(NO_NO, AD_ID, NOS_NO, TITLE, CONTENT, NODATE) 
VALUES(NOTICESEQ.NEXTVAL, 'admin1', 1, '2021년 09월 이벤트', '새롭게 시작하는 저희 페이지 많은 관심 부탁드립니다.', SYSDATE); 

-- 공지사항 수정
UPDATE NOTICE
SET TITLE = '올해의 베스트 추천'
   ,CONTENT = '여기 저기 다 좋아요. 베스트 입니다~!'
   ,NOS_NO = 1
WHERE NO_NO=6;


-------------------------------------------------------------공지사항 수정 끝 --

--공지사항 삭제
DELETE
FROM NOTICE
WHERE NO_NO=6;

--------------------------------------------------------------공지사항 삭제 끝--




--○ 자주 묻는 질문
--VIEW_WITHDRAWAL
--자주 묻는 질문 조회, 생성, 수정, 삭제, 카테고리별 정렬

--1. 자주 묻는 질문 조회
/*
CREATE OR REPLACE VIEW VIEW_FAQ
AS
SELECT F.FAQ_NO "FAQ_NO", F.TITLE "FAQ_TITLE", F.CONTENT "FAQ_CONTENT", F.QS_NO "FAQSORT_NO", FS.NAME "FAQSORT_NAME"
FROM FAQ F JOIN FAQ_SORT FS
ON F.QS_NO = FS.QS_NO;
*/
--○ 자주 묻는 질문 조회 코드
SELECT FAQ_NO, FAQSORT_NO, FAQSORT_NAME, FAQ_TITLE, FAQ_CONTENT
FROM VIEW_FAQ;

--2. 자주 묻는 질문 생성
SELECT *
FROM FAQ;

SELECT *
FROM ADMIN;

SELECT *
FROM FAQ_SORT;

--○ 자주 묻는 질문 생성 코드
INSERT INTO FAQ(FAQ_NO, AD_ID, QS_NO, TITLE, CONTENT)
VALUES(FAQESEQ.NEXTVAL, 'admin1', 1, '스티커 기능은 뭔가요?', '내가 북마크 해 놓은 체크리스트에 내가 표시하고 싶은 단어를 스티커처럼 붙일 수 있습니다. 한 번 만들어 놓은 스티커는 내 체크리스트에서 확인 가능하며, 다른 북마크한 체크리스트에 사용 할 수 있습니다. 또한, 내 체크리스트에서 특정 스티커가 사용 된 체크리스트들을 확인할 수 있습니다.');

INSERT INTO FAQ(FAQ_NO, AD_ID, QS_NO, TITLE, CONTENT)
VALUES(FAQESEQ.NEXTVAL, 'admin2', 3, '탈퇴는 어떻게 하나요?', '마이 페이지에서 탈퇴를 진행할 수 있습니다.');

INSERT INTO FAQ(FAQ_NO, AD_ID, QS_NO, TITLE, CONTENT)
VALUES(FAQESEQ.NEXTVAL, 'admin2', 1, '북마크는 어떻게 하나요?', '내가 북마크 하고 싶은 체크리스트를 클릭한 후, 해당 체크리스트의 템플릿에서 북마크를 하실 수 있습니다. 북마크한 체크리스트는 내 체크리스트에서 확인 가능합니다.');

--COMMIT;
--ROLLBACK;
--2. 자주 묻는 질문 수정
--○ 자주 묻는 질문 수정 코드
UPDATE FAQ
SET QS_NO = 3
    , TITLE = '수정 테스트'
    , CONTENT = '수정 테스트임'
WHERE FAQ_NO = 3;

--3. 자주 묻는 질문 삭제
--○ 자주 묻는 질문 삭제 코드
DELETE
FROM FAQ
WHERE FAQ_NO = 3;

--4. 자주 묻는 질문 카테고리별 정렬
--○ 자주 묻는 질문 카테고리별 정렬 코드
SELECT FAQ_NO, FAQSORT_NO, FAQSORT_NAME, FAQ_TITLE, FAQ_CONTENT 
FROM VIEW_FAQ
WHERE FAQSORT_NO=1;
