--MAX, MIN, AVG
--��������
SELECT MAX(STU_HEIGHT)
FROM STUDENT; -- ���� ū Ű

SELECT *
FROM STUDENT
WHERE STU_HEIGHT = ( -- ���� �ȿ� ��������
    SELECT MAX(STU_HEIGHT)
    FROM STUDENT);
    
--�л����� ��ü. ��� ������.���� �� ���� ������.�� ���� �л� �˻�
SELECT *
FROM STUDENT
WHERE STU_WEIGHT > (
    SELECT AVG(STU_WEIGHT)
    FROM STUDENT);

--�� �а��� ���� �����԰� ���Գ����� �л� ���ϱ�
SELECT *
FROM STUDENT
WHERE STU_WEIGHT IN (
    SELECT MIN(STU_WEIGHT)
    FROM STUDENT
    GROUP BY STU_DEPT);
    
--�������� ���� ,,, ������ ��� Ű�� 
SELECT *
FROM STUDENT
WHERE (STU_DEPT,STU_HEIGHT) IN ( --�ΰ��̻��� �÷��� 
    SELECT STU_DEPT, MAX(STU_HEIGHT)
    FROM STUDENT
    GROUP BY STU_DEPT);
    
--�� �а��� Ű�� ���� ���� �л� ���ϱ�
SELECT *
FROM STUDENT
WHERE (STU_DEPT,STU_HEIGHT) IN (
    SELECT STU_DEPT, MIN(STU_HEIGHT)
    FROM STUDENT
    GROUP BY STU_DEPT);