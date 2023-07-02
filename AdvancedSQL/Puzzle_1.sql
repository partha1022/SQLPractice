-- Shopping carts
-- DDL Statements
DROP TABLE IF EXISTS #Cart1;
DROP TABLE IF EXISTS #Cart2;
GO

CREATE TABLE #Cart1
(
Item  VARCHAR(100) PRIMARY KEY
);
GO

CREATE TABLE #Cart2
(
Item  VARCHAR(100) PRIMARY KEY
);
GO

INSERT INTO #Cart1 (Item) VALUES
('Sugar'),('Bread'),('Juice'),('Soda'),('Flour');
GO

INSERT INTO #Cart2 (Item) VALUES
('Sugar'),('Bread'),('Butter'),('Cheese'),('Fruit');
GO

--select * from #Cart1;
--select * from #Cart2;

select #Cart1.Item as 'Item Cart 1',  #Cart2.Item as 'Item Cart 2'
from #Cart1
FULL OUTER join #Cart2  
on #Cart1.Item = #Cart2.Item 
order by case when #Cart1.Item is null then 1 else 0 end, 
         case when #Cart2.Item is null then 1 else 0 end, 
         #Cart1.Item, 
         #Cart2.Item
