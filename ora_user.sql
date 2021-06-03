SELECT 지역,
    SUM(AMT1) AS "201111",
    SUM(AMT2) AS "201112",
    SUM(AMT3) AS "201210",
    SUM(AMT4) AS "201211",
    SUM(AMT5) AS "201212",
    SUM(AMT6) AS "201310",
    SUM(AMT7) AS "201311"
    
    

FROM (SELECT region 지역,
                        CASE WHEN period = '201111' THEN LOAN_JAN_AMT ELSE 0 END AMT1,
                        CASE WHEN period = '201112' THEN LOAN_JAN_AMT ELSE 0 END AMT2,
                        CASE WHEN period = '201210' THEN LOAN_JAN_AMT ELSE 0 END AMT3,
                        CASE WHEN period = '201211' THEN LOAN_JAN_AMT ELSE 0 END AMT4,
                        CASE WHEN period = '201212' THEN LOAN_JAN_AMT ELSE 0 END AMT5,
                        CASE WHEN period = '201310' THEN LOAN_JAN_AMT ELSE 0 END AMT6,
                        CASE WHEN period = '201311' THEN LOAN_JAN_AMT ELSE 0 END AMT7
            FROM KOR_LOAN_STATUS
                        )
GROUP BY 지역
ORDER BY 지역;

SELECT REGION,
    SUM(CASE WHEN PERIOD = '201111' THEN LOAN_JAN_AMT ELSE 0 END) "11년 11월",
    SUM(CASE WHEN PERIOD = '201112' THEN LOAN_JAN_AMT ELSE 0 END) "11년 12월",
    SUM(CASE WHEN PERIOD = '201210' THEN LOAN_JAN_AMT ELSE 0 END) "12년 10월",
    SUM(CASE WHEN PERIOD = '201211' THEN LOAN_JAN_AMT ELSE 0 END) "12년 11월",
    SUM(CASE WHEN PERIOD = '201212' THEN LOAN_JAN_AMT ELSE 0 END) "12년 12월",
    SUM(CASE WHEN PERIOD = '201310' THEN LOAN_JAN_AMT ELSE 0 END) "13년 10월",
    SUM(CASE WHEN PERIOD = '201311' THEN LOAN_JAN_AMT ELSE 0 END) "13년 11월"
FROM KOR_LOAN_STATUS
GROUP BY REGION;


select region 지역,
sum(case when period = '201111' then loan_jan_amt else 0 end) "201111",
sum(case when period = '201112' then loan_jan_amt else 0 end) "201112",
sum(case when period = '201210' then loan_jan_amt else 0 end) "201210",
sum(case when period = '201211' then loan_jan_amt else 0 end) "201211",
sum(case when period = '201212' then loan_jan_amt else 0 end) "201212",
sum(case when period = '201310' then loan_jan_amt else 0 end) "201310",
sum(case when period = '201311' then loan_jan_amt else 0 end) "201311"
from kor_loan_status
group by region;


SELECT a.employee_id, a.emp_name, a.department_id, b.department_name
FROM employees a,
departments b
WHERE a.department_id = b.department_id
ORDER BY employee_id;

SELECT department_id, department_name
FROM departments a
WHERE EXISTS ( SELECT *
                FROM employees b
                WHERE a.department_id = b.department_id
                AND b.salary > 3000)
ORDER BY a.department_id;

SELECT department_id, department_name
FROM departments;

SELECT *
                FROM departments a, employees b
                WHERE a.department_id = b.department_id;


