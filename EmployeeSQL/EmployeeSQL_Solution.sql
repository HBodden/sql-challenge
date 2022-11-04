CREATE TABLE "departments" (
    "dept_no" varchar   NOT NULL,
    "dept_name" varchar   NOT NULL
);

CREATE TABLE "dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" varchar   NOT NULL,
    "emp_no" int   NOT NULL
);

-- DROP TABLE employees;

CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "emp_title_id" varchar   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "sex" varchar   NOT NULL,
    "hire_date" date   NOT NULL
);

CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL
);


CREATE TABLE "titles" (
    "title_id" varchar   NOT NULL,
    "title" varchar   NOT NULL
);

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select employees.emp_no, employees.last_name, 
	   employees.first_name, employees.sex, 
	   salaries.salary 
from employees
inner join salaries on 
employees.emp_no=salaries.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
select first_name, 
	   last_name, 
	   hire_date
from employees where hire_date between '01/01/1986' and '12/31/1986'; 

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
select t1.dept_no, 
	   t2.dept_name, 
	   t1.emp_no, 
	   t3.last_name, 
	   t3.first_name
from dept_manager as t1
inner join departments as t2 on
t1.dept_no = t2.dept_no
inner join employees as t3 on
t1.emp_no = t3.emp_no;

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
select t1.emp_no,
	   t1.last_name,
	   t1.first_name,
 	   t3.dept_name
from employees as t1
inner join dept_emp as t2 on
t1.emp_no = t2.emp_no
inner join departments as t3 on
t2.dept_no = t3.dept_no;

-- 5. List first name, last name, and sex for employees whose 
-- first name is "Hercules" and last names begin with "B."
select first_name,
	   last_name,
	   sex
from employees where first_name = 'Hercules' and last_name like 'B%';

-- 6. List all employees in the Sales department, 
-- including their employee number, last name, first name, and department name.
select t1.emp_no,
	   t1.last_name,
	   t1.first_name,
	   t3.dept_name
from employees as t1	   
inner join dept_emp as t2 on
t1.emp_no = t2.emp_no
inner join departments as t3 on
t2.dept_no = t3.dept_no

where dept_name = 'Sales';


-- 7. List all employees in the Sales and Development departments,
-- including their employee number, last name, first name, and department name.
select t1.emp_no,
	   t1.last_name,
	   t1.first_name,
	   t3.dept_name
from employees as t1	   
inner join dept_emp as t2 on
t1.emp_no = t2.emp_no
inner join departments as t3 on
t2.dept_no = t3.dept_no

where dept_name ='Sales' or dept_name = 'Development';
-- 8. List the frequency count of employee last names (i.e., how many employees share each last name) 
-- in descending order.
select last_name, 
	   count(last_name) as "last_name_count" 

from employees group by "last_name"

order by last_name_count desc;