--PADDING ����� ä���ִ� ����

--RPAD
SELECT RPAD(JOB, 10, '*')
FROM EMP;

--LPAD
SELECT LPAD(JOB, 10, '*')
FROM EMP;

--�������� TRIM
SELECT TRIM('  TEST    '),'     TRIM    '
FROM DUAL;

--�ڿ� ���� ����
SELECT RTRIM('    TEST    ')
FROM DUAL;
--���� ���� ����
SELECT LTRIM('     TEST    ')
FROM DUAL;

--Ư�� ���� ã��
SELECT INSTR(JOB,'A',1,2)
FROM EMP;

--ù���ڴ� �빮�� �������� �ҹ���
SELECT INITCAP(JOB)
FROM EMP;
--�빮�ڷ�
SELECT UPPER('test')
FROM DUAL;
--�ҹ��ڷ�
SELECT LOWER('TEST')
FROM DUAL;

--SUBSTR
SELECT SUBSTR(JOB, 4, 3), SUBSTR(JOB, 3)
FROM EMP;

--
--��������� ���� ������
SELECT RPAD(SUBSTR(STU_NO, 1,4),8,'*')
FROM STUDENT;
--940823-1234567 => 940823-1*******
SELECT RPAD(SUBSTR('940823-1234567',1,8),15,'*')
FROM DUAL;
--

--���� ���ϱ�
SELECT LENGTH(JOB)
FROM EMP;

--REPLACE ���ڿ� ����
SELECT REPLACE(JOB, 'A', 'Z')
FROM EMP;

--�̾� �ٿ� ����ϱ�
SELECT STU_NAME ||'�� �а��� ' ||STU_DEPT||'�� �Դϴ�.'
FROM STUDENT;

SELECT STU_NAME||' �л��� '||SUBSTR(STU_NO,3,2)||'�й� �Դϴ�.'AS TEST
FROM STUDENT;

--IF
SELECT DECODE(STU_GENDER, 'M', '����', '����') --if / else
--SELECT DECODE(STU_GENDER, 'M', '����', 'F', '����','����')--if/else if/else
FROM STUDENT;
--940823-1234567 => 940823-1*******
SELECT RPAD(SUBSTR('940823-1234567',1,8),15,'*')
FROM DUAL;

WITH TEMP AS (--�ӽ� ���̺�.�ǽ���
    SELECT '800000-1234567' AS JUMIN, 'ȫ�浿' AS NAME FROM DUAL UNION ALL
    SELECT '900000-2234567' AS JUMIN, 'ȫ���' AS NAME FROM DUAL UNION ALL
    SELECT '700000-1234567' AS JUMIN, '���缮' AS NAME FROM DUAL UNION ALL
    SELECT '800100-3234567' AS JUMIN, '��ȣ��' AS NAME FROM DUAL UNION ALL
    SELECT '800200-4234567' AS JUMIN, '�ڹ̼�' AS NAME FROM DUAL 
)
SELECT RPAD(SUBSTR(JUMIN,1,8),14,'*') AS �ֹι�ȣ, NAME AS �̸�,
    DECODE(SUBSTR(JUMIN,8,1),
        '1','����',
        '3','����',
        '2','����',
        '4','����'
        )AS ����
FROM TEMP;
--1.���ڸ� ���ڸ����� ��ǥ��
--2.����(1,3), ����(2,4)

SELECT *
FROM STUDENT
WHERE STU_NO LIKE '2015%'; --2015�� ����%�ϴ� �÷� ��ȸ�ϴ� ���
--WHERE SUBSTR(STU_NO,1,4)=2015;
--2015�⵵�� ������ ��� ���ϱ�

SELECT *
FROM STUDENT
WHERE STU_HEIGHT LIKE '17%';
--Ű 170�� ã��