-- DELIVERABLE 1
-- Number of Retiring Employees by Title

-- Select table to see fields
SELECT * FROM titles;

-- Number of Retiring Employees by Title

SELECT e.emp_no,
    e.first_name,
    e.last_name,
	t.title,
    t.from_date,
    t.to_date
INTO retirement_titles
FROM employees as e
JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

SELECT * FROM retirement_titles;

-- Remove duplicates from retirement_titles (people switched title over the years)
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
    rt.first_name,
    rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles;

-- Retrieve the number of employees by their most recent job
SELECT title, COUNT(emp_no) AS "# employees"
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY "# employees" DESC;

SELECT * FROM retiring_titles;

-- DELIVERABLE  2
-- Create Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program.

-- Review existing tables
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM titles;

-- Drop table to re run code
-- DROP TABLE  mentorship_eligibilty;

-- Create new table with mentor eligibility

SELECT DISTINCT ON (e.emp_no) e.emp_no,
    e.first_name,
    e.last_name,
	e.birth_date,
    de.from_date,
    de.to_date,
    t.title
INTO mentorship_eligibilty
FROM employees as e
JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') AND (t.to_date = '9999-01-01')
ORDER BY emp_no;

SELECT * FROM mentorship_eligibilty;


