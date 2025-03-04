-- Create employees table
create table employees (
	emp_no INT PRIMARY KEY,
	birth_date DATE,
	first_name VARCHAR(35),
	last_name VARCHAR(35),
	gender VARCHAR(1),
	hire_date DATE
);

-- Create departments table
create table departments (
	dept_no VARCHAR(8) primary key NOT NULL,
	dept_name VARCHAR(40) NOT NULL
);

-- Create titles table
create table titles (
	emp_no INT,
	title VARCHAR(40),
	from_date DATE,
	to_date DATE,
    foreign key (emp_no) references employees (emp_no)
);

-- Create department employee table
create table dept_emp (
	emp_no INT,
	dept_no VARCHAR(8),
	from_date DATE,
	to_date DATE,
    foreign key (emp_no) references employees (emp_no),
    foreign key (dept_no) references departments (dept_no)
);

-- Create salaries table
create table salaries (
	emp_no INT,
	salary INT,
	from_date DATE,
	to_date DATE,
    foreign key (emp_no) references employees (emp_no)
);

-- Create Department manager table
create table dept_manager (
	dept_no VARCHAR(8),
	emp_no INT,
	from_date DATE,
	to_date DATE,
    foreign key (emp_no) references employees (emp_no),
    foreign key (dept_no) references departments (dept_no)
);

-- Change to_date years that hold year 9999 to current date for dept_manager,
-- dept emp, and titles (salaries table does not have 9999 year)
update dept_manager
set to_date = CURRENT_DATE
where extract(year from to_date) = 9999;

update dept_emp
set to_date = CURRENT_DATE
where extract(year from to_date) = 9999;

update titles
set to_date = CURRENT_DATE
where extract(year from to_date) = 9999;

#CHECK QUERIES
SELECT* FROM DEPARTMENTS
SELECT* FROM EMPLOYEES
SELECT* FROM TITLES
SELECT* FROM DEPT_EMP
SELECT* FROM SALARIES
SELECT* FROM DEPT_MANAGER