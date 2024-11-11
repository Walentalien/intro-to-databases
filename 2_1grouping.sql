use Northwind

SELECT AVG(unitprice)
FROM products

SELECT SUM(quantity)
FROM [order details]
WHERE productid = 1

select count(productid)
from Products
where UnitPrice between 10 and 20

SELECT MAX(UnitPrice) AS MaxPrice
FROM Products
WHERE UnitPrice < 20;

SELECT
    MAX(UnitPrice) AS MaxPrice,
    MIN(UnitPrice) AS MinPrice,
    AVG(UnitPrice) AS AvgPrice
FROM Products
WHERE QuantityPerUnit LIKE '%bottle%';

SELECT *
FROM Products
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products);

SELECT SUM(Quantity * UnitPrice)  OrderValue
FROM [Order Details]
WHERE OrderID = 10250;

SELECT productid, SUM(quantity) AS total_quantity
FROM [order Details]
GROUP BY productid

SELECT OrderID, MAX(UnitPrice) AS MaxProductPrice
FROM [Order Details]
GROUP BY OrderID
order by MaxProductPrice desc;


SELECT OrderID,
       MIN(UnitPrice) minProductPrice,
       MAX(UnitPrice) maxProductPrice
FROM [Order Details]
GROUP BY OrderID;


select count(OrderID)
from Orders
group by ShipVia

SELECT ShipVia, COUNT(OrderID) AS NumberOfOrders
FROM Orders
GROUP BY ShipVia;

SELECT top 1 ShipVia , COUNT(OrderID) AS NumberOfOrders
FROM Orders
WHERE YEAR(OrderDate) = 1997
GROUP BY ShipVia
ORDER BY NumberOfOrders DESC


SELECT productid, SUM(quantity)
AS total_quantity
FROM orderhist
GROUP BY productid
HAVING SUM(quantity)>=30

SELECT productid, SUM(quantity) AS total_quantity
FROM [order details]
GROUP BY productid
having SUM(quantity)>1200
order by total_quantity desc


SELECT OrderID, COUNT(*) AS NumberOfItems
FROM [Order Details]
GROUP BY OrderID
HAVING COUNT(*) > 5

SELECT o.CustomerID, COUNT(o.OrderID) AS NumberOfOrders, SUM(o.Freight) AS TotalFreight
FROM Orders o
WHERE YEAR(o.OrderDate) = 1998
GROUP BY o.CustomerID
HAVING COUNT(o.OrderID) > 8
ORDER BY TotalFreight DESC;



