use Northwind;

select top 10 sum(Quantity * UnitPrice) TotalValue
from [Order Details]
group by OrderID
order by TotalValue desc


select ProductID, sum(quantity)
from [Order Details]
-- where ProductID < 3
group by ProductID

select OrderID,
       sum(Quantity * UnitPrice) as Total
from [Order Details]
group by OrderID
having  sum(Quantity * UnitPrice)>250

select EmployeeID, count(*)
from Orders
group by EmployeeID


SELECT ShipVia,avg(Freight)
from Orders
where year(ShippedDate) in (1996, 1997)
group by ShipVia

select EmployeeID,
       Year(OrderDate),
       month(OrderDate),
       count(OrderID)
from Orders

group by  EmployeeID,
          Year(OrderDate),
          month(OrderDate)



SELECT
    Employees.EmployeeID,
    YEAR(Orders.OrderDate) AS Year,
    MONTH(Orders.OrderDate) AS Month,
    COUNT(Orders.OrderID) AS OrderCount

FROM
    Orders
JOIN
    Employees ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY
    Employees.EmployeeID,
    YEAR(Orders.OrderDate),
    MONTH(Orders.OrderDate)
ORDER BY
    Employees.EmployeeID,
    Year,
    Month;


select CategoryID,

       MAX(UnitPrice) maxprice,
       Min(UnitPrice) minprice
from Products
group by CategoryID
order by CategoryID desc

