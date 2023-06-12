--절대 값
SELECT ABS(-10),-10
FROM DUAL; --임시 테이블

--반올림★★★★★
SELECT 111.222 ,ROUND(111.5),ROUND(111.222,1)--소수점 첫째자리까지 반올림
FROM DUAL;
SELECT ROUND(111.222,-1)--110 출력 -1칸반올림
FROM DUAL;

--내림
SELECT FLOOR(10.9)--소수점 버림
FROM DUAL;

--올림
SELECT CEIL(10.1)
FROM DUAL; --소수점이 존재하면 무조건 올림

--소수점 자르기
SELECT TRUNC(111.222,1) ,TRUNC(111.222, -1),TRUNC(111.222)
FROM DUAL;

--SIGN
SELECT SIGN(10), SIGN(-3),SIGN(0),SIGN(NULL),SIGN(100),SIGN(-1000) 
FROM DUAL; -- 양수일때 1 음수일때 -1 0->0 NULL->NULL
