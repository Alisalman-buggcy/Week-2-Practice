DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary INTEGER,
    joining_date DATE
);

INSERT INTO employees (
    name,
    department,
    salary,
    joining_date
)
VALUES
('Ali','IT',90000,'2024-01-10'),
('Ahmed','IT',80000,'2024-02-15'),
('Sara','IT',80000,'2024-03-20'),
('Ayesha','HR',70000,'2024-01-05'),
('Bilal','HR',60000,'2024-02-01'),
('Fatima','HR',50000,'2024-04-01');