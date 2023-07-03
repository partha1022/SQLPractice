-- Managers and Employees
-- Given the following hierarchical table, write an SQL statement that determines the level of depth each
-- employee has from the president.

DROP TABLE IF EXISTS #Employees;
GO

CREATE TABLE #Employees
(
EmployeeID  INTEGER PRIMARY KEY,
ManagerID   INTEGER NULL,
JobTitle    VARCHAR(100) NOT NULL
);
GO

INSERT INTO #Employees (EmployeeID, ManagerID, JobTitle) VALUES
(1001,NULL,'President'),(2002,1001,'Director'),
(3003,1001,'Office Manager'),(4004,2002,'Engineer'),
(5005,2002,'Engineer'),(6006,2002,'Engineer');
GO


select * from #Employees

go
with build_hierarchy as(
    select *, 0 AS Level 
    from #Employees 
    where EmployeeID = 1001
    
    UNION ALL
    
    select emp.*, cte.Level + 1 AS Level 
    from #Employees emp 
    inner join build_hierarchy cte
    on cte.employeeID = emp.ManagerID 
)  

select * from build_hierarchy;
go