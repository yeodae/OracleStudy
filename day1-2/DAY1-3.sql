--���� ��
SELECT ABS(-10),-10
FROM DUAL; --�ӽ� ���̺�

--�ݿø��ڡڡڡڡ�
SELECT 111.222 ,ROUND(111.5),ROUND(111.222,1)--�Ҽ��� ù°�ڸ����� �ݿø�
FROM DUAL;
SELECT ROUND(111.222,-1)--110 ��� -1ĭ�ݿø�
FROM DUAL;

--����
SELECT FLOOR(10.9)--�Ҽ��� ����
FROM DUAL;

--�ø�
SELECT CEIL(10.1)
FROM DUAL; --�Ҽ����� �����ϸ� ������ �ø�

--�Ҽ��� �ڸ���
SELECT TRUNC(111.222,1) ,TRUNC(111.222, -1),TRUNC(111.222)
FROM DUAL;

--SIGN
SELECT SIGN(10), SIGN(-3),SIGN(0),SIGN(NULL),SIGN(100),SIGN(-1000) 
FROM DUAL; -- ����϶� 1 �����϶� -1 0->0 NULL->NULL
