-- First we have to create the DataBase (Swiggy_DB)
create database Swiggy_DB

select * from [dbo].[Swiggy_Data]

-- null Check
select state,city,Order_Date,Restaurant_Name,Location,
category,Dish_name,Price_INR,Rating,Rating_Count
from Swiggy_Data where state is null
-- # here is no Null valurs founds

-- Duplicate Data Analysis
select [State],[City],[Order_Date],[Restaurant_Name],
[Location],
[Category],
[Dish_Name],[Price_INR],
[Rating],
[Rating_Count],
count(*)
from [dbo].[Swiggy_Data]
group by
[State],
[City],
[Order_Date],
[Restaurant_Name],
[Location],
[Category],
[Dish_Name],
[Price_INR],
[Rating],
[Rating_Count]
having count(*) > 1

-- delete duplicates
with cte as (
select * ,row_number() over(partition by [State],[City],[Order_Date],[Restaurant_Name],
[Location],[Category],[Dish_Name],[Price_INR],[Rating],[Rating_Count] order by (select null)
)as rn
from Swiggy_data
)
delete from cte where rn>1


select * from Swiggy_Data
