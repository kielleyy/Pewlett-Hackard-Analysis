-- Creating deliverable 1 for Module 7 challenge
-- List of employees, and count, retiring - grouped by title

-- Retrieve the emp_no, first_name, and last_name columns from the Employees table.
-- Retrieve the title, from_date, and to_date columns from the Titles table.
-- Create a new table using the INTO clause.
-- Join both tables on the primary key.
-- Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then, order by the employee number.


-- Employees retiring with titles
-- I added a second join with dept_emp and a second where and statement to make sure that the employee is still at the company
SELECT e.emp_no,
e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date
INTO retirement_titles
FROM employees as e
LEFT JOIN titles as t
ON e.emp_no = t.emp_no
LEFT JOIN dept_emp as de
ON e.emp_no = de.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;

-- Use Dictinct on with Orderby to remove duplicate rows
-- distinct based on employee number with the to_date defining that it be the most recent title
-- I added a second join with dept_emp and a second where and statement to make sure that the employee is still at the company 
SELECT DISTINCT ON (e.emp_no) 
e.emp_no,
e.first_name,
e.last_name,
ti.title,
ti.from_date,
ti.to_date
INTO retirement_unique_titles
FROM employees as e
LEFT JOIN titles as ti
ON e.emp_no = ti.emp_no
LEFT JOIN dept_emp as de
ON e.emp_no = de.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no, ti.to_date DESC;

-- Retiring employees counted by title
-- First, retrieve the number of titles from the Unique Titles table.
-- Then, create a Retiring Titles table to hold the required information.
-- Group the table by title, then sort the count column in descending order.

SELECT COUNT(title), title
INTO retiring_titles
FROM retirement_unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

-- deliverable number 2
-- Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
-- Retrieve the from_date and to_date columns from the Department Employee table.
-- Retrieve the title column from the Titles table.
-- Use a DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
-- Create a new table using the INTO clause.
-- Join the Employees and the Department Employee tables on the primary key.
-- Join the Employees and the Titles tables on the primary key.
-- Filter the data on the to_date column to get current employees whose birth dates are between January 1, 1965 and December 31, 1965.
-- Order the table by the employee number.
SELECT DISTINCT ON (e.emp_no) 
e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title
INTO mentorship_eligibility
FROM employees as e
LEFT JOIN titles as ti
ON e.emp_no = ti.emp_no
LEFT JOIN dept_emp as de
ON e.emp_no = de.emp_no
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no, ti.to_date DESC;

-- Additional query and tables to count and sort retiring employees by department
-- Employee count by department number
SELECT COUNT(rut.emp_no), de.dept_no
INTO dept_retiree_counts
FROM retirement_unique_titles as rut
LEFT JOIN dept_emp as de
ON rut.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

-- Employee count by department name
SELECT drc.count, d.dept_name
INTO deptnames_retiree_counts
FROM dept_retiree_counts as drc
INNER JOIN departments as d
ON drc.dept_no = d.dept_no;