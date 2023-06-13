--MAX, MIN, AVG
--서브쿼리
SELECT MAX(STU_HEIGHT)
FROM STUDENT; -- 가장 큰 키

SELECT *
FROM STUDENT
WHERE STU_HEIGHT = ( -- 쿼리 안에 서브쿼리
    SELECT MAX(STU_HEIGHT)
    FROM STUDENT);
    
--학생들의 전체. 평균 몸무게.보다 더 높은 몸무게.를 가진 학생 검색
SELECT *
FROM STUDENT
WHERE STU_WEIGHT > (
    SELECT AVG(STU_WEIGHT)
    FROM STUDENT);

--각 학과별 가장 몸무게가 적게나가는 학생 구하기
SELECT *
FROM STUDENT
WHERE STU_WEIGHT IN (
    SELECT MIN(STU_WEIGHT)
    FROM STUDENT
    GROUP BY STU_DEPT);
    
--위문제와 동일 ,,, 몸무게 대신 키로 
SELECT *
FROM STUDENT
WHERE (STU_DEPT,STU_HEIGHT) IN ( --두개이상의 컬럼비교 
    SELECT STU_DEPT, MAX(STU_HEIGHT)
    FROM STUDENT
    GROUP BY STU_DEPT);
    
--각 학과별 키가 가장 작은 학생 구하기
SELECT *
FROM STUDENT
WHERE (STU_DEPT,STU_HEIGHT) IN (
    SELECT STU_DEPT, MIN(STU_HEIGHT)
    FROM STUDENT
    GROUP BY STU_DEPT);