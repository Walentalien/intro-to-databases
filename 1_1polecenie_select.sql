use Northwind;

select ContactName, Address
from Customers

select LastName, HomePhone
from Employees

select ProductName, UnitPrice
from Products

select CategoryName, Description
from Categories

select CompanyName, HomePage
from Suppliers
where HomePage  like '%http://%'

select OrderID, CustomerID, year(OrderDate)
from Orders
where OrderDate < '8/1/96'

SELECT CompanyName, Address
FROM Customers
WHERE City = 'London';

SELECT CompanyName, Address
FROM Customers
WHERE Country IN ('France', 'Spain');

SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice BETWEEN 20.0 AND 30.0

SELECT ProductName, UnitPrice
FROM Products
WHERE CategoryID = (
    SELECT CategoryID
    FROM Categories
    WHERE CategoryName LIKE '%Meat%'
);

SELECT ProductName, UnitsInStock
FROM Products
WHERE SupplierID = (
    SELECT SupplierID
    FROM Suppliers
    WHERE CompanyName = 'Tokyo Traders'
);

SELECT ProductName
from Products
WHERE UnitsInStock = 0;

SELECT companyname
FROM customers
WHERE companyname LIKE '%Restaurant%'


select *
from Products
where QuantityPerUnit like '%bottle%';

select Title
from Employees
where LastName like '[B-L]%'

SELECT LastName, FirstName, Title
FROM Employees
WHERE LastName LIKE 'B%' OR LastName LIKE 'L%';

SELECT CategoryName
from Categories
where Description like'%,%'

select ContactName
from Customers
where CompanyName like '%Store%'

SELECT productid, productname, supplierid, unitprice
FROM products
WHERE (productname LIKE 'T%' OR productid = 46)
AND unitprice > 16.00

SELECT productid, productname, supplierid, unitprice
FROM products
WHERE (productname LIKE 'T%' OR productid = 46 ) AND unitprice > 16.00


SELECT productname, unitprice
FROM products
WHERE unitprice BETWEEN 10 AND 20

SELECT *
from Products
where UnitPrice not between 10 and 20

select  ProductName, UnitPrice
from Products
where UnitPrice between 20 and 30

SELECT CompanyName, Country
FROM Customers
WHERE Country = 'Japan' OR Country = 'Italy';

SELECT CompanyName, Country
FROM Customers
WHERE Country in ('Japan', 'Italy');

SELECT OrderID, OrderDate, CustomerID, ShippedDate
FROM Orders
WHERE ShippedDate IS NULL
AND ShipCountry = 'Argentina';

SELECT productid, productname, categoryid, unitprice
FROM products
ORDER BY 3,4 DESC

select CompanyName, Country
from Customers
order by Country, CompanyName

SELECT c.CategoryName, p.ProductName, p.UnitPrice
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID
ORDER BY c.CategoryName, p.UnitPrice DESC

SELECT CompanyName, Country
FROM Customers
WHERE Country IN ('Japan', 'Italy')
ORDER BY Country, CompanyName;


SELECT DISTINCT country
FROM suppliers
ORDER BY country

SELECT firstname AS First, lastname AS Last
,employeeid AS EmployeeID
FROM employees

SELECT 'Name:', firstname
       ,'LastName:', lastname
,'Identification number:', employeeid
FROM employees

SELECT CONCAT(FirstName, ' ', LastName, ' - Identification number: ', EmployeeID) AS EmployeeInfo
FROM Employees;


SELECT orderid, unitprice * 1.05 as newunitprice
FROM [order details]

SELECT firstname + ' ' + lastname as 'Full Name'
FROM employees

SELECT ProductID, Quantity, UnitPrice, ROUND((Quantity * UnitPrice), 2) AS TotalValue
FROM [Order Details]
WHERE OrderID = 10250;

SELECT CompanyName,
       CONCAT('(', Phone, ', ', Fax, ')') AS PhoneFax
FROM Suppliers;







