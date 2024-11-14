use Northwind
-- set 1
select orders.OrderID,
       sum([Order Details].Quantity) TOTAL_quantity,
       C.ContactName
from Orders
join [Order Details] on Orders.OrderID = [Order Details].OrderID
JOIN dbo.Customers C on Orders.CustomerID = C.CustomerID
GROUP BY orders.OrderID, C.ContactName



select orders.OrderID,
       sum([Order Details].Quantity) TOTAL_quantity,
       C.ContactName
from Orders
join [Order Details] on Orders.OrderID = [Order Details].OrderID
JOIN dbo.Customers C on Orders.CustomerID = C.CustomerID
GROUP BY orders.OrderID, C.ContactName
having sum([Order Details].Quantity) > 250

select [Order Details].orderid,
       sum(UnitPrice*Quantity),
       ContactName
from [Order Details]
join dbo.Orders O on O.OrderID = [Order Details].OrderID
join dbo.Customers C on C.CustomerID = O.CustomerID
group by [Order Details].orderid, ContactName


select [Order Details].orderid,
       sum(UnitPrice*Quantity),
       ContactName,
       sum(UnitPrice) TotalAmount
from [Order Details]
join dbo.Orders O on O.OrderID = [Order Details].OrderID
join dbo.Customers C on C.CustomerID = O.CustomerID
group by [Order Details].orderid, ContactName
having sum(UnitPrice)>250
order by TotalAmount desc


select [Order Details].orderid,
       sum(UnitPrice*Quantity),
       ContactName,
       sum(UnitPrice) TotalAmount,
       FirstName,
       LastName
from [Order Details]
join dbo.Orders O on O.OrderID = [Order Details].OrderID
join dbo.Customers C on C.CustomerID = O.CustomerID
join dbo.Employees E on O.EmployeeID = E.EmployeeID
group by [Order Details].orderid, ContactName, FirstName, LastName
having sum(UnitPrice)>250
order by TotalAmount desc


-- set 2

select CategoryName,
       -- ProductName,
       sum(Quantity) totalQuantity
from Categories
join dbo.Products P on Categories.CategoryID = P.CategoryID
join dbo.[Order Details] "[O D]" on P.ProductID = "[O D]".ProductID
group by CategoryName
order by totalQuantity desc


select CategoryName,
       -- ProductName,
       sum(Quantity) totalQuantity
from Categories
join dbo.Products P on Categories.CategoryID = P.CategoryID
join dbo.[Order Details] "[O D]" on P.ProductID = "[O D]".ProductID
group by CategoryName
order by sum(Quantity*P.UnitPrice) desc

select Orders.OrderID,
       (sum(UnitPrice*Quantity)+Orders.Freight)
from Orders
join dbo.[Order Details] "[O D]" on Orders.OrderID = "[O D]".OrderID
group by Orders.OrderID, Orders.Freight

-- set 3
select CompanyName,
       count(OrderID)
from Shippers
join dbo.Orders O on Shippers.ShipperID = O.ShipVia
where year(ShippedDate) = 1997
group by CompanyName


select top 1 CompanyName,
       count(OrderID) TotalOrders
from Shippers
join dbo.Orders O on Shippers.ShipperID = O.ShipVia
where year(ShippedDate) = 1997
group by CompanyName
order by TotalOrders desc

select FirstName,
       LastName,
       count(OrderID) TotalOredrs
from Employees E
join dbo.Orders O on E.EmployeeID = O.EmployeeID
group by FirstName, LastName
order by TotalOredrs desc

select top 1  FirstName,
       LastName,
       count(OrderID) TotalOredrs
from Employees E
join dbo.Orders O on E.EmployeeID = O.EmployeeID
group by FirstName, LastName
order by TotalOredrs desc

select top 1  FirstName,
       LastName
from Employees
join dbo.Orders O on Employees.EmployeeID = O.EmployeeID
join dbo.[Order Details] "[O D]" on O.OrderID = "[O D]".OrderID
where year(OrderDate) = 1997
group by FirstName, LastName
order by sum(UnitPrice*Quantity) desc


SELECT
    Employees.FirstName,
    Employees.LastName,
    SUM(UnitPrice * Quantity) AS TotalValue
FROM
    Employees
JOIN  dbo.Orders O ON Employees.EmployeeID = O.EmployeeID
JOIN  dbo.[Order Details] AS [O D] ON O.OrderID = [O D].OrderID
JOIN  Employees Subordinates ON Employees.EmployeeID = Subordinates.ReportsTo
GROUP BY  Employees.FirstName, Employees.LastName
ORDER BY  TotalValue DESC;


