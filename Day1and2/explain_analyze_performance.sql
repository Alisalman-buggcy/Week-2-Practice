

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employees (name, department, salary)
VALUES
('Ali','IT',90000),
('Ahmed','IT',80000),
('Sara','IT',85000),
('Ayesha','HR',70000),
('Bilal','HR',60000),
('Fatima','HR',50000);



EXPLAIN ANALYZE
SELECT *
FROM employees
WHERE salary = 80000;



CREATE INDEX idx_employees_salary
ON employees(salary);


EXPLAIN ANALYZE
SELECT *
FROM employees
WHERE salary = 80000;



EXPLAIN ANALYZE
SELECT *
FROM employees
WHERE salary > 60000;



EXPLAIN ANALYZE
SELECT *
FROM employees
ORDER BY salary DESC;



DROP INDEX idx_employees_salary;

EXPLAIN ANALYZE
SELECT *
FROM employees
WHERE salary = 80000;