-- SELECT : 데이터 조회
-- DELETE : 데이터 삭제
-- INSERT : 데이터 삽입

--SELECT COUNT(*) AS CNT FROM STUDENT; // AS 이름바꾸기
SELECT * FROM EMP;

--1.EMP 테이블에서 옥한빛 삭제하기
DELETE
FROM EMP
WHERE ENAME = 'SMITH';

--DELETE FROM LLAASSTT WHERE ENAME = 'SMITH'; // 사고방지를 위해 맨마지막에 입력

--2.EMP 테이블에서 급여(SAL)가 1500미만인 레코드 삭제
DELETE
FROM EMP
WHERE SAL <1500;
COMMIT;

--3.EMP테이블에서 커미션값(COMM)이 NULL이 아닌 레코드 삭제
DELETE
FROM EMP
WHERE COMM IS NOT NULL;
