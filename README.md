# Employee Management System Database

A comprehensive SQL repository showcasing relational database schema design, data manipulation, and advanced analytical queries for an enterprise Employee Management System.

---

## 📌 Project Overview
This project contains production-ready SQL scripts for managing organizational structures, tracking employee details, mapping departmental distributions, and analyzing geographical payroll metrics. It ranges from basic CRUD operations to complex data analysis using window functions and advanced joins.

---

## 🏗️ Database Schema

### Table Modifications & Initialization
- **Database Context**: Targets the `employee` database workload.
- **Structural Upgrades**: Automatic renaming migrations to transition legacy data pipelines (`departments_info` renamed to `department`) into modern standardized naming conventions.

### Core Entity-Relationship Layout
The central architecture revolves around an optimized `Employee` data table featuring strict constraints to maintain data integrity (e.g., age validation check constraints, precision-scaled currency definitions, and relational foreign keys mapped to corporate locations and departments).

---

## 🔍 SQL Queries Portfolio

### 1. Basic Data Selection & Filtering
* **Unique Salaries**: Fetch distinct salary tiers within the organization.
* **Salary Ranking**: Retrieve unique compensation structures ordered dynamically from highest to lowest.
* **Historical Hiring Window**: Iso-filter and track the first 5 employee onboarding records logged within the 2018 calendar year.

### 2. Aggregations & Metrics
* **Department Payroll**: Calculate cumulative budget allocations targeting specific business units (e.g., 'Finance').
* **Demographics**: Find the minimum age boundary within the active workforce.
* **Geographical Compensation**: Identify and sort maximum salary metrics grouped by corporate regional offices.

### 3. Advanced Relational Joins
* **Inner Join**: Fetch explicit cross-references connecting employees directly to their managed departments.
* **Left Join**: Compile high-level headcount summaries across all organizational branches—including understaffed environments.
* **Right Join (Geographical Mapping)**: Audit regional real estate maps against employee occupancy to identify vacant operational spaces.
* **Cross Join**: Produce a complete cartesian matrix matching every department configuration with all geographic locations.
* **Self Join**: Match pairs of separate employees working collaboratively inside identical department IDs.

### 4. Grouping & HAVING Clauses
* **Understaffed Departments**: Apply aggregate conditional filtering to surface specific teams containing fewer than 3 registered employees.

### 5. Analytical Window Functions
* **Global Salary Ranking**: Compute a non-dense global sequence ranking employee pay across the whole enterprise.
* **Departmental Ranking**: Partition employees by internal department IDs and apply `DENSE_RANK()` calculations over localized salary distributions.

### 6. Data Modifications (DML)
* **Bulk Data Inserts**: Populate spatial tables (`Locations`) with regional geographic endpoints.
* **Safe Updates**: Systematically locate unassigned career designations (`NULL`) and backfill profiles to a baseline default track under safe execution controls.

---

## 🛠️ How to Use
1. Clone this repository to your local environment.
2. Spin up a running MySQL instance (v8.0+ recommended).
3. Execute the full `schema.sql` script to deploy tables, run seed injections, and review performance analytics workloads.
