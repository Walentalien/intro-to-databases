use Joindb

-- where
SELECT buyer_name, sales.buyer_id, qty
FROM buyers, sales
WHERE buyers.buyer_id = sales.buyer_id


-- where + aliases
SELECT buyer_name, s.buyer_id, qty
FROM buyers AS b, sales AS s
WHERE b.buyer_id = s.buyer_id


-- join
SELECT buyer_name, sales.buyer_id, qty
FROM buyers
    INNER JOIN sales
ON buyers.buyer_id = sales.buyer_id

-- join + aliases
SELECT buyer_name, s.buyer_id, qty
FROM buyers AS
    b INNER JOIN sales AS s
ON b.buyer_id = s.buyer_id


-- join + aliases + inner omitted
SELECT buyer_name, s.buyer_id, qty
FROM buyers AS
    b  JOIN sales AS s
ON b.buyer_id = s.buyer_id



use Northwind

SELECT productname, companyname
FROM products
INNER JOIN suppliers
ON products.supplierid = suppliers.supplierid

SELECT DISTINCT companyname, orderdate
FROM orders
INNER JOIN customers
ON orders.customerid = customers.customerid
WHERE orderdate > '3/1/98'


use joindb
SELECT buyer_name, sales.buyer_id, qty
FROM buyers LEFT OUTER JOIN sales
ON buyers.buyer_id = sales.buyer_id

use Northwind
SELECT companyname, customers.customerid, orderdate
FROM customers
LEFT OUTER JOIN orders
ON customers.customerid = orders.customerid

select ProductName, UnitPrice
from Products
inner join Suppliers
    ON Products.SupplierID = Suppliers.SupplierID
where UnitPrice between 20 and 30
order by UnitPrice desc

select ProductName,
       UnitsInStock
from Products
inner join
    Suppliers on Products.SupplierID = Suppliers.SupplierID

select CompanyName, Address, YEAR(OrderDate), OrderID
from Customers
left join Orders
on YEAR(OrderDate) = 1997 and Customers.CustomerID = Orders.CustomerID
where OrderID is Null


select CompanyName, Address, YEAR(OrderDate), OrderID
from Customers
left join Orders
on  Customers.CustomerID = Orders.CustomerID and YEAR(OrderDate) = 1997
where OrderID is Null


select CompanyName,
       Phone
from Suppliers
left outer join Products
on Suppliers.SupplierID = Products.SupplierID
where UnitsInStock = 0

use library

select firstname, juvenile.birth_date
from member
inner join juvenile
on member.member_no = juvenile.member_no

select distinct title
from title
inner join loan
on title.title_no = loan.title_no

select cast(t.title_no as varchar) + ' Tao Teh King', Sum(fine_assessed)
from loanhist
join title t
on loanhist.title_no = t.title_no
where title = 'Tao Teh King'
group by t.title_no



use Northwind
SELECT productname, companyname
FROM products
INNER JOIN suppliers
ON products.supplierid = suppliers.supplierid


SELECT DISTINCT companyname, orderdate
FROM orders
INNER JOIN customers
ON orders.customerid = customers.customerid
-- WHERE orderdate > '3/1/98'

use joindb

SELECT buyer_name, qty
FROM buyers
CROSS JOIN sales

SELECT buyer_name, prod_name, qty
FROM buyers
INNER JOIN sales
ON buyers.buyer_id = sales.buyer_id
INNER JOIN produce
ON sales.prod_id = produce.prod_id


use Northwind
SELECT suppliers.companyname, shippers.companyname
FROM suppliers
CROSS JOIN shippers

use Northwind
SELECT  FORMAT (orderdate, 'dd-MM-yyyy') as date,
        productname
FROM orders AS O
INNER JOIN [order details] AS OD
ON O.orderid = OD.orderid
INNER JOIN products AS P
ON OD.productid = P.productid
WHERE orderdate = '7/8/96'

select P.ProductName, P.UnitPrice, S.Address
from Products P
join Suppliers S on P.SupplierID = S.SupplierID
join Categories on P.CategoryID = Categories.CategoryID
where( UnitPrice between 20 and 30)
  and (CategoryName like '%Meat%' or CategoryName like '%Poultry%') -- less resctrictive


SELECT P.ProductName, P.UnitPrice, S.Address -- , S.City, S.Region, S.PostalCode, S.Country
FROM Products P
JOIN Suppliers S ON P.SupplierID = S.SupplierID
JOIN Categories C ON P.CategoryID = C.CategoryID
WHERE P.UnitPrice BETWEEN 20 AND 30
  AND C.CategoryName = 'Meat/Poultry'; -- more restrictive

select ProductName,
       UnitPrice,
       CompanyName
from Products
join Categories on Products.CategoryID = Categories.CategoryID
join Suppliers on Products.SupplierID = Suppliers.SupplierID
where CategoryName = 'Confections'


select C.ContactName,
       C.Phone
from Customers C
join Orders O on C.CustomerID = O.CustomerID
JOIN Shippers S ON O.ShipVia = S.ShipperID
where S.CompanyName = 'United Package'
and Year(O.OrderDate) = 1997

select distinct ContactName,
       Phone
from Customers
join Orders on Customers.CustomerID = Orders.CustomerID
join [Order Details] on Orders.OrderID = [Order Details].OrderID
join Products on [Order Details].ProductID = Products.ProductID
join Categories on Products.CategoryID = Categories.CategoryID
where CategoryName = 'Confections'

use library
select m.firstname,
       m.lastname,
       j.birth_date,
       a.street,
       a.city
from member m
join juvenile j on m.member_no = j.member_no
join adult a on j.adult_member_no = a.member_no


use joindb
SELECT a.buyer_id AS buyer1,
       a.prod_id
       ,b.buyer_id AS buyer2
FROM Sales AS a
JOIN Sales AS b
ON a.prod_id = b.prod_id
WHERE a.buyer_id > b.buyer_id

SELECT a.buyer_id AS buyer1, a.prod_id
,b.buyer_id AS buyer2
FROM sales AS a
INNER JOIN sales AS b
ON a.prod_id = b.prod_id
 WHERE a.buyer_id < b.buyer_id


use Northwind
SELECT a.employeeid,
       LEFT(a.lastname,10) AS name
     ,LEFT(a.title,10) AS title
     ,b.employeeid,
      LEFT(b.lastname,10) AS name
     ,LEFT(b.title,10) AS title
FROM employees AS a
INNER JOIN employees AS b
ON a.title = b.title
WHERE a.employeeid <> b.employeeid


use Northwind

SELECT
    distinct --e1.EmployeeID AS EmployeeID,
             -- e1.FirstName AS BOSS,
             e1.LastName AS Surname
--e2.EmployeeID AS SubordinateID,
-- e2.FirstName AS SubordinateName
FROM
    Employees e1
        left JOIN
    Employees e2 ON e1.EmployeeID = e2.ReportsTo
where e2.EmployeeID is not Null








select e1.EmployeeID no_subordinates,
       e1.FirstName,
       e2.EmployeeID as subordinate
from Employees e1
left join Employees e2 on e1.EmployeeID = e2.ReportsTo
where e2.EmployeeID is null


SELECT
    EmployeeID,
    FirstName,
    LastName
FROM
    Employees e1
WHERE
    EmployeeID NOT IN (SELECT ReportsTo FROM Employees WHERE ReportsTo IS NOT NULL);


SELECT
    e1.EmployeeID,
    e1.FirstName,
    e1.LastName
FROM
    Employees e1
LEFT JOIN
    Employees e2 ON e1.EmployeeID = e2.ReportsTo
WHERE
    e2.EmployeeID IS NULL;

use library

select distinct firstname,
       member.lastname,
       a.street,
       a.city,
       a.state
       -- count(j.adult_member_no)
from adult a
join member  on  a.member_no = member.member_no
join juvenile j on a.member_no = j.adult_member_no
join loan on member.member_no = loan.member_no
where j.birth_date < '1996-01-01' and loan.due_date < GETDATE()
group by firstname, lastname, a.street, a.city, a.state







select m.Street,
       m.City,
       m.State
from adult m
join dbo.juvenile j on m.member_no = j.adult_member_no
where birth_date < '2996-01-01'
group by m.Street,
       m.City,
       m.State


select member.firstname
from member
join adult on member.member_no = adult.member_no
join dbo.juvenile j on adult.member_no = j.adult_member_no
where adult.state = 'AZ'
group by member.firstname
-- having count(j.adult_member_no) > 2



use joindb
SELECT a.buyer_id AS buyer1, a.prod_id
,b.buyer_id AS buyer2
FROM sales AS a
INNER JOIN sales AS b
ON a.prod_id = b.prod_id
where a.buyer_id <> b.buyer_id
order by a.buyer_id

use library
select member.firstname,
        member.lastname,
        count(j.adult_member_no)
from member
join adult on member.member_no = adult.member_no
join dbo.juvenile j on adult.member_no = j.adult_member_no
where adult.state ='AZ'
group by  member.firstname, member.lastname
having count(j.adult_member_no)>2
