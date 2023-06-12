--PADDING 빈곳을 채워주는 역할

--RPAD
SELECT RPAD(JOB, 10, '*')
FROM EMP;

--LPAD
SELECT LPAD(JOB, 10, '*')
FROM EMP;

--공백제거 TRIM
SELECT TRIM('  TEST    '),'     TRIM    '
FROM DUAL;

--뒤에 공백 제거
SELECT RTRIM('    TEST    ')
FROM DUAL;
--앞쪽 공백 제거
SELECT LTRIM('     TEST    ')
FROM DUAL;

--특정 문자 찾기
SELECT INSTR(JOB,'A',1,2)
FROM EMP;

--첫글자는 대문자 나머지는 소문자
SELECT INITCAP(JOB)
FROM EMP;
--대문자로
SELECT UPPER('test')
FROM DUAL;
--소문자로
SELECT LOWER('TEST')
FROM DUAL;

--SUBSTR
SELECT SUBSTR(JOB, 4, 3), SUBSTR(JOB, 3)
FROM EMP;

--
--생년월일중 월일 가리기
SELECT RPAD(SUBSTR(STU_NO, 1,4),8,'*')
FROM STUDENT;
--940823-1234567 => 940823-1*******
SELECT RPAD(SUBSTR('940823-1234567',1,8),15,'*')
FROM DUAL;
--

--길이 구하기
SELECT LENGTH(JOB)
FROM EMP;

--REPLACE 문자열 변경
SELECT REPLACE(JOB, 'A', 'Z')
FROM EMP;

--이어 붙여 출력하기
SELECT STU_NAME ||'의 학과는 ' ||STU_DEPT||'과 입니다.'
FROM STUDENT;

SELECT STU_NAME||' 학생은 '||SUBSTR(STU_NO,3,2)||'학번 입니다.'AS TEST
FROM STUDENT;

--IF
SELECT DECODE(STU_GENDER, 'M', '남자', '여자') --if / else
--SELECT DECODE(STU_GENDER, 'M', '남자', 'F', '여자','없음')--if/else if/else
FROM STUDENT;
--940823-1234567 => 940823-1*******
SELECT RPAD(SUBSTR('940823-1234567',1,8),15,'*')
FROM DUAL;

WITH TEMP AS (--임시 테이블.실습용
    SELECT '800000-1234567' AS JUMIN, '홍길동' AS NAME FROM DUAL UNION ALL
    SELECT '900000-2234567' AS JUMIN, '홍길순' AS NAME FROM DUAL UNION ALL
    SELECT '700000-1234567' AS JUMIN, '유재석' AS NAME FROM DUAL UNION ALL
    SELECT '800100-3234567' AS JUMIN, '강호동' AS NAME FROM DUAL UNION ALL
    SELECT '800200-4234567' AS JUMIN, '박미선' AS NAME FROM DUAL 
)
SELECT RPAD(SUBSTR(JUMIN,1,8),14,'*') AS 주민번호, NAME AS 이름,
    DECODE(SUBSTR(JUMIN,8,1),
        '1','남자',
        '3','남자',
        '2','여자',
        '4','여자'
        )AS 성별
FROM TEMP;
--1.뒷자리 앞자리빼고 별표시
--2.남자(1,3), 여자(2,4)

SELECT *
FROM STUDENT
WHERE STU_NO LIKE '2015%'; --2015로 시작%하는 컬럼 조회하는 방법
--WHERE SUBSTR(STU_NO,1,4)=2015;
--2015년도에 입학한 사람 구하기

SELECT *
FROM STUDENT
WHERE STU_HEIGHT LIKE '17%';
--키 170대 찾기