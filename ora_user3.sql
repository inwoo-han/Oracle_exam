select abs(10), abs(-10), abs(-10.123) -- 절대값
from dual;

select CEIL(10.123), CEIL(10.541), CEIL(11.001) -- 올림
FROM dual;

select FLOOR(10.123), FLOOR(10.541), FLOOR(11.001) -- 버림
FROM dual;

SELECT ROUND(10.154), ROUND(10.541), ROUND(11.001)  -- 반올림
FROM dual;

SELECT ROUND(10.154, 1), ROUND(10.541, 2), ROUND(11.001, 3)  -- 반올림
FROM dual;

SELECT ROUND(0, 3), ROUND(115.155, -1), ROUND(115.155, -2)  -- 반올림
FROM dual;

SELECT TRUNC(115.155), TRUNC(115.155, 1), TRUNC(115.155, 2), TRUNC(115.155, -2)  -- 잘라냄(버림)
FROM dual;

SELECT POWER(3, 2), POWER(3, 3), POWER(3, 3.0001)  -- 제곱  앞의 수가 음수이면 뒤의 수는 정수만 올수있음.
FROM dual;

SELECT SQRT(2), SQRT(5) -- 제곱근
FROM daul;

SELECT MOD(19,4), MOD(19.123, 4.2) -- 나머지(n2-n1*floor(n2/n1)
FROM dual;

SELECT REMAINDER(19,4), REMAINDER(19.123, 4.2) -- 나머지 (n2-n1*round(n2/n1)
FROM dual;

SELECT EXP(2), LN(2.713), LOG(10, 100) -- EXP-> 지수함수 e의 n제곱 값 반환, LN -> 자연 로그함수로 밑수가 e인 로그함수, LOG는 n2를 밑수로하는 n1의 로그값 반환
FROM dual;

SELECT LOG(10,1000)
FROM dual;


SELECT INITCAP('never say goodbye'), INITCAP('never6say*good가bye') -- 첫자 대문자
FROM dual;

SELECT LOWER('NEVER SAY GOODBYE'), UPPER('never say goodbye') -- 대, 소문자 변환
FROM dual;

SELECT CONCAT('I HAVE', 'A DREAM'), 'I HAVE' || 'A DREAM' -- 문자 붙이기
FROM dual;


SELECT SUBSTR('ABCDEFG', 1, 4), SUBSTR('ABCDEFG', -1, 4) -- 문자 잘라내기, SUBSTRB는 문자개수가 아닌 바이트 개수로 반환
FROM dual;

SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD')
FROM dual;

SELECT TO_DATE('20140101', 'YYYY-MM-DD')
FROM dual;

SELECT TO_DATE('20140101')
FROM dual;

SELECT TO_TIMESTAMP('20140101 13:44:50', 'YYYY-MM-DD HH24:MI:SS')
FROM dual;

SELECT TO_TIMESTAMP('20140101', 'YYYY-MM-DD')
FROM dual;

SELECT TO_TIMESTAMP('20140101')
FROM dual;


SELECT NVL(manager_id, employee_id)
FROM employees
WHERE manager_id IS NULL;

SELECT employee_id, 
    NVL2(commission_pct, salary + (salary * commission_pct), salary) AS salary2
FROM employees;


SELECT employee_id, LPAD(SUBSTR(phone_number, 5), 12, '(02)')
FROM employees;

SELECT employee_id, emp_name, hire_date, TRUNC((sysdate-hire_date)/365) as Years_of_service
FROM employees
WHERE ((sysdate-hire_date)/365) >= 10
ORDER BY Years_of_service;


SELECT REPLACE(cust_main_phone_number,'-','/')
FROM customers;

SELECT cust_main_phone_number
FROM customers;


SELECT CUST_NAME, CUST_YEAR_OF_BIRTH, 
        DECODE((TO_CHAR(SYSDATE, 'YYYY') - CUST_YEAR_OF_BIRTH) / 10, 3,'30대',
                                                                    4, '40대',
                                                                    5, '50대','기타')generation
FROM customers;
