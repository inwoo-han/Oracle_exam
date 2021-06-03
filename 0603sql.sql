select a.employee_id, a.emp_name, b.department_id, b.department_name
FROM employees a
CROSS JOIN departments b;

CREATE TABLE HONG_A (EMP_ID INT);
CREATE TABLE HONG_B (EMP_ID INT);

INSERT INTO HONG_A VALUES(10);
INSERT INTO HONG_A VALUES(20);
INSERT INTO HONG_A VALUES(40);
INSERT INTO HONG_B VALUES(10);
INSERT INTO HONG_B VALUES(20);
INSERT INTO HONG_B VALUES(30);
COMMIT;

SELECT a.emp_id, b.emp_id
FROM hong_a a, hong_b b
WHERE a.emp_id(+) = b.emp_id(+);

SELECT a.emp_id, b.emp_id
FROM hong_a a
RIGHT JOIN hong_b b
ON (a.emp_id = b.emp_id)
UNION
SELECT a.emp_id, b.emp_id
FROM hong_a a
LEFT JOIN hong_b b
ON (a.emp_id = b.emp_id);


SELECT a.emp_id, b.emp_id
FROM hong_a a
FULL OUTER JOIN hong_b b
ON a.emp_id = b.emp_id;



SELECT COUNT(*)
FROM employees
WHERE salary >= (SELECT AVG(salary) FROM employees);

SELECT count(*)
FROM employees
WHERE department_id IN ( SELECT department_id
                        FROM departments
                        WHERE parent_id IS NULL);
                        
SELECT employee_id, emp_name ,job_id
FROM employees
WHERE (employee_id, job_id) IN (SELECT employee_id, job_id
                                FROM job_history);
                                
                                
UPDATE employees
SET salary = (SELECT AVG(salary) FROM employees);

DELETE employees
WHERE salary >= (SELECT AVG(salary) FROM employees);

ROLLBACK;

SELECT a.department_id, a.department_name
FROM departments a
WHERE EXISTS( SELECT 1 FROM job_history b
            WHERE a.department_id = b.department_id); -- 1은 EXISTS절에서 셀렉트가별도로 필요하지 않아서 쓴다?
    
    
SELECT a.employee_id,
(SELECT b.emp_name
FROM employees b
WHERE a.employee_id = b.employee_id) AS emp_name,
a.department_id,
(SELECT b.department_name
FROM departments b
WHERE a.department_id = b.department_id) AS dep_name
FROM job_history a;

--SELECT b.department_id, AVG(c.salary) as sal
--                          FROM departments b, employees c
--                          WHERE b.parent_id = 90
--                            AND b.department_id = c.department_id
--                            GROUP BY b.department_id;




UPDATE employees a
SET a.salary = (SELECT sal
                  FROM (SELECT b.department_id, AVG(c.salary) as sal
                          FROM departments b, employees c
                          WHERE b.parent_id = 90
                            AND b.department_id = c.department_id
                            GROUP BY b.department_id) d
                 WHERE a.department_id = d.department_id)
WHERE a.department_id IN (SELECT department_id
                            FROM departments
                            WHERE parent_id = 90);

SELECT department_id, MIN(salary), MAX(salary)
FROM employees a
WHERE department_id IN ( SELECT department_id
                           FROM departments
                          WHERE parent_id = 90)
GROUP BY department_id;
                            
                            
MERGE INTO employees a
USING ( SELECT b.department_id, AVG(c.salary) as sal
        FROM departments b, employees c
        WHERE b.parent_id = 90
        AND b.department_id = c.department_id
        GROUP BY b.department_id) d
ON (a.department_id = d.department_id)
WHEN MATCHED THEN
    UPDATE SET a.salary = d.sal;
    
ROLLBACK;

SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
FROM employees a, departments b, 
    (SELECT AVG(c.salary) AS avg_salary
       FROM departments b,
            employees c
      WHERE b.parent_id = 90
        AND b.department_id = c.department_id ) d
WHERE a.department_id = b.department_id
AND a.salary > d.avg_salary;