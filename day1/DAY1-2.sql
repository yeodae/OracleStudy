-- SELECT : ������ ��ȸ
-- DELETE : ������ ����
-- INSERT : ������ ����

--SELECT COUNT(*) AS CNT FROM STUDENT; // AS �̸��ٲٱ�
SELECT * FROM EMP;

--1.EMP ���̺��� ���Ѻ� �����ϱ�
DELETE
FROM EMP
WHERE ENAME = 'SMITH';

--DELETE FROM LLAASSTT WHERE ENAME = 'SMITH'; // �������� ���� �Ǹ������� �Է�

--2.EMP ���̺��� �޿�(SAL)�� 1500�̸��� ���ڵ� ����
DELETE
FROM EMP
WHERE SAL <1500;
COMMIT;

--3.EMP���̺��� Ŀ�̼ǰ�(COMM)�� NULL�� �ƴ� ���ڵ� ����
DELETE
FROM EMP
WHERE COMM IS NOT NULL;
