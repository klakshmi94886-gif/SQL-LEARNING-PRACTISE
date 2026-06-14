use employee;
alter table departments_info rename to department;
CREATE TABLE Employee (
    employee_id INT NOT NULL AUTO_INCREMENT,
    employee_name VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    age INT CHECK (age >= 18), -- Optional: ensures legal working age
    hire_date DATE NOT NULL,
    designation VARCHAR(50),
    salary DECIMAL(15, 2), -- More precise for currency than FLOAT
    department_id INT,
    location_id INT,
    PRIMARY KEY (employee_id),
    FOREIGN KEY (department_id) REFERENCES Department(department_id),
    FOREIGN KEY (location_id) REFERENCES Locations(location_id)
);
SELECT DISTINCT salary 
FROM Employee;
SELECT 
    age AS Employee_Age, 
    salary AS Employee_Salary
FROM Employee;
SELECT DISTINCT salary AS Employee_Salary
FROM Employee
ORDER BY Employee_Salary DESC;

SELECT * FROM Employee
WHERE hire_date01 BETWEEN '2018-01-01' AND '2018-12-31'
ORDER BY hire_date ASC
LIMIT 5;
SELECT SUM(salary) AS total_finance_payroll
FROM Employee e
JOIN Department d ON e.department_id = d.department_id
WHERE d.department_name = 'Finance';
SELECT MIN(age) AS youngest_employee_age
FROM Employees;
select * from employee;
SELECT MIN(age) AS youngest_employee_age
FROM Employee;

INSERT INTO Locations (location_name) 
VALUES 
('Mumbai'), 
('Delhi'), 
('Calcutta'),
('Tamilnadu'),
('kerala');
SELECT 
    l.location_name, 
    MAX(e.salary) AS highest_salary
FROM Employee e
JOIN Locations l ON e.location_id = l.location_id
GROUP BY l.location_name;
SELECT l.location_name, MAX(e.salary) AS highest_salary
FROM Employee e
JOIN Locations l ON e.location_id = l.location_id
GROUP BY l.location_name
ORDER BY highest_salary DESC;
SELECT 
    d.department_name, 
    COUNT(e.employee_id) AS total_employees
FROM Department d
LEFT JOIN Employee e ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING COUNT(e.employee_id) < 3;
SELECT 
    l.location_name, 
    AVG(e.age) AS average_female_age
FROM Employee e
JOIN Locations l ON e.location_id = l.location_id
WHERE e.gender = '30';
SELECT 
    e.employee_name, 
    e.designation, 
    d.department_name
FROM Employee e
INNER JOIN Department d ON e.department_id = d.department_id;
SELECT 
    d.department_name, 
    COUNT(e.employee_id) AS total_employee
FROM Department d
LEFT JOIN Employee e ON d.department_id = e.department_id
GROUP BY d.department_name;
SELECT 
    l.location_name, 
    e.employee_name
FROM Employee e
RIGHT JOIN Locations l ON e.location_id = l.location_id;

SELECT 
    d.department_name, 
    l.location_name
FROM Department d
CROSS JOIN Locations l;

SELECT 
    e1.employee_name AS Employee_A, 
    e2.employee_name AS Employee_B, 
    e1.department_id
FROM Employee e1
INNER JOIN Employee e2 ON e1.department_id = e2.department_id
WHERE e1.employee_id < e2.employee_id;
SELECT 
    employee_name, 
    salary,
    RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM Employee;
SELECT 
    department_id,
    employee_name, 
    salary,
    DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS dept_salary_rank
FROM Employee;
SELECT 
    department_id,
    employee_name, 
    salary,
    DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS dept_salary_rank
FROM Employee;
SELECT * 
FROM Employee
WHERE salary > 50000 
  AND hire_date ;

  select * FROM employee;
 

SET SQL_SAFE_UPDATES = 0;
  UPDATE Employee
SET designation = 'Data Scientist'
WHERE designation IS NULL;
SELECT * FROM employee;