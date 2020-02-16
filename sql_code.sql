drop table departments
drop table dept_emp
drop table dept_manager
drop table employees
drop table salaries
drop table titles


create table departments(
	dept_no varchar(255) not null,
	dept_name varchar(255) not null,
	PRIMARY KEY (dept_no)
);

select * from departments

create table dept_emp(
	emp_no int not null,
	dept_no	varchar(255) not null,
	from_date varchar(255) not null,
	to_date varchar(255) not null,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (dept_no, emp_no)
);

create table dept_manager(
	dept_no	varchar(30) not null,
	emp_no	int not null,
	from_date date not null,
	to_date date not null,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

create table employees(
	emp_no int not null,
	birth_date date not null,
	first_name varchar(255) not null,
	last_name varchar(255) not null,
	gender varchar(1) not null,
	hire_date date not null,
	PRIMARY KEY (emp_no)
);


create table salaries(
	emp_no int not null,
	salary int not null,
	from_date date not null,
	to_date date not null,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

create table titles(
	emp_no int not null,
	title varchar(255) not null,
	from_date date not null,
	to_date date  not null,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--1.
select distinct * from employees

--2.
select * from employees
where date_part('year', hire_date) = 1986

--3.
select departments.dept_no, departments.dept_name, titles.emp_no, employees.first_name, employees.last_name, titles.from_date, titles.to_date
from titles 
inner join employees on
titles.emp_no=employees.emp_no
inner join dept_emp on
dept_emp.emp_no=employees.emp_no
inner join departments on
departments.dept_no=dept_emp.dept_no
where titles.title = 'Manager'

--4.
select departments.dept_no, departments.dept_name, 
titles.emp_no, employees.first_name, employees.last_name
from titles 
inner join employees on
titles.emp_no=employees.emp_no
inner join dept_emp on
dept_emp.emp_no=employees.emp_no
inner join departments on
departments.dept_no=dept_emp.dept_no

--5.
select * from employees
where first_name = 'Hercules' and last_name like 'B%'

--6.
select departments.dept_no, departments.dept_name, 
employees.first_name, employees.last_name
from titles 
inner join employees on
titles.emp_no=employees.emp_no
inner join dept_emp on
dept_emp.emp_no=employees.emp_no
inner join departments on
departments.dept_no=dept_emp.dept_no
where departments.dept_name = 'Sales'

--7.
select departments.dept_no, employees.emp_no, departments.dept_name, 
employees.first_name, employees.last_name
from titles 
inner join employees on
titles.emp_no=employees.emp_no
inner join dept_emp on
dept_emp.emp_no=employees.emp_no
inner join departments on
departments.dept_no=dept_emp.dept_no
where departments.dept_name = 'Sales'
or departments.dept_name = 'Development'
order by dept_no

--8.
select count(last_name), last_name 
from employees
group by last_name 
order by count desc











