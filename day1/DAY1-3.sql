--���� �ϱ� (UPDATE)

SELECT *
FROM STUDENT;

--1. STUDENT ���̺��� �������� �а��� ������ ����
UPDATE STUDENT
SET 
    STU_DEPT = '���',
    STU_GENDER ='M'
WHERE STU_NAME = '������';

--2.STUDENT ���̺��� Ű�� NULL�� ���ڵ��� Ű ���� 175�� ����
UPDATE STUDENT
SET
    STU_HEIGHT = 175
WHERE STU_HEIGHT IS NULL;

--3.STUDENT ���̺��� �����԰� 50������ �л����� �����Ը� 1����
UPDATE STUDENT
SET 
    STU_WEIGHT = STU_WEIGHT+1
WHERE STU_WEIGHT <= 50; 
