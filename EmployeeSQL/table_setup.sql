DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS dept_man CASCADE;
DROP TABLE IF EXISTS titles CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;


CREATE TABLE departments (
	dept_no VARCHAR(10) PRIMARY KEY,
	dept_name TEXT NOT NULL
);

CREATE TABLE dept_emp (
	id SERIAL PRIMARY KEY,
	emp_no BIGINT NOT NULL,
	dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_man (
	dept_no VARCHAR(10) NOT NULL,
	emp_no BIGINT NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES dept_emp (emp_no)
);

CREATE TABLE titles (
	title_id VARCHAR(30) PRIMARY KEY,
	title TEXT NOT NULL
);

CREATE TABLE employees (
	emp_no BIGINT PRIMARY KEY,
	emp_title VARCHAR(30) NOT NULL,
	birth_date DATE NOT NULL,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	sex TEXT NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title) REFERENCES titles (title_id)
);

CREATE TABLE salaries (
	emp_no BIGINT PRIMARY KEY,
	salary BIGINT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_man;
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM salaries;


