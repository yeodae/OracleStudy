-- 1. 김인중 학생이 듣는 수업의 과목명과 교수 이름 출력
SELECT * FROM STUDENT;
SELECT * FROM ENROL;
SELECT * FROM SUBJECT;

SELECT STU_NAME,SUB_NAME, SUB_PROF
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
INNER JOIN SUBJECT SUB ON SUB.SUB_NO = E.SUB_NO
WHERE STU_NAME = '김인중';

-- 2. 컴퓨터개론 수업을 듣는 학생의 학번, 이름 출력
SELECT S.STU_NO,STU_NAME
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
INNER JOIN SUBJECT SUB ON SUB.SUB_NO = E.SUB_NO
WHERE SUB_NAME = '컴퓨터개론';


-- 3. 기계공작법, 기초전자실험 수업을 듣는 학생의 학번, 이름, 수업명 출력
SELECT S.STU_NO,STU_NAME,SUB_NAME
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
INNER JOIN SUBJECT SUB ON SUB.SUB_NO = E.SUB_NO
WHERE SUB_NAME IN ('기계공작법','기초전자실험');


-- 4. 여자이면서 구봉규 교수의 수업을 드는 학생의 학번, 이름, 학과, 수업명, 과목 점수 출력
SELECT S.STU_NO, STU_NAME, STU_DEPT, SUB_NAME, ENR_GRADE
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
INNER JOIN SUBJECT SUB ON SUB.SUB_NO = E.SUB_NO
WHERE SUB_PROF = '구봉규' AND STU_GENDER = 'F'
;

--5.김인중의 평균 점수보다 낮은 점수를 받은 학생들의 이름, 과목명 점수 출력
SELECT * FROM STUDENT;
SELECT * FROM SUBJECT;

SELECT STU_NAME,SUB_NAME,ENR_GRADE
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
INNER JOIN SUBJECT SUB ON SUB.SUB_NO = E.SUB_NO
WHERE ENR_GRADE < (
    SELECT AVG(ENR_GRADE)
    FROM STUDENT S
    INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
    INNER JOIN SUBJECT SUB ON SUB.SUB_NO = E.SUB_NO
    WHERE S.STU_NAME = '김인중'
);

--5-1.기계과에서 가장 높은 점수 출력
SELECT MAX(ENR_GRADE)
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
WHERE STU_DEPT = '기계';

--5-2.학생들의 목록을 출력(점수를 포함해서)
SELECT *
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO;

--5-3.기계과의 최고점수보다 높은 점수를 받은 학생 출력
SELECT STU_NAME,STU_DEPT,ENR_GRADE
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
WHERE ENR_GRADE > 
    (SELECT MAX(ENR_GRADE)
    FROM STUDENT S
    INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
    WHERE STU_DEPT = '기계'
    );
--5-4. 전기전자과의 평균 점수보다 높은 점수를 받은 학생들의 목록출력
SELECT *
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
WHERE ENR_GRADE > (
    SELECT MAX(ENR_GRADE)
    FROM STUDENT S
    INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
    WHERE STU_DEPT = '전기전자');


--6. 2개 이상의 과목을 들은 학생들의 목록 출력
SELECT *
FROM STUDENT 
WHERE STU_NO IN(
    SELECT STU_NO
    FROM ENROL
    GROUP BY ENROL.STU_NO
    HAVING COUNT(*) > 1
);
SELECT *
FROM (
    SELECT STU_NO, COUNT(*) AS CNT
    FROM ENROL
    GROUP BY STU_NO)
WHERE CNT > 1;

SELECT * FROM STUDENT;
SELECT * FROM ENROL;
SELECT * FROM SUBJECT;

--7. 각 학과의 학생들의 평균 점수를 구해서, 가장 큰 평균 값에서 가장 작은 평균 값 빼기
SELECT MAX(S_AVG)-MIN(S_AVG)
FROM (
    SELECT STU_DEPT, AVG(ENR_GRADE) AS S_AVG
    FROM STUDENT S
    INNER JOIN ENROL E ON E.STU_NO = S.STU_NO
    GROUP BY STU_DEPT
);
