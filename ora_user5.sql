SELECT department_id, SUM(salary)
FROM employees
GROUP BY department_id
ORDER BY department_id;


SELECT period, region, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY period, region
ORDER BY period, region;


SELECT period, region, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE period = '201311'
GROUP BY region
ORDER BY region; -- 오류남. period도 추가해야한다.


SELECT period, region, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE period = '201311'
GROUP BY period, region
ORDER BY period, region;


SELECT period, region, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE period = '201310'
GROUP BY period, region
HAVING SUM(loan_jan_amt)<20000
ORDER BY totl_jan;


SELECT period, gubun, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY ROLLUP(period, gubun);

SELECT period, gubun, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY period, ROLLUP(gubun);


SELECT period, gubun, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY CUBE(period, gubun);


-- 1. 사원테이블에서 입사년도별 사원수를 구하는 쿼리
SELECT TO_CHAR(hire_date, 'YYYY') hire_years, COUNT(hire_date)
FROM employees
GROUP BY TO_CHAR(hire_date, 'YYYY')
ORDER BY hire_years;


SELECT TO_CHAR(hire_date, 'YYYY') hire_years, COUNT(*)
FROM employees
GROUP BY TO_CHAR(hire_date, 'YYYY')
ORDER BY hire_years;

SELECT period, region, SUM(loan_jan_amt) total_amt
FROM kor_loan_status
WHERE period LIKE '2012%'
GROUP BY period, region
ORDER BY period, region;


SELECT period, SUM(loan_jan_amt) total_amt
FROM kor_loan_status
GROUP BY ROLLUP(period)
HAVING period IS NULL;



SELECT period, gubun, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY period, ROLLUP(gubun);


SELECT period, gubun, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY period, gubun
UNION
SELECT period, null, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY period, null
ORDER BY period, gubun;