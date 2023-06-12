--CRUD
--CREATE, READ, UPDATE, DELETE
--������ ����(INSERT)
INSERT INTO STUDENT(STU_NO, STU_NAME, STU_DEPT)VALUES(20230612,'ȫ�浿','��ǻ������');

SELECT *
FROM STUDENT;

INSERT INTO STUDENT(STU_NO, STU_NAME, STU_DEPT,STU_GRADE, STU_GENDER)VALUES(20231234,'ȫ�浿','���',1,'M');

DELETE
FROM STUDENT
WHERE STU_NO = 20231234;

--�� �а����� ���� Ű�� ū ��
SELECT STU_DEPT, MAX(STU_HEIGHT)
FROM STUDENT
GROUP BY STU_DEPT;

--�� ������ ���� Ű ū ��
SELECT STU_GENDER, MAX(STU_HEIGHT)
FROM STUDENT
GROUP BY STU_GENDER;

--�� �а��� ��� ������
SELECT STU_DEPT, AVG(STU_WEIGHT)
FROM STUDENT
GROUP BY STU_DEPT;

--���� �л����� ��� Ű���� ū �л��� ���ϱ�
SELECT *
FROM STUDENT
WHERE STU_HEIGHT >(
    SELECT AVG(STU_HEIGHT)
    FROM STUDENT
    WHERE STU_DEPT = '���');
--��ǻ������ �л����� ��� �����Ժ��� ū �л��� ���ϱ�
SELECT *
FROM STUDENT
WHERE STU_WEIGHT >(
    SELECT AVG(STU_WEIGHT)
    FROM STUDENT
    WHERE STU_DEPT = '��ǻ������');
--��ǻ�������� �л��� ���� ū �л����� ū Ű�� ���� �л��� ���ϱ�
SELECT *
FROM STUDENT
WHERE STU_HEIGHT>(
    SELECT MAX(STU_HEIGHT)
    FROM STUDENT
    WHERE STU_DEPT = '��ǻ������');
    
--���а��� ���� Ű�� ū �л��� �й�, �̸� , Ű ���
SELECT STU_NO,STU_NAME,STU_DEPT,STU_HEIGHT
FROM STUDENT 
WHERE (STU_DEPT, STU_HEIGHT) IN (
    SELECT STU_DEPT,MAX(STU_HEIGHT)
    FROM STUDENT
    GROUP BY STU_DEPT);

--Ű �ּ�
SELECT MIN(STU_HEIGHT)
FROM STUDENT;

--Ű ���
SELECT AVG(STU_HEIGHT)
FROM STUDENT;

SELECT *
FROM STUDENT
WHERE STU_HEIGHT > (SELECT AVG(STU_HEIGHT) FROM STUDENT);