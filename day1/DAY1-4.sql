SELECT *
FROM STUDENT;
--FROM EMP;
-- 1. STUDENT 테이블에서 기계과 이면서 키가 170 이상인 학생 조회
SELECT *
FROM STUDENT
WHERE STU_DEPT = '기계' AND STU_HEIGHT >=170;
-- 2. STUDENT 테이블에서 반(STU_CLASS)가 A이거나 B인 학생 구하기
SELECT *
FROM STUDENT
WHERE STU_CLASS IN ('A','B');
-- 3. STUDENT 테이블에서 몸무게가 60~70 사이인 학생 구하기(BETWEEN 사용하기)
SELECT *
FROM STUDENT
WHERE STU_WEIGHT BETWEEN 60 AND 70;
-- 4. STUDENT 테이블에서 키가 170이상인 학생의 수 구하기
SELECT COUNT(*) AS 학생수
FROM STUDENT
WHERE STU_HEIGHT >=170;
-- 5. EMP 테이블에서 급여가 4000 이상인 레코드 삭제
DELETE
FROM EMP 
WHERE SAL >4000;
-- 6. EMP 테이블에서 부서번호(DEPTNO)가 20인 레코드 삭제
DELETE
FROM EMP
WHERE DEPTNO = 20;
-- 7. STUDENT 테이블에서 키가 180이상인 학생의 몸무게 1 증가
UPDATE STUDENT
SET 
    STU_WEIGHT = STU_WEIGHT +1
WHERE STU_HEIGHT >= 180;
-- 8. STUDENT 테이블에서 기계과 이면서 3학년인 학생의 반(STU_CLASS)
-- 를 B로 변경
UPDATE STUDENT
SET
    STU_CLASS = 'B'
WHERE STU_DEPT ='기계' AND STU_GRADE =3;