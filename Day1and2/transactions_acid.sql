

SELECT * FROM employees;


-- BEGIN + COMMIT


BEGIN;

UPDATE employees
SET salary = salary + 5000
WHERE id = 1;

UPDATE employees
SET salary = salary + 3000
WHERE id = 2;

COMMIT;


-- BEGIN + ROLLBACK


BEGIN;

UPDATE employees
SET salary = salary - 10000
WHERE id = 1;

ROLLBACK;


-- SAVEPOINT


BEGIN;

UPDATE employees
SET salary = salary + 1000
WHERE id = 1;

SAVEPOINT first_update;

UPDATE employees
SET salary = salary + 2000
WHERE id = 2;

ROLLBACK TO first_update;

COMMIT;



SELECT * FROM employees;