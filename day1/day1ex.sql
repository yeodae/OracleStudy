--COMMIT;
--
--ROLLBACK;
--
--SELECT * FROM SALGRADE;
--
--DELETE FROM SALGRADE;
--
--STUDENT, ENROL, SUBJECT ���̺� ���
--1. STUDENT ���̺� ��ȸ ����
SELECT * FROM STUDENT;

--2. STUDENT ���̺� ���ڵ� ���� ���ϱ� - ��Ī CNT
SELECT COUNT(*) AS CNT FROM STUDENT;

--3.STUDENT ���̺��� �й�, �̸�, �а� �÷� ��ȸ
SELECT STU_NO,STU_NAME,STU_DEPT FROM STUDENT;

--4.STUDENT ���̺��� ���� �л��� ��ȸ(���� -> WHERE)
SELECT *
FROM STUDENT
--WHERE STU_DEPT = '���' AND STU_GENDER = 'M';
WHERE STU_DEPT IN ('���');

--5. STUDENT ���̺��� ���ڸ� �˻�
SELECT *
FROM STUDENT
WHERE STU_GENDER = 'M';

--6. STUDENT ���̺��� Ű(STU_HEIGHT)�� 170�̻��� �л� ��ȸ
SELECT *
FROM STUDENT
WHERE STU_HEIGHT >= 170;

--7. STUDENT ���̺��� Ű�� 175�̻� �̰ų�(OR) �����԰� 60�̻��� �л���ȸ
SELECT *
FROM STUDENT
WHERE STU_HEIGHT >=175 OR STU_WEIGHT >= 60;

--8. STUDENT ���̺��� Ű�� 170~180 ������ �л� ��ȸ
SELECT *
FROM STUDENT
--WHERE STU_HEIGHT >= 170 AND STU_HEIGHT <=180;
WHERE STU_HEIGHT BETWEEN 170 AND 180;

--9. STUDENT ���� Ű�� NULL�� �л� ��ȸ
SELECT *
FROM STUDENT
--WHERE STU_HEIGHT IS NULL; 
WHERE STU_HEIGHT IS NOT NULL; --NULL���� �ƴѰ�츸 ���

--10 . STUDENT ���̺��� ���� �̰ų� ���� ���ڰ��� �л��� ��ȸ
SELECT *
FROM STUDENT
WHERE STU_DEPT IN ('���','��������');
--WHERE STU_DEPT = '���' OR STU_DEPT = '��������';

--11.STUDENT ���̺��� ���л��� �� ��ȸ
SELECT COUNT(*) AS ���л���
FROM STUDENT
WHERE STU_GENDER = 'M';

