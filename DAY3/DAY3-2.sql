--SELF JOIN
--같은 테이블을 조인하는것
SELECT E.ENAME AS 본인, E2.ENAME AS 팀장
FROM EMP E
INNER JOIN EMP E2 ON E.MG R = E2.EMPNO
WHERE E.ENAME = 'SMITH';

SELECT * FROM EMP;

SELECT *
FROM EMP E
INNER JOIN EMP E2 ON E.MGR = E2.EMPNO;

--WHERE ROWNUM = 1; //맨위 값만 출력 

--1.부하직원이 가장 많은 사람의 사번,이름,부하직원 수 출력
SELECT *
FROM EMP E
INNER JOIN (
    SELECT MGR, COUNT(MGR) AS CNT
    FROM EMP
    GROUP BY MGR 
    ORDER BY CNT DESC
    ) E2 ON E.EMPNO = E2.MGR
WHERE ROWNUM = 1;

SELECT *
FROM EMP E
INNER JOIN (
    SELECT MGR, COUNT(MGR) AS CNT
    FROM EMP
    GROUP BY MGR
    HAVING COUNT(MGR) = ( -- =5
        SELECT MAX(CNT)
        FROM (
            SELECT MGR, COUNT(MGR) AS CNT
            FROM EMP
            GROUP BY MGR
        )
    )
) E2 ON E.EMPNO = E2.MGR;

SELECT * FROM EMP;
--2. 부하직원의 급여 평균이 가장 높은 사람의 사번,이름,급여 평균 출력


SELECT *
FROM EMP E
INNER JOIN (
    SELECT MGR, AVG(SAL) AS ASAL
    FROM EMP 
    GROUP BY MGR
    HAVING AVG(SAL) = (
        SELECT MAX(ASAL)
        FROM (
            SELECT MGR, AVG(SAL) AS ASAL            
            FROM EMP 
            WHERE MGR IS NOT NULL
            GROUP BY MGR
            )
        )   
) E2 ON E.EMPNO = E2.MGR;

SELECT *
FROM EMP E
INNER JOIN (
    SELECT MGR , AVG(SAL) AS ASAL
    FROM EMP
    WHERE MGR IS NOT NULL
    GROUP BY MGR
    ORDER BY ASAL DESC
    ) E2 ON E.EMPNO = E2.MGR
WHERE ROWNUM = 1;

