--수정 하기 (UPDATE)

SELECT *
FROM STUDENT;

--1. STUDENT 테이블에서 옥성우의 학과를 기계과로 변경
UPDATE STUDENT
SET 
    STU_DEPT = '기계',
    STU_GENDER ='M'
WHERE STU_NAME = '옥성우';

--2.STUDENT 테이블에서 키가 NULL인 레코드의 키 값을 175로 변경
UPDATE STUDENT
SET
    STU_HEIGHT = 175
WHERE STU_HEIGHT IS NULL;

--3.STUDENT 테이블에서 몸무게가 50이하인 학생들의 몸무게를 1증가
UPDATE STUDENT
SET 
    STU_WEIGHT = STU_WEIGHT+1
WHERE STU_WEIGHT <= 50; 
