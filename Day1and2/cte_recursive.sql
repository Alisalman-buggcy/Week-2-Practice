WITH RECURSIVE emp_tree AS (
    SELECT
        id,
        name,
        manager_id,
        1 AS level
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT
        e.id,
        e.name,
        e.manager_id,
        et.level + 1
    FROM employees e
    JOIN emp_tree et
        ON e.manager_id = et.id
)
SELECT * FROM emp_tree;