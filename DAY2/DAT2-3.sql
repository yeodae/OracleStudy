DELETE FROM EMP;
COMMIT;

SELECT * FROM EMP; --DEPTNO
SELECT * FROM DEPT; 
SELECT * FROM SALGRADE; -- �޿������ ��Ÿ��

--�� ����� ���,�̸�,�μ���,�μ� ��ġ ���
SELECT EMPNO, ENAME, DNAME, LOC
FROM EMP E
INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO;

--�� ����� �̸�,�޿�,�޿���� ���
SELECT ENAME,SAL,GRADE
FROM EMP E
INNER JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
ORDER BY SAL ASC, ENAME;         -- SAL ~ �������� ���� : ORDER BY ~ ASC
--������ ���� �ִٸ� �ΰ����� �����������İ���  �������� ���� : ORDER BY ~ DESC


