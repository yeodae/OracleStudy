--0.�� �а��� ��� ������ ���� ���� �л��� �й�, �̸� , Ű ���
SELECT * FROM STUDENT; 
SELECT * FROM ENROL;


SELECT S.STU_NO,S.STU_NAME,S.STU_HEIGHT,S.STU_DEPT,S2.ENR_GRADE
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
INNER JOIN (SELECT STU_DEPT, MAX(ENR_GRADE) AS ENR_GRADE
        FROM STUDENT S
        INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
        GROUP BY STU_DEPT
)S2 ON E.ENR_GRADE = S2.ENR_GRADE AND S.STU_DEPT = S2.STU_DEPT;

--1.���������� ���� ���� ����� ��� , �̸�, �������� �� ���
SELECT *
FROM EMP;

SELECT *
FROM EMP E
INNER JOIN(
    SELECT MGR, COUNT(MGR) AS CNT
    FROM EMP
    GROUP BY MGR
    ORDER BY CNT DESC
)E2 ON E.EMPNO = E2.MGR
WHERE ROWNUM = 1;

create table department
( deptno number(3) primary key ,
  dname varchar2(25) not null,
  part number(3),
  build  varchar2(20))tablespace users;


