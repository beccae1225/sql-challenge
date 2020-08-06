-- List following details of employees: employee number, last name, first name, sex, and salary
SELECT employees.emp_no,
  employees.last_name,
  employees.first_name,
  employees.sex,
  salaries.salary
FROM employees
JOIN salaries 
ON employees.emp_no = salaries.emp_no;


--List FN, LN, and Hire date for employees hired in 1986
SELECT employees.first_name, 
	employees.last_name,
	employees.hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';


--List manager of each dept with: dept_no, dept_name, emp_no, LN, FN
SELECT departments.dept_no,
	departments.dept_name,
	dept_man.emp_no,
	employees.last_name,
	employees.first_name
FROM departments
INNER JOIN dept_man ON dept_man.dept_no = departments.dept_no
INNER JOIN employees ON dept_man.emp_no = employees.emp_no;


--List dept of each emp with: emp_no, LN, FN, dept_name
SELECT dept_emp.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no;


--List FN, LN, and sex for employees whose first name is "Hercules" and last name begins with B
SELECT employees.first_name,
	employees.last_name,
	employees.sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


--List all employees in Sales with emp_no, LN, FN, and dept_name
SELECT dept_emp.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales';


--List all employees in Sales and Development with emp_no, LN, FN, and dept_name
SELECT dept_emp.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';


--In descending order, list frequency count of employees LN
SELECT last_name, COUNT(last_name) AS "last name count" 
FROM employees
GROUP BY last_name
ORDER BY "last name count" DESC;

--EPILOGUE
SELECT * FROM employees 
WHERE emp_no = '499942'
