CREATE TABLE ex2_1 (
COLUMN1 CHAR(10),
COLUMN2 VARCHAR2(10),
COLUMN3 NVARCHAR2(10),
COLUMN4 NUMBER
);

INSERT INTO ex2_1 (column1, column2) VALUES ('abc', 'abc');

SELECT column1, LENGTH(column1) as len1,
       column2, LENGTH(column2) as len2
 FROM ex2_1;
 
 CREATE TABLE ex2_2(
    COLUMN1 VARCHAR2(3),
    COLUMN2 VARCHAR2(3 byte),
    COLUMN3 VARCHAR2(3 char)
);

INSERT INTO ex2_2 VALUES('abc', 'abc', 'abc');

SELECT column1, LENGTH(column1) AS len1,
       column2, LENGTH(column1) AS len2,
       column3, LENGTH(column1) AS len3
FROM ex2_2;

INSERT INTO ex2_2  (column3) VALUES('ȫ�浿');
       
 SELECT column3, LENGTH(column3) AS len3, LENGTHB(column3) AS bytelen
 FROM ex2_2;

CREATE TABLE ex2_3(
COL_INT INTEGER,
COL_DEC DECIMAL,
COL_NUM NUMBER
);

SELECT column_id, column_name, data_type, data_length
    FROM user_tab_cols
    WHERE table_name = 'EX2_3'
    ORDER BY column_id;

CREATE TABLE EX2_4(
    COL_FLOT1 FLOAT(32),
    COL_FLOT2 FLOAT
);

INSERT INTO ex2_4 (col_flot1, col_flot2) VALUES (1234567891234, 1234567891234);

CREATE TABLE EX2_5(
    COL_DATE DATE,
    COL_TIMESTAMP TIMESTAMP
);

INSERT INTO EX2_5 VALUES (SYSDATE, SYSTIMESTAMP);

SELECT *
FROM EX2_5;


CREATE TABLE EX2_6(
    COL_NULL VARCHAR2(10),
    COL_NOT_NULL VARCHAR2(10) NOT NULL
);

INSERT INTO EX2_6 VALUES ('AA','BB');

SELECT constraint_name, constraint_type, table_name, search_condition
FROM user_constraints
WHERE table_name = 'EX2_6';

CREATE TABLE ex2_7 (
    COL_UNIQUE_NULL     VARCHAR2(10) UNIQUE,
    COL_UNIQUE_NNULL    VARCHAR2(10) UNIQUE NOT NULL,
    COL_UNIQUE          VARCHAR2(10),
    CONSTRAINTS unique_nm1 UNIQUE (COL_UNIQUE)
);

SELECT constraint_name, constraint_type, table_name, search_condition
 FROM user_constraints
 WHERE table_name = 'EX2_7';
 
INSERT INTO ex2_7 VALUES('AA', 'AA', 'AA');

INSERT INTO ex2_7 VALUES('AA', 'AA', 'AA');

INSERT INTO ex2_7 VALUES('BB', 'BB', 'BB');

INSERT INTO ex2_7 VALUES('', 'CC', 'CC');

INSERT INTO ex2_7 VALUES('DD', 'DD', 'DD');

CREATE TABLE ex2_8(
    COL1 VARCHAR2(10) PRIMARY KEY,
    COL2 VARCHAR2(10)
);

SELECT constraint_name, constraint_type, table_name, search_condition
FROM user_constraints
WHERE table_name = 'EX2_8';
 
 INSERT INTO ex2_8 VALUES('','AA');
 
 INSERT INTO ex2_8 VALUES('AA','AA');
