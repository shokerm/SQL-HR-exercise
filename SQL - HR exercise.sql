use HRDb
--ex1
select first_name, last_name, d.department_id, d.department_name from dbo.employees e
join dbo.departments d on e.department_id = d.department_id

--ex2
select e.first_name,e.last_name,d.department_name, l.city,l.state_province from employees e
join departments d on e.department_id= d.department_id
join locations l on d.location_id = l.location_id

--ex3
select e.first_name,e.last_name,e.salary, jg.grade_level from employees e
join job_grades jg on e.salary >= jg.lowest_sal and e.salary <= jg.highest_sal

--ex4
select e.first_name,e.last_name,d.department_id,d.department_name from employees e
join departments d on e.department_id = d.department_id and d.department_id in(80,40)
order by e.last_name

--ex5
select e.first_name,e.last_name,d.department_name, l.city,l.state_province from employees e
join departments d on e.department_id= d.department_id
join locations l on d.location_id = l.location_id
where e.first_name like '%z%'

--ex6
select e.first_name,e.last_name,d.department_id,d.department_name from departments d
left join employees e on d.department_id = e.department_id

--ex7
select e.first_name,e.last_name,e.salary from employees e
where e.salary < (select e.salary from employees e where e.employee_id = 182 )

--ex8
select e.first_name, m.first_name from employees e
join employees m on e.manager_id = m.employee_id

--ex9
select d.department_name,l.city,l.state_province from departments d
join locations l on d.location_id = l.location_id

--ex10
select e.first_name,e.last_name,d.department_id,d.department_name from employees e
left outer join departments d on e.department_id = d.department_id

--ex11
select e.first_name,m.first_name from employees e
left outer join employees m on e.manager_id = m.employee_id

--ex12
select e.first_name,e.last_name,e.department_id from employees e
join employees e2 on e.department_id = e2.department_id and e2.last_name = 'Taylor'

--ex13
select j.job_title,d.department_name,e.first_name + ' ' + e.last_name, jh.start_date
from employees e
join job_history jh on e.employee_id= jh.employee_id
join jobs j on jh.job_id =j.job_id 
join departments d on e.department_id= d.department_id
where jh.start_date  >= '1993-01-01' and jh.start_date <= '1997-08-31'


--ex14
select j.job_title,e.first_name + ' ' + e.last_name as 'full name', j.max_salary-e.salary as 'differnce' from employees e
join jobs j on e.job_id = j.job_id

--ex15
select d.department_name, avg(e.salary) as avrage, count(e.commission_pct) from employees e
join departments d on e.department_id= d.department_id
group by d.department_name



