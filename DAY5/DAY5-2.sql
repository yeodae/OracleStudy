--1. ANSI JOIN 현업에서 자주쓰이는 조인방법
--2. ORACLE JOIN

-- STUDENT2 테이블의 학생 목록 출력 -> 학번,이름,학년,학과명
SELECT * FROM STUDENT2;
SELECT * FROM DEPARTMENT;

SELECT STUDNO, NAME, GRADE, DNAME
FROM STUDENT2 S
INNER JOIN DEPARTMENT D ON S.DEPTNO1 = D.DEPTNO; -- ANSI JOIN

--ORACLE JOIN 으로 변경 오라클조인
SELECT STUDNO, NAME, GRADE, DNAME
FROM STUDENT2 S, DEPARTMENT D
WHERE S.DEPTNO1 = D.DEPTNO; --명령문에 조인조건을 걸어준다.

--ORACLE JOIN (LEFT JOIN)
SELECT S.STU_NO, STU_NAME,NVL(ENR_GRADE,0)
FROM STUDENT S
LEFT JOIN ENROL E ON S.STU_NO = E.STU_NO
WHERE ENR_GRADE IS NULL; -- 기존 LEFT JOIN = ANSI JOIN
--ORACLE JOIN으로 변경
SELECT S.STU_NO, STU_NAME,NVL(ENR_GRADE,0) AS ENR_GRADE
FROM STUDENT S, ENROL E
WHERE S.STU_NO = E.STU_NO(+) AND ENR_GRADE IS NULL; --(+)을 붙이면 조인하는 컬럼이 된다.(지정)

-- STUDENT2 테이블의 학생 목록 출력 -> 학번,이름,학년,학부명
SELECT D2.DNAME
FROM STUDENT2 S, DEPARTMENT D, DEPARTMENT D2
WHERE S.DEPTNO1 = D.DEPTNO AND D2.DEPTNO = D.PART;


SELECT * FROM STUDENT2;
SELECT * FROM DEPARTMENT;
--아이디 가리기 모자이크 
SELECT RPAD(SUBSTR(ID,1,3),LENGTH(ID),'*')
FROM STUDENT2;

--급여 + 보너스의 평균이 가장 높은 학과는 어디일까요
SELECT *
FROM DEPARTMENT D
INNER JOIN(
    SELECT DEPTNO,AVG(PAY + NVL(BONUS,0)) AS APAY
    FROM PROFESSOR P
    GROUP BY DEPTNO
    ORDER BY APAY DESC) P ON D.DEPTNO = P.DEPTNO
WHERE ROWNUM = 1;

SELECT * FROM PROFESSOR;
SELECT * FROM DEPARTMENT;
--컴퓨터정보학부 교수들과 인문사회학부 교수들의 평균급여 차이
SELECT *
FROM DEPARTMENT D
INNER JOIN (
    SELECT DEPTNO,AVG(PAY)
    FROM PROFESSOR P
    GROUP BY DEPTNO) P ON D.PART = P.DEPTNO
WHERE DNAME IN ('컴퓨터정보학부');

SELECT 
 (SELECT AVG(PAY)
 FROM PROFESSOR P
 INNER JOIN DEPARTMENT D ON P.DEPTNO = D.DEPTNO
 INNER JOIN DEPARTMENT D2 ON D.PART = D2.DEPTNO
 WHERE D2.DNAME LIKE '컴퓨터정보학부%') 
 -
(SELECT AVG(PAY)
 FROM PROFESSOR P
 INNER JOIN DEPARTMENT D ON P.DEPTNO = D.DEPTNO
 INNER JOIN DEPARTMENT D2 ON D.PART = D2.DEPTNO
 WHERE D2.DNAME LIKE '인문사회학부%') AS AA
FROM DUAL;
 
 SELECT MAX(SAL_AVG) - MIN(SAL_AVG)
 FROM (
    SELECT DEPTNO, ROUND(AVG(GRADE),1) AS SAL_AVG
    FROM EMP E
    INNER JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
    GROUP BY DEPTNO);




