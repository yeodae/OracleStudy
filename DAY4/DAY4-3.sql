--1. �� �г⺰ �л����� ��� Ű�� ���Ͻÿ�.
SELECT GRADE, AVG(HEIGHT) AS ���Ű
FROM STUDENT2
GROUP BY GRADE;

--2. 96�й��� 97�й� �� ���� Ű�� ū �л��� �й�, �̸�, ���̵�, Ű�� ����Ͻÿ�.
-- (�й� : STUDNO �� ù �α���)
SELECT STUDNO,NAME,ID,HEIGHT
FROM STUDENT2
WHERE HEIGHT = (
    SELECT MAX(HEIGHT) AS HEIGHT
    FROM STUDENT2
    WHERE SUBSTR(STUDNO,1,2) IN ('96','97')
    );
    
SELECT STUDNO, NAME, ID, S.HEIGHT
FROM STUDENT2 S
INNER JOIN (
    SELECT SUBSTR(STUDNO,1,2) AS HAKBUN, MAX(HEIGHT) AS HEIGHT
    FROM STUDENT2
    WHERE SUBSTR(STUDNO,1,2) IN (96, 97)
    GROUP BY SUBSTR(STUDNO,1,2)
    ORDER BY HEIGHT
) S2 ON SUBSTR(STUDNO,1,2) = HAKBUN AND S.HEIGHT = S2.HEIGHT
WHERE ROWNUM = 1;

SELECT *
FROM STUDENT2
WHERE HEIGHT = (
    SELECT MAX(HEIGHT)
    FROM STUDENT2
    WHERE SUBSTR(STUDNO,1,2) IN (96, 97)
) AND SUBSTR(STUDNO,1,2) IN (96, 97);

SELECT *
FROM STUDENT2 S 
INNER JOIN (
    SELECT MAX(HEIGHT) AS HEIGHT
    FROM STUDENT2
    WHERE SUBSTR(STUDNO,1,2) IN (96, 97)
) S2 ON S.HEIGHT = S2.HEIGHT
WHERE SUBSTR(STUDNO,1,2) IN (96, 97);


--3. ������ ����ӱ��� ���� ���� �а��� �а���, ��� �ӱ��� ����Ͻÿ�.
SELECT DNAME,PAY
FROM (
    SELECT D.DNAME, AVG(PAY) AS PAY
    FROM PROFESSOR P
    INNER JOIN DEPARTMENT D ON P.DEPTNO = D.DEPTNO
    GROUP BY D.DNAME
    ORDER BY PAY DESC) WHERE ROWNUM = 1;
    
SELECT DNAME, PAY
FROM DEPARTMENT D
INNER JOIN (
    SELECT DEPTNO, AVG(PAY) AS PAY
    FROM PROFESSOR
    GROUP BY DEPTNO
    ORDER BY PAY DESC
) D2 ON D.DEPTNO = D2.DEPTNO 
WHERE ROWNUM = 1;

--4. 95��~05�� ���̿� ������ ������ ���� ���Ͻÿ�.
SELECT COUNT(*) AS �����Ǽ�
FROM PROFESSOR
WHERE HIREDATE BETWEEN TO_DATE('95/01/01') AND TO_DATE('05/01/01'); 

SELECT COUNT(*) AS ��¥����
FROM (
    SELECT *
    FROM PROFESSOR
    WHERE HIREDATE BETWEEN '95/01/01' AND '05/12/31')
WHERE POSITION LIKE '%����%'
; 

--5. '�ι�����'�� �Ҽӵ� �������� ����� ���Ͻÿ�.
SELECT *
FROM PROFESSOR P
INNER JOIN DEPARTMENT D ON P.DEPTNO = D.DEPTNO 
INNER JOIN DEPARTMENT D2 ON D.PART = D2.DEPTNO
INNER JOIN DEPARTMENT D3 ON D2.PART = D3.DEPTNO
WHERE D3.DNAME = '�ι�����';

--6. �� �г⺰ Ű�� ���� ū �л��� �й�, �̸�, �г�, Ű�� ���Ͻÿ�.
SELECT S.STUDNO,S.NAME,S.GRADE,S.HEIGHT
FROM STUDENT2 S
INNER JOIN ( 
    SELECT GRADE,MAX(HEIGHT) AS HEIGHT
    FROM STUDENT2
    GROUP BY GRADE) S2 ON S.HEIGHT = S2.HEIGHT AND S.GRADE = S2.GRADE;
    
--6-1.�� �а��� �����԰� ���� ���� �л��� �й�, �̸�, �г�, Ű�� ���Ͻÿ�
SELECT STUDNO, NAME, GRADE, HEIGHT, S2.DNAME , S.WEIGHT
FROM STUDENT2 S
INNER JOIN DEPARTMENT D ON S.DEPTNO1 = D.DEPTNO
INNER JOIN (
    SELECT D.DNAME, MIN(WEIGHT) AS WEIGHT
    FROM STUDENT2 S
    INNER JOIN DEPARTMENT D ON S.DEPTNO1 = D.DEPTNO
    GROUP BY D.DNAME) S2 ON S.WEIGHT = S2.WEIGHT AND D.DNAME = S2.DNAME;
    
    SELECT STUDNO, NAME, GRADE, S.WEIGHT, S2.DEPTNO1
FROM STUDENT2 S
INNER JOIN (
    SELECT DEPTNO1, MIN(WEIGHT) AS WEIGHT
    FROM STUDENT2 S
    INNER JOIN DEPARTMENT D ON S.DEPTNO1 = D.DEPTNO
    GROUP BY DEPTNO1
)S2 ON S.DEPTNO1 = S2.DEPTNO1 AND S.WEIGHT = S2.WEIGHT;

--6-2. 96�й��� ���� ū Ű ���� 97�й� �� ���� ���� Ű ���� ���� ���ϱ� 
SELECT 
    (SELECT MAX(HEIGHT) 
    FROM STUDENT2 
    WHERE SUBSTR(STUDNO,1,2) = 96)
    - 
    (SELECT MIN(HEIGHT)AS MIN
    FROM STUDENT2
    WHERE SUBSTR(STUDNO,1,2) = 97) AS Ű����
FROM DUAL;


--7. 78��� �л����� ����(��,��) �ο����� ���Ͻÿ�.

SELECT 
    SUM(DECODE(SUBSTR(JUMIN,7,1), '1', 1, 0))"����"
    ,SUM(DECODE(SUBSTR(JUMIN,7,1), '2', 1, 0))"����"
FROM STUDENT2
WHERE SUBSTR(JUMIN,1,2) = 78;

SELECT 
    COUNT(DECODE(SUBSTR(JUMIN,7,1), '1', 1, '����'))
    ,COUNT(DECODE(SUBSTR(JUMIN,7,1), '2', 1, '����')) 
FROM STUDENT2
WHERE JUMIN LIKE '78%';


SELECT 
    COUNT(A) AS ����,
    COUNT(B) AS ����
FROM(
    SELECT 
    DECODE(SUBSTR(JUMIN,7,1), '1', '����') AS A
    ,DECODE(SUBSTR(JUMIN,7,1), '2', '����') AS B
    FROM STUDENT2
    WHERE SUBSTR(JUMIN,1,2) = 78
);