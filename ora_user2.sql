CREATE TABLE ex3_6(
employee_id NUMBER,
emp_name VARCHAR2(80),
salary NUMBER(8,2),
manager_id NUMBER
);


INSERT INTO ex3_6(employee_id, emp_name, salary, manager_id)
SELECT e.employee_id, e.emp_name, e.salary, e.manager_id
FROM employees e
WHERE e.manager_id = 124 
AND e.salary BETWEEN 2000 AND 3000
ORDER BY employee_id;


MERGE INTO ex3_3 a
    USING (SELECT employee_id, salary, manager_id
            FROM employees
            WHERE manager_id = 145) b
            ON (a.employee_id = b.employee_id)
    WHEN MATCHED THEN
        UPDATE SET a.bonus_amt = a.bonus_amt + b.salary * 0.01
    WHEN NOT MATCHED THEN
        INSERT (a.employee_id, a.bonus_amt) VALUES (b.employee_id, b.salary * 0.005);
        
        
        
SELECT employee_id, emp_name
FROM employees
WHERE commission_pct IS NULL
ORDER BY employee_id;


SELECT employee_id, salary
FROM employees
WHERE salary >= 2000
AND salary <= 2500
ORDER BY employee_id;


SELECT employee_id, salary
FROM employees
WHERE salary IN (2000, 3000, 4000)
ORDER BY employee_id;

SELECT employee_id, salary
FROM employees
WHERE salary = ANY(2000, 3000, 4000)
ORDER BY employee_id;

SELECT employee_id, salary
FROM employees
WHERE salary NOT IN (2000, 3000, 4000)
ORDER BY employee_id;

SELECT employee_id, salary
FROM employees
WHERE salary <> ALL(2000, 3000, 4000) -- =salary<>2000 AND salary<>3000 AND salary<>4000
ORDER BY employee_id;



