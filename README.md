# SQL-LEARNING-PRACTISE
/*
====================================================================
FILE NAME: ass.2 script sql.sql
DESCRIPTION: Database schema design, DML operations, and advanced 
             analytical queries for an Employee Management System.
====================================================================
*/

-- -----------------------------------------------------------------
-- 1. DATABASE INITIALIZATION & SCHEMA DEFINITION
-- -----------------------------------------------------------------

-- Switch to the employee database
USE employee;[cite: 1]

-- Standardize legacy table naming conventions
ALTER TABLE departments_info RENAME TO department;[cite: 1]

-- Create the foundational Employee table
CREATE TABLE Employee (
    employee_id INT NOT NULL AUTO_INCREMENT,
    employee_name VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    age INT CHECK (age >= 18), -- Ensures legal working age compliance
    hire_date DATE NOT NULL,
    designation VARCHAR(50),
    salary DECIMAL(15, 2),     -- Precise data type recommended for currency
    department_id INT,
    location_id INT,
    PRIMARY KEY (employee_id),
    FOREIGN KEY (department_id) REFERENCES Department(department_id),
    FOREIGN KEY (location_id) REFERENCES Locations(location_id)
);[cite: 1]


-- -----------------------------------------------------------------
-- 2. DATA POPULATION (DML)
-- -----------------------------------------------------------------

-- Populate operational locations
INSERT INTO Locations (location_name) 
VALUES 
    ('Mumbai'), 
    ('Delhi'), 
    ('Calcutta'),
    ('Tamilnadu'),
    ('kerala');[cite: 1]


-- -----------------------------------------------------------------
-- 3. DATA SELECTION, SORTING & FILTERING
-- -----------------------------------------------------------------

-- Fetch a complete roster view
SELECT * FROM employee;[cite: 1]

-- View distinct salary tiers across the organization
SELECT DISTINCT salary 
FROM Employee;[cite: 1]

-- View specific employee demographics
SELECT 
    age AS Employee_Age, 
    salary AS Employee_Salary
FROM Employee;[cite: 1]

-- Display a unique list of salaries ranked from highest to lowest
SELECT DISTINCT salary AS Employee_Salary
FROM Employee
ORDER BY Employee_Salary DESC;[cite: 1]

-- Retrieve the first 5 employees hired during the calendar year 2018
SELECT * FROM Employee
WHERE hire_date BETWEEN '2018-01-01' AND '2018-12-31'
ORDER BY hire_date ASC
LIMIT 5;[cite: 1]

-- Conditional salary criteria verification
SELECT * 
FROM Employee
WHERE salary > 50000 
  AND hire_date;[cite: 1]


-- -----------------------------------------------------------------
-- 4. AGGREGATIONS & GROUPING
-- -----------------------------------------------------------------

-- Calculate the total financial payroll footprint
SELECT SUM(salary) AS total_finance_payroll
FROM Employee e
JOIN Department d ON e.department_id = d.department_id
WHERE d.department_name = 'Finance';[cite: 1]

-- Determine the youngest age within the workforce
SELECT MIN(age) AS youngest_employee_age
FROM Employee;[cite: 1]

-- Analyze highest compensation tiers grouped by geographic location
SELECT 
    l.location_name, 
    MAX(e.salary) AS highest_salary
FROM Employee e
JOIN Locations l ON e.location_id = l.location_id
GROUP BY l.location_name
ORDER BY highest_salary DESC;[cite: 1]

-- Identify understaffed teams containing fewer than 3 employees
SELECT 
    d.department_name, 
    COUNT(e.employee_id) AS total_employees
FROM Department d
LEFT JOIN Employee e ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING COUNT(e.employee_id) < 3;[cite: 1]

-- Target metrics for specific demographics by office region
SELECT 
    l.location_name, 
    AVG(e.age) AS average_female_age
FROM Employee e
JOIN Locations l ON e.location_id = l.location_id
WHERE e.gender = '30';[cite: 1]


-- -----------------------------------------------------------------
-- 5. ADVANCED RELATIONAL JOINS
-- -----------------------------------------------------------------

-- Inner Join: Map employees explicitly to their respective departments
SELECT 
    e.employee_name, 
    e.designation, 
    d.department_name
FROM Employee e
INNER JOIN Department d ON e.department_id = d.department_id;[cite: 1]

-- Left Join: Headcount summary across all established departments
SELECT 
    d.department_name, 
    COUNT(e.employee_id) AS total_employee
FROM Department d
LEFT JOIN Employee e ON d.department_id = e.department_id
GROUP BY d.department_name;[cite: 1]

-- Right Join: Ensure all regional locations are audited regardless of occupancy
SELECT 
    l.location_name, 
    e.employee_name
FROM Employee e
RIGHT JOIN Locations l ON e.location_id = l.location_id;[cite: 1]

-- Cross Join: Matrix distribution of departments per physical office
SELECT 
    d.department_name, 
    l.location_name
FROM Department d
CROSS JOIN Locations l;[cite: 1]

-- Self Join: Pair up distinct peers sharing matching department boundaries
SELECT 
    e1.employee_name AS Employee_A, 
    e2.employee_name AS Employee_B, 
    e1.department_id
FROM Employee e1
INNER JOIN Employee e2 ON e1.department_id = e2.department_id
WHERE e1.employee_id < e2.employee_id;[cite: 1]


-- -----------------------------------------------------------------
-- 6. ANALYTICAL WINDOW FUNCTIONS
-- -----------------------------------------------------------------

-- Rank the complete workforce globally by compensation
SELECT 
    employee_name, 
    salary,
    RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM Employee;[cite: 1]

-- Dense-rank employee salaries isolated within each department partition
SELECT 
    department_id,
    employee_name, 
    salary,
    DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS dept_salary_rank
FROM Employee;[cite: 1]


-- -----------------------------------------------------------------
-- 7. CONDITIONAL DATA MODIFICATIONS
-- -----------------------------------------------------------------

-- Disable safe updates to execute blanket profile adjustments
SET SQL_SAFE_UPDATES = 0;[cite: 1]

-- Standardize missing assignments into a core track
UPDATE Employee
SET designation = 'Data Scientist'
WHERE designation IS NULL;[cite: 1]

-- Re-enable safe updates (Best practice baseline configuration)
SET SQL_SAFE_UPDATES = 1;
