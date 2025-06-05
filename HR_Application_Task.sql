-- 1. Retrieve the names and contact details of employees hired after January 1, 2023.

select FirstName, LastName, Email, Phone from employees where HireDate > "2023-01-01";


-- 2. Find the total payroll amount paid to each department.

select departments.DepartmentName, SUM(payroll.amount) as "Total Payroll Amount" from employees inner join payroll on employees.EmployeeID = payroll.EmployeeID inner join departments on employees.DepartmentID = departments.DepartmentID group by DepartmentName;


-- 3. List all employees who have not been assigned a manager.

select EmployeeID, firstname, lastname from employees where ManagerID is NULL;


-- 4. Retrieve the highest salary in each department along with the employee’s name.

select departments.departmentname, employees.firstname, employees.lastname, employees.salary as 'Highest Salary' from employees inner join departments on employees.departmentid = departments.departmentid where employees.salary = (select MAX(employees.salary) from employees where departments.departmentID = employees.departmentID);


-- 5. Find the most recent performance review for each employee.

select p.employeeID, p.reviewdate, p.performancescore from performancereviews as p where p.reviewdate = (select max(p2.reviewdate) from performancereviews as p2 where p2.employeeID = p.employeeID);


-- 6. Count the number of employees in each department.

select d.DepartmentName, COUNT(e.EmployeeID) AS EmployeeCount from Employees as e INNER JOIN Departments as d ON e.DepartmentID = d.DepartmentID group by d.DepartmentName;


-- 7. List all employees who have received a performance score of "Excellent".

select e.FirstName, e.LastName, p.PerformanceScore from Employees as e INNER JOIN PerformanceReviews as p ON e.EmployeeID = p.EmployeeID where p.PerformanceScore = 'Excellent';


-- 8. Identify the most frequently used payment method in payroll.

select PaymentMethod, count(*) as MethodCount from Payroll group by PaymentMethod limit 1;


-- 9. Retrieve the top 5 highest-paid employees along with their departments.

select e.firstname, e.lastname, d.departmentname from employees as e inner join departments as d on e.departmentID = d.departmentID where e.salary =(select MAX(e.salary) from employees where e.departmentID = d.departmentID) limit 5;


-- 10. Show details of all employees who report directly to a specific manager (e.g., ManagerID = 101).

select * from employees where managerID = 101;