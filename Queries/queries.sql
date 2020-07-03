-- Retirement eligibility
--SELECT first_name, last_name
--FROM employees
--WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
--AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- 52'
--SELECT first_name, last_name
--FROM employees
--WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

-- 53'
--SELECT first_name, last_name
--FROM employees
--WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

-- 54'
--SELECT first_name, last_name
--FROM employees
--WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

-- 55'
--SELECT first_name, last_name
--FROM employees
--WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';

-- Number of employees retiring
--SELECT COUNT(first_name)
--FROM employees
--WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
--AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

--SELECT first_name, last_name
--INTO retirement_info
--FROM employees
--WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
--AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

--COPY retirement_info TO '/Users/grotenhuis/Desktop/Bootcamp/Pewlett-Hackard-Analysis/Data/retirement_info_output.CSV' DELIMITER ',' CSV HEADER;

--DROP TABLE retirement_info;

-- Create new table for retiring employees
--Select emp_no, first_name, last_name
--Into retirement_info
--From employees
--WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
--AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
--SELECT * FROM retirement_info; 

-- Joining departments and dept_manager tables
--SELECT d.dept_name,
--     dm.emp_no,
--     dm.from_date,
--     dm.to_date
--FROM departments as d
--INNER JOIN dept_manager as dm
--ON d.dept_no = dm.dept_no;

-- Joining retirement_info and dept_emp tables
--select ri.emp_no,
--	ri.first_name,
--	ri.last_name,
--	de.to_date

--into current_emp
	
--from retirement_info as ri
--left join dept_emp as de
--on ri.emp_no = de.emp_no
--where de.to_date = ('9999-01-01');

-- Employee count by department number
--select count(ce.emp_no),
--			 de.dept_no
--Into emp_count_by_dep_num
--from current_emp as ce
--left join dept_emp as de
--on ce.emp_no = de.emp_no
--group by de.dept_no
--order by de.dept_no;

--SELECT * FROM salaries
--order by to_date desc;

--select e.emp_no,
--	   e.first_name,
--	   e.last_name,
--	   e.gender,
--	   s.salary,
--	   de.to_date
--INTO emp_info
--FROM employees as e
--inner join salaries as s on (e.emp_no = s.emp_no)
--inner join dept_emp as de on (e.emp_no = de.emp_no)
--WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
--AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
--and (de.to_date = '9999-01-01');

--COPY emp_info TO '/Users/grotenhuis/Desktop/Bootcamp/Pewlett-Hackard-Analysis/Data/emp_info_output.CSV' DELIMITER ',' CSV HEADER;

-- List of managers per department
--select dm.dept_no,
--	   d.dept_name, 
--	   dm.emp_no,
--	   ce.last_name,
--	   ce.first_name,
--	   dm.from_date,
--	   dm.to_date
--into manager_info
--from dept_manager as dm
--inner join departments as d on (dm.dept_no = d.dept_no)
--inner join current_emp as ce on (dm.emp_no = ce.emp_no)

--COPY manager_info TO '/Users/grotenhuis/Desktop/Bootcamp/Pewlett-Hackard-Analysis/Data/manager_info_output.CSV' DELIMITER ',' CSV HEADER;

--select ce.emp_no,
--	   ce.first_name,
--	   ce.last_name,
--	   d.dept_name
--into dept_info
--from current_emp as ce
--inner join dept_emp as de on (ce.emp_no = de.emp_no)
--inner join departments as d on (de.dept_no = d.dept_no)

-- COPY dept_info TO '/Users/grotenhuis/Desktop/Bootcamp/Pewlett-Hackard-Analysis/Data/dept_info_output.CSV' DELIMITER ',' CSV HEADER;

--select emp_no,
--	   first_name,
--	   last_name,

-- COPY retirement_info TO '/Users/grotenhuis/Desktop/Bootcamp/Pewlett-Hackard-Analysis/Data/retirement_info_output.CSV' DELIMITER ',' CSV HEADER;

-- Find the number of people in the Sales and Development departments who are going to retire.
--select ri.emp_no,
--	   ri.first_name,
--	   ri.last_name,
--	   d.dept_name
--from retirement_info as ri   
--left join dept_emp as de on (ri.emp_no = de.emp_no)
--left join departments as d on (de.dept_no = d.dept_no)
--where de.dept_no in ('d007','d005') 
















-- Challenge Deliverable 1: Create a table for the number of employees who are about to retire grouped by job title.
select ri.emp_no,
 	   CONCAT(ri.first_name, ' ', ri.last_name),
	   ti.title,
	   ti.from_date,
	   sal.salary
	   ----------------CONCAT(c.FIRSTNAME, ',', c.LASTNAME)
--into num_retiring_emps_by_title
from retirement_info as ri 
inner join titles as ti on (ri.emp_no = ti.emp_no)
inner join salaries as sal on (ri.emp_no = sal.emp_no)
order by ti.title asc;
