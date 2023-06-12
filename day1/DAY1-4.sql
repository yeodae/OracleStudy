SELECT *
FROM STUDENT;
--FROM EMP;
-- 1. STUDENT ���̺��� ���� �̸鼭 Ű�� 170 �̻��� �л� ��ȸ
SELECT *
FROM STUDENT
WHERE STU_DEPT = '���' AND STU_HEIGHT >=170;
-- 2. STUDENT ���̺��� ��(STU_CLASS)�� A�̰ų� B�� �л� ���ϱ�
SELECT *
FROM STUDENT
WHERE STU_CLASS IN ('A','B');
-- 3. STUDENT ���̺��� �����԰� 60~70 ������ �л� ���ϱ�(BETWEEN ����ϱ�)
SELECT *
FROM STUDENT
WHERE STU_WEIGHT BETWEEN 60 AND 70;
-- 4. STUDENT ���̺��� Ű�� 170�̻��� �л��� �� ���ϱ�
SELECT COUNT(*) AS �л���
FROM STUDENT
WHERE STU_HEIGHT >=170;
-- 5. EMP ���̺��� �޿��� 4000 �̻��� ���ڵ� ����
DELETE
FROM EMP 
WHERE SAL >4000;
-- 6. EMP ���̺��� �μ���ȣ(DEPTNO)�� 20�� ���ڵ� ����
DELETE
FROM EMP
WHERE DEPTNO = 20;
-- 7. STUDENT ���̺��� Ű�� 180�̻��� �л��� ������ 1 ����
UPDATE STUDENT
SET 
    STU_WEIGHT = STU_WEIGHT +1
WHERE STU_HEIGHT >= 180;
-- 8. STUDENT ���̺��� ���� �̸鼭 3�г��� �л��� ��(STU_CLASS)
-- �� B�� ����
UPDATE STUDENT
SET
    STU_CLASS = 'B'
WHERE STU_DEPT ='���' AND STU_GRADE =3;