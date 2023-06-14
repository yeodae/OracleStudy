--SELF JOIN
--���� ���̺��� �����ϴ°�
SELECT E.ENAME AS ����, E2.ENAME AS ����
FROM EMP E
INNER JOIN EMP E2 ON E.MG R = E2.EMPNO
WHERE E.ENAME = 'SMITH';

SELECT * FROM EMP;

SELECT *
FROM EMP E
INNER JOIN EMP E2 ON E.MGR = E2.EMPNO;

--WHERE ROWNUM = 1; //���� ���� ��� 

--1.���������� ���� ���� ����� ���,�̸�,�������� �� ���
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
--2. ���������� �޿� ����� ���� ���� ����� ���,�̸�,�޿� ��� ���


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

