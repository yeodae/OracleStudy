-- 1. ������ �л��� ��� ������ ������ ���� �̸� ���
SELECT * FROM STUDENT;
SELECT * FROM ENROL;
SELECT * FROM SUBJECT;

SELECT STU_NAME,SUB_NAME, SUB_PROF
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
INNER JOIN SUBJECT SUB ON SUB.SUB_NO = E.SUB_NO
WHERE STU_NAME = '������';

-- 2. ��ǻ�Ͱ��� ������ ��� �л��� �й�, �̸� ���
SELECT S.STU_NO,STU_NAME
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
INNER JOIN SUBJECT SUB ON SUB.SUB_NO = E.SUB_NO
WHERE SUB_NAME = '��ǻ�Ͱ���';


-- 3. �����۹�, �������ڽ��� ������ ��� �л��� �й�, �̸�, ������ ���
SELECT S.STU_NO,STU_NAME,SUB_NAME
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
INNER JOIN SUBJECT SUB ON SUB.SUB_NO = E.SUB_NO
WHERE SUB_NAME IN ('�����۹�','�������ڽ���');


-- 4. �����̸鼭 ������ ������ ������ ��� �л��� �й�, �̸�, �а�, ������, ���� ���� ���
SELECT S.STU_NO, STU_NAME, STU_DEPT, SUB_NAME, ENR_GRADE
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
INNER JOIN SUBJECT SUB ON SUB.SUB_NO = E.SUB_NO
WHERE SUB_PROF = '������' AND STU_GENDER = 'F'
;

--5.�������� ��� �������� ���� ������ ���� �л����� �̸�, ����� ���� ���
SELECT * FROM STUDENT;
SELECT * FROM SUBJECT;

SELECT STU_NAME,SUB_NAME,ENR_GRADE
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
INNER JOIN SUBJECT SUB ON SUB.SUB_NO = E.SUB_NO
WHERE ENR_GRADE < (
    SELECT AVG(ENR_GRADE)
    FROM STUDENT S
    INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
    INNER JOIN SUBJECT SUB ON SUB.SUB_NO = E.SUB_NO
    WHERE S.STU_NAME = '������'
);

--5-1.�������� ���� ���� ���� ���
SELECT MAX(ENR_GRADE)
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
WHERE STU_DEPT = '���';

--5-2.�л����� ����� ���(������ �����ؼ�)
SELECT *
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO;

--5-3.������ �ְ��������� ���� ������ ���� �л� ���
SELECT STU_NAME,STU_DEPT,ENR_GRADE
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
WHERE ENR_GRADE > 
    (SELECT MAX(ENR_GRADE)
    FROM STUDENT S
    INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
    WHERE STU_DEPT = '���'
    );
--5-4. �������ڰ��� ��� �������� ���� ������ ���� �л����� ������
SELECT *
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
WHERE ENR_GRADE > (
    SELECT MAX(ENR_GRADE)
    FROM STUDENT S
    INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
    WHERE STU_DEPT = '��������');


--6. 2�� �̻��� ������ ���� �л����� ��� ���
SELECT *
FROM STUDENT 
WHERE STU_NO IN(
    SELECT STU_NO
    FROM ENROL
    GROUP BY ENROL.STU_NO
    HAVING COUNT(*) > 1
);
SELECT *
FROM (
    SELECT STU_NO, COUNT(*) AS CNT
    FROM ENROL
    GROUP BY STU_NO)
WHERE CNT > 1;

SELECT * FROM STUDENT;
SELECT * FROM ENROL;
SELECT * FROM SUBJECT;

--7. �� �а��� �л����� ��� ������ ���ؼ�, ���� ū ��� ������ ���� ���� ��� �� ����
SELECT MAX(S_AVG)-MIN(S_AVG)
FROM (
    SELECT STU_DEPT, AVG(ENR_GRADE) AS S_AVG
    FROM STUDENT S
    INNER JOIN ENROL E ON E.STU_NO = S.STU_NO
    GROUP BY STU_DEPT
);
