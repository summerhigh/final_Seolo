-- 물리설계 PL/SQL
SELECT USER FROM DUAL;

------------------------------------------------------------------------------------
--○ 다정(계정 생성/삭제)
--◈ 계정 생성 프로시저 (계정, 개인정보 테이블에 넣어준다.)
--> 계정이 생성이 되면 계정테이블 개인정보테이블 둘 다 입력

CREATE OR REPLACE PROCEDURE PRC_ACCOUNT_CREATE
( 
    V_PE_ID         IN PERSONAL.PE_ID%TYPE
,	V_NAME          IN PERSONAL.NAME%TYPE
,	V_TEL           IN PERSONAL.TEL%TYPE
,	V_NICKNAME      IN PERSONAL.NICKNAME%TYPE
,	V_PW            IN PERSONAL.PW%TYPE
,	V_EMAIL         IN PERSONAL.EMAIL%TYPE
,	V_ROADADDR      IN PERSONAL.ROADADDR%TYPE
,	V_DETAILADDR    IN PERSONAL.DETAILADDR%TYPE
)
IS  
    -- 변수 선언
    V_AC_NO         NUMBER;
    
BEGIN
    -- 계정 코드 자동증가 위한 조회
    SELECT NVL(MAX(AC_NO),0) INTO V_AC_NO
    FROM ACCOUNT;

    -- 개인정보 테이블에 INSERT
    INSERT INTO ACCOUNT(AC_NO) VALUES(V_AC_NO+1);
    
    -- 계정 테이블에 INSERT ******
    INSERT INTO PERSONAL(AC_NO, PE_ID, NAME, TEL, NICKNAME, PW, EMAIL, ROADADDR, DETAILADDR, PROFILE, PEDATE)
        VALUES(V_AC_NO+1, V_PE_ID, V_NAME, V_TEL, V_NICKNAME, V_PW, V_EMAIL, V_ROADADDR, V_DETAILADDR, NULL, SYSDATE);

    -- 예외처리
    EXCEPTION
        WHEN OTHERS THEN ROLLBACK;
END;


EXEC PRC_ACCOUNT_CREATE('test001', '테스트', '010-1122-2233', 'tesstt','java006$','test001@test.com','서울시 마포구 서교동 247-86','1층','001.jpg',TO_DATE('2021-06-01', 'YYYY-MM-DD'));
EXEC PRC_ACCOUNT_CREATE('test002', '테스트2', '010-2233-4455', 'tesst22222t','java006$','test002@test.com','서울시 마포구 서교동 247-86','3층','003.jpg',TO_DATE('2021-06-10', 'YYYY-MM-DD'));



--◈  계정 삭제 프로시저 (개인정보 테이블에서 빼주고, 탈퇴회원 테이블에 삽입)
--> 계정을 삭제하면 개인정보 테이블에선 -, 탈퇴회원 테이블에 +

-- 프로시저 선언
CREATE OR REPLACE PROCEDURE PRC_ACCOUNT_DELETE
-- 매개변수 : 입력받을 애들 - 탈퇴회원 테이블로 가는거
-- 아이디랑 전화번호를 입력하여 확인 후 일치하면 탈퇴 완료 ~!
(
    V_WIR_NO        IN WITHDRAWAL.WIR_NO%TYPE
,	V_COMMENTS    	IN WITHDRAWAL.COMMENTS%TYPE
,	V_WIDATE      	IN WITHDRAWAL.WIDATE%TYPE
,	V_ID           	IN WITHDRAWAL.ID%TYPE
,	V_NAME         	IN WITHDRAWAL.NAME%TYPE
,	V_TEL      		IN WITHDRAWAL.TEL%TYPE

)
IS
    -- 변수 선언
    V_AC_NO         NUMBER;
    V_WI_NO         NUMBER;

    
    -- 계산할 때 필요한 값
    -- EXCEPTION
    -- 중복 안되게 해야되는 값 -> 아이디, 비밀번호
    TEMP_ID     NUMBER;
    TEMP_TEL    NUMBER;
    
    ID_DELETE_ERROR    EXCEPTION;  -- 아이디가 다를 때
    TEL_DELETE_ERROR   EXCEPTION;  -- 전화번호가 다를 때
    
BEGIN

    -- 탈퇴 고유번호 자동증가 위한 조회
    SELECT NVL(MAX(WI_NO),0) INTO V_WI_NO
    FROM WITHDRAWAL;

    -- TEMP는 거쳐가는건데 0이랑 1로 받아서
    -- 에러 여부 확인
    -- 밑에 COUNT(*)이게 0이나 1
    -- 중복 아이디
    SELECT COUNT(*) INTO TEMP_ID
    FROM PERSONAL
    WHERE PE_ID = V_ID;
    IF (TEMP_ID = 0)                    -- 0 이면 아이디가 있으니까 삭제 가능 ~!
        THEN RAISE ID_DELETE_ERROR;
    END IF;
    -- 중복 전화번호
    SELECT COUNT(*) INTO TEMP_TEL
    FROM PERSONAL
    WHERE TEL = V_TEL;
    IF (TEMP_TEL = 0)                   -- 0 이면 전화번호가 있으니까 삭제 가능 ~!
        THEN RAISE TEL_DELETE_ERROR;
    END IF;
  
    -- V_AC_NO에 값을 넣어주기 -- 사용자 아이디로 그사람의  AC_NO를 알수잇으니까 이거를 V_AC_NO에 담자
    SELECT AC_NO
        INTO V_AC_NO
        FROM PERSONAL
    WHERE PE_ID = V_ID;
    
    
    -- 탈퇴회원 테이블 +       
    INSERT INTO WITHDRAWAL(WI_NO, AC_NO, WIR_NO, COMMENTS, WIDATE, ID, NAME, TEL)
        VALUES (V_WI_NO+1, V_AC_NO, V_WIR_NO, V_COMMENTS, V_WIDATE, V_ID, V_NAME, V_TEL);
    
      
    -- 개인정보 테이블 -
    DELETE
    FROM PERSONAL
    WHERE PE_ID=V_ID;
      

    -- 예외처리
    -- 아이디, 전화번호
    EXCEPTION
        WHEN ID_DELETE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20004,'존재하지 않은 ID 입니다.');
        ROLLBACK;
        WHEN TEL_DELETE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20005,'존재하지 않는 전화번호 입니다.');
        ROLLBACK;
      
        WHEN OTHERS THEN ROLLBACK;
END;

--==>> Procedure PRC_ACCOUNT_DELETE이(가) 컴파일되었습니다.

EXEC PRC_ACCOUNT_DELETE(5, '다음에 다시 가입할께요.', TO_DATE(SYSDATE, 'YYYY-MM-DD'), 'test002', '테스트2', '010-2233-4455');


COMMIT;
--==>> 커밋 완료~!


-----------------------------------------------------------------------------------
-- ○ 소연
-- 탈퇴회원 6개월
CREATE OR REPLACE PROCEDURE PROC_WITHDRAWAL_DELETE
IS
BEGIN
    DELETE
    FROM WITHDRAWAL
    WHERE WIDATE < SYSDATE-183;
END;

COMMIT;

SELECT * FROM USER_JOBS;
/*
OWNER	                TEAM_SEOLO
JOB_NAME	                JOB_WITHDRAWAL_DELETE
JOB_CLASS	            DEFAULT_JOB_CLASS
COMMENTS	JOB_            WITHDRAWAL_DELETE
ENABLED	                TRUE
CREDENTIAL_NAME	
DESTINATION	
PROGRAM_NAME	            PRGM_WITHDRAWAL_DELETE
JOB_TYPE	
JOB_ACTION	
NUMBER_OF_ARGUMENTS	
SCHEDULE_OWNER	        TEAM_SEOLO
SCHEDULE_NAME	        SCH_WITHDRAWAL_DELETE
SCHEDULE_TYPE	        NAMED
START_DATE	            21/12/14 12:00:00.400000000 ASIA/SEOUL
REPEAT_INTERVAL	
END_DATE	
EVENT_QUEUE_OWNER	
EVENT_QUEUE_NAME	
EVENT_QUEUE_AGENT	
EVENT_CONDITION	
FILE_WATCHER_OWNER	
FILE_WATCHER_NAME	
*/


-- 누적경고 계산 함수 (계정 고유번호를 넣으면 누적경고 RETURN)
-- 승인(1) - 글번호 작성자(CHECK_NO)가 경고
-- 허위신고(3) - 신고글 작성자(AC_NO)가 경고
CREATE OR REPLACE FUNCTION WARNING_COUNT(V_AC_NO NUMBER)
RETURN NUMBER
    IS
        TEMP_NUM    NUMBER;
        CNTRESULT   NUMBER;
    BEGIN
        SELECT COUNT(*) INTO CNTRESULT
        FROM REPORT_CHECK 
        WHERE STATUS_NO=3 AND AC_NO=V_AC_NO;
        
        SELECT COUNT(*) INTO TEMP_NUM
        FROM
        (
            SELECT R.CHECK_NO, R.STATUS_NO, C.AC_NO
            FROM REPORT_CHECK R, CHECKLIST C
            WHERE R.CHECK_NO=C.CHECK_NO(+)
        )
        WHERE STATUS_NO=1 AND AC_NO=V_AC_NO;
        
        CNTRESULT := CNTRESULT + TEMP_NUM;
    
    RETURN CNTRESULT;
END;
--==> Function WARNING_COUNT이(가) 컴파일되었습니다.

SELECT * FROM ACCOUNT;
SELECT * FROM PERSONAL;

-------------------------------------------------------------------------------

-- 탈퇴 프로시저 수정
--◈  계정 삭제 프로시저 (개인정보 테이블에서 빼주고, 탈퇴회원 테이블에 삽입)
--> 계정을 삭제하면 개인정보 테이블에선 -, 탈퇴회원 테이블에 +

-- 프로시저 선언
CREATE OR REPLACE PROCEDURE PRC_ACCOUNT_DELETE
(   V_AC_NO         IN WITHDRAWAL.AC_NO%TYPE
,   V_WIR_NO        IN WITHDRAWAL.WIR_NO%TYPE
,   V_COMMENTS    	IN WITHDRAWAL.COMMENTS%TYPE
)
IS
    -- 변수 선언
    V_WI_NO         NUMBER;
    
    -- 계산할 때 필요한 값
    -- EXCEPTION
    -- 중복 안되게 해야되는 값 -> 아이디, 비밀번호
    TEMP_ID     VARCHAR2(30);
    TEMP_NAME   VARCHAR2(30);
    TEMP_TEL    VARCHAR2(30);
    
BEGIN
    -- AC_NO를 통해 아이디 정보 얻기
    SELECT PE_ID INTO TEMP_ID
    FROM PERSONAL
    WHERE AC_NO=V_AC_NO;
    
    -- 전화번호 얻기
    SELECT TEL INTO TEMP_TEL
    FROM PERSONAL
    WHERE AC_NO=V_AC_NO;
  
    -- 이름 얻기
    SELECT NAME INTO TEMP_NAME 
    FROM PERSONAL
    WHERE AC_NO=V_AC_NO;
    
    -- 탈퇴회원 테이블 +       
    INSERT INTO WITHDRAWAL(WI_NO, AC_NO, WIR_NO, COMMENTS, WIDATE, ID, NAME, TEL)
        VALUES (WITHDRAWALSEQ.NEXTVAL, V_AC_NO, V_WIR_NO, V_COMMENTS, SYSDATE, TEMP_ID, TEMP_NAME, TEMP_TEL);
    
    -- 개인정보 테이블 -
    DELETE
    FROM PERSONAL
    WHERE AC_NO=V_AC_NO;
      

    -- 예외처리
    EXCEPTION
        WHEN OTHERS THEN ROLLBACK;
END;
--==>> Procedure PRC_ACCOUNT_DELETE이(가) 컴파일되었습니다.

COMMIT;