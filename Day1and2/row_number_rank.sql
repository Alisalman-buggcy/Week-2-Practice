


SELECT
    id,
    name,
    department,
    salary,
    ROW_NUMBER() OVER(
        ORDER BY salary DESC
    ) AS row_num
FROM employees;



SELECT
    id,
    name,
    department,
    salary,
    RANK() OVER(
        ORDER BY salary DESC
    ) AS rank_no
FROM employees;