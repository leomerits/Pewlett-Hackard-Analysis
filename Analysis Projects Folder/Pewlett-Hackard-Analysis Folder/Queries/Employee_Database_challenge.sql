-- Use Dictinct with Orderby to remove duplicate rows
-- The Number Of Retiring Employees by Titile
SELECT em.emp_no,
		em.first_name,
		em.last_name,
			ti.title,
		ti.from_date,
		ti.to_date,
		INTO retiring_emp_by_title
		FROM employees AS em
		LEFT JOIN titles as ti
		ON (em.emp_no = ti.emp_no)
		WHERE (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
		ORDER BY em.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO nameyourtable
FROM retiring_emp_by_title
ORDER BY emp_no ASC, to_date DESC;


-- Retrieve The Number of Employees By Their Most Recent Job Title Who Are About to Retire
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP By title
ORDER BY COUNT(title) DESC;


-- Query to Create a Mentorship Eligibility Table that Holds the Employees Who Are Eligible to Participate in A Mentorship Program
SELECT DISTINCT ON (em.emp_no) em.emp_no, em.first_name, em.last_name,
em.birth_date, de.from_date, de.to_date, ti.title
INTO mentorship_eligible
FROM employees AS em
LEFT JOIN department_employees AS de
ON em.emp_no = de.emp_no
LEFT JOIN titles AS ti
ON em.emp_no = ti.emp_no
WHERE (em.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY em.emp_no;

















