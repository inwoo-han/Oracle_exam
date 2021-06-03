CREATE TABLE orders(
ORDER_ID NUMBER(12,0) PRIMARY KEY,
ORDER_DATE DATE,
ORDER_MODE VARCHAR2(8) CONSTRAINT ORDER_MODE_CHECK CHECK(ORDER_MODE IN ('direct','online')),
CUSTOMER_ID NUMBER(6,0),
ORDER_STATUS NUMBER(2,0),
ORDER_TOTAL NUMBER(8,2) DEFAULT 0,
SALES_REP_ID NUMBER(6,0),
PROMOTION_ID NUMBER(6,0));

CREATE TABLE order_items(
ORDER_ID NUMBER(12,0),
LINE_ITEM_ID NUMBER(3,0), 
PRODUCT_ID NUMBER(3,0),
UNIT_PRICE NUMBER(8,2) DEFAULT 0,
QUANTITY NUMBER(8,0) DEFAULT 0,


CONSTRAINT ORDER_ITEMS_PK PRIMARY KEY (ORDER_ID, LINE_ITEM_ID)
);

CREATE TABLE PROMOTIONS(
PROMO_ID NUMBER(6,0) PRIMARY KEY,
PROMO_NAME VARCHAR2(20)
);

CREATE TABLE ex3_1(
col1 VARCHAR2(10),
col2 NUMBER,
col3 DATE);

INSERT INTO ex3_1 VALUES ('ABC',10,SYSDATE);
INSERT INTO ex3_1(col3, col1, col2) VALUES (SYSDATE, 'DEF', 20);
INSERT INTO ex3_1(col1, col2) VALUES ('GHI', 20);\

CREATE TABLE ex3_2(
emp_id NUMBER,
emp_name VARCHAR2(100));

INSERT INTO ex3_2(emp_id, emp_name)
SELECT employee_id, emp_name
FROM employees
WHERE salary > 5000;

SELECT * FROM ex3_1;

UPDATE ex3_1 SET col2=50;

SELECT * FROM ex3_1;

UPDATE ex3_1 SET col3=SYSDATE WHERE col3 = '';
UPDATE ex3_1 SET col3=SYSDATE WHERE col3 IS NULL;

SELECT * FROM ex3_1;

CREATE TABLE ex3_3(
employee_id NUMBER,
bonus_amt NUMBER DEFAULT 0
);

INSERT INTO ex3_3 (employee_id)
SELECT e.employee_id
FROM employees e, sales s
WHERE e.employee_id = s.employee_id
AND s.SALES_MONTH BETWEEN '200010' AND '200012'
GROUP BY e.employee_id;

SELECT *
    FROM ex3_3
ORDER BY employee_id;



SELECT employee_id, manager_id, salary, salary * 0.01
    FROM employees
WHERE employee_id IN (SELECT employee_id FROM ex3_3);



SELECT employee_id, manager_id, salary, salary *0.001
    FROM employees
WHERE employee_id NOT IN (SELECT employee_id FROM ex3_3)
     AND manager_id = 146;

MERGE INTO ex3_3 d
     USING (SELECT employee_id, salary, manager_id
                    FROM employees
                    WHERE manager_id = 146) b
                ON (d.employee_id = b.employee_id)
        WHEN MATCHED THEN
            UPDATE SET d.bonus_amt = d.bonus_amt + b.salary * 0.01
            DELETE WHERE (b.employee_id = 161)
        WHEN NOT MATCHED THEN
            INSERT (d.employee_id, d.bonus_amt) VALUES (b.employee_id, b.salary *0.001)
            WHERE (b.salary < 8000);
            

SELECT *
    FROM ex3_3
 ORDER BY EMPLOYEE_ID;

DROP TABLE ex3_3;

DELETE ex3_3;

SELECT * FROM ex3_3 ORDER BY employee_id;

SELECT partition_name
FROM user_tab_partitions
WHERE table_name='SALES';

CREATE TABLE ex3_4(
employee_id NUMBER);

INSERT INTO ex3_4 VALUES (100);

SELECT * FROM ex3_4;

COMMIT;

TRUNCATE TABLE ex3_4;

SELECT ROWNUM, employee_id
FROM employees;

SELECT ROWNUM, employee_id, ROWID
FROM employees
WHERE ROWNUM < 5;

SELECT employee_id, salary,
    CASE WHEN salary <= 5000 THEN 'C등급'
        WHEN salary > 5000 AND salary <= 15000 THEN 'B등급'
        ELSE 'A등급'
    END AS salary_grade
FROM employees;


SELECT employee_id, salary
FROM employees
WHERE salary = ANY(2000, 3000, 4000) AND employee_id = 192
ORDER BY employee_id;

SELECT employee_id, salary
FROM employees
WHERE salary = 2000
    OR salary = 3000
    OR salary = 4000
ORDER BY employee_id;

SELECT employee_id, salary
FROM employees
WHERE salary = ALL(2000, 3000, 4000)
ORDER BY employee_id;

SELECT employee_id, salary
FROM employees
WHERE salary = SOME(2000, 3000, 4000)
ORDER BY employee_id;


SELECT department_id, department_name
FROM departments a
WHERE EXISTS ( SELECT *
                FROM employees b
                WHERE a.department_id = b.department_id
                AND b.salary > 3000)
ORDER BY a.department_name;


CREATE TABLE ex3_5(
names VARCHAR2(30)
);

INSERT INTO ex3_5 VALUES ('홍길동');
INSERT INTO ex3_5 VALUES ('홍길용');
INSERT INTO ex3_5 VALUES ('홍길상');
INSERT INTO ex3_5 VALUES ('홍길상동');
INSERT INTO ex3_5 VALUES ('홍길리');
INSERT INTO ex3_5 VALUES ('홍리');

SELECT * 
FROM ex3_5
WHERE names LIKE '%상%';

