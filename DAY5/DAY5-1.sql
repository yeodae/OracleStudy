--1.1 ���������� ���� �л����� �й�, �̸�, �������(������ 0���� ���)
SELECT * FROM STUDENT;
SELECT * FROM ENROL;
SELECT * FROM SUBJECT;

SELECT S.STU_NO, STU_NAME,NVL(ENR_GRADE,0)
FROM STUDENT S
LEFT JOIN ENROL E ON S.STU_NO = E.STU_NO
WHERE ENR_GRADE IS NULL;

--1.2 ������ 1���� �� �л����� �й�, �̸� , ���� ���
SELECT STU_NAME,S.STU_NO,COUNT(*)
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
GROUP BY S.STU_NO,STU_NAME
HAVING COUNT(*) = 1;

SELECT S.STU_NO, STU_NAME,ENR_GRADE
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
WHERE S.STU_NO IN(
    SELECT STU_NO
    FROM ENROL
    GROUP BY STU_NO    
    HAVING COUNT(*) = 1
);

--1-3 ������ �Ⱥ��Ұų� 1���� �� ģ������ �й�,�̸�,���� ���(������ �Ⱥ�ģ���� 0������ ���)
--���̺��� ��ġ�¹�� UNION ���Ͽ�/SUM/��ġ��
--�÷��� ��Ī�� �������̺��� ���󰣴�.

SELECT S.STU_NO AS �й� , STU_NAME AS �̸� ,NVL(ENR_GRADE,0) AS ���� 
FROM STUDENT S
LEFT JOIN ENROL E ON S.STU_NO = E.STU_NO
WHERE ENR_GRADE IS NULL
UNION
SELECT S.STU_NO, STU_NAME,ENR_GRADE
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
WHERE S.STU_NO IN(
    SELECT STU_NO
    FROM ENROL
    GROUP BY STU_NO    
    HAVING COUNT(*) = 1
);

SELECT *
FROM EMP;

--2.1�޿��� 1500�̻� �޴� ����� ���,�̸�,�޿�,Ŀ�̼� ���
SELECT EMPNO AS ��� ,ENAME AS �̸� ,SAL AS �޿�,NVL(COMM,0) AS Ŀ�̼�
FROM EMP
WHERE SAL >=1500;
--2.2 Ŀ�̼��� �޴� ����� ���,�̸�,�޿�,Ŀ�̼� ���
SELECT EMPNO,ENAME,SAL,COMM
FROM EMP
WHERE COMM IS NOT NULL;

--�� �ΰ� ���̺� UNION ��ġ�� // UNION ALL

SELECT EMPNO AS ��� ,ENAME AS �̸� ,SAL AS �޿�,NVL(COMM,0) AS Ŀ�̼�
FROM EMP
WHERE SAL >=1500
UNION ALL -- �ߺ��� ����� ��� ��� // UNION�� �ߺ�����
SELECT EMPNO,ENAME,SAL,COMM
FROM EMP
WHERE COMM IS NOT NULL
ORDER BY �޿� DESC;

