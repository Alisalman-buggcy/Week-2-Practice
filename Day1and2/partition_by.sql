


SELECT
    name,
    department,
    salary,
    ROW_NUMBER()
    OVER(
        PARTITION BY department
        ORDER BY salary DESC
    ) AS dept_rank
FROM employees;



SELECT
    name,
    department,
    salary,
    SUM(salary)
    OVER(
        PARTITION BY department
        ORDER BY salary
    ) AS department_running_total
FROM employees;