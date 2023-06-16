SELECT * FROM STUDENT2;

SELECT NAME,
    CASE WHEN GRADE = '1' THEN '���Ի�'
        WHEN GRADE = '2' THEN '2�г�'
        WHEN GRADE = '3' THEN '3�г�'
        WHEN GRADE = '4' THEN '��������'
        ELSE '���п���'
    END AS �г�����
FROM STUDENT2;

--������ GRADE�� 5�� ����
UPDATE STUDENT2
SET
    GRADE = 5
WHERE NAME='������';

--EMP���̺��� �޿��� 1000���ϸ� 'D���'
--1001~2000 'C���'
--2001~3000 'B���'
--�׿� 'A���'
SELECT 
    CASE WHEN SAL <= 1000 THEN 'D���'
        WHEN SAL BETWEEN 1001 AND 2000 THEN 'C���'
        WHEN SAL BETWEEN 2001 AND 3000 THEN 'B���'
        ELSE 'A���'
    END AS �޿����
FROM EMP;

--������(sequence) ���ڰ� �ڵ������� ����
SELECT * FROM BOARD;

CREATE SEQUENCE TEST_SEQ  -- �Խñ� ���� �Խ���
INCREMENT BY 1 -- ���� ��
START WITH 1 -- ���� ��
MINVALUE 1 -- �ּ� ��
MAXVALUE 100000 -- �ִ� ��
CYCLE -- NOCYCLE �ٽ� �ݺ����� ~ MIN �����
;

SELECT TEST_SEQ.NEXTVAL -- ���� �� ���
FROM DUAL;
SELECT TEST_SEQ.CURRVAL -- ������ ������ġ�� ǥ��
FROM DUAL;

INSERT INTO BOARD VALUES (TEST_SEQ.NEXTVAL, 'HTML ����', '������',SYSDATE,SYSDATE,'TEST',0,2);
SELECT * FROM BOARD; 

--��(VIEW)

--STUDENT,ENROL, SUBJECT
--�й�, �̸�, ����, �����
SELECT * FROM STUDENT; 
SELECT * FROM ENROL;
SELECT * FROM SUBJECT;

CREATE OR REPLACE VIEW V_STUDENT
AS 
    SELECT S.STU_NO, STU_NAME, ENR_GRADE, SUB_NAME, STU_GRADE
    FROM STUDENT S
    INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
    INNER JOIN SUBJECT SUB ON SUB.SUB_NO = E.SUB_NO
WITH READ ONLY    
    ;

SELECT * FROM V_STUDENT;

--MERGE(����) 
SELECT * FROM STUDENT;
SELECT * FROM STUDENT WHERE STU_NO = '20231234';

MERGE
    INTO STUDENT S
    USING DUAL D --�ʼ��� �ƴϴ�
    ON (S.STU_NO = '20231234')
WHEN MATCHED THEN 
    UPDATE SET
        STU_DEPT = '���'
WHEN NOT MATCHED THEN
    INSERT(STU_NO, STU_NAME, STU_DEPT)
    VALUES('20221234','ȫ�浿','���');

