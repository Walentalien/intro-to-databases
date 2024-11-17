use Northwind;

select O.orderID,
       O.customerID
from (select orderid, CustomerID from Orders) as O

select ProductName,
       UnitPrice,
       (select AVG(UnitPrice) from Products) Average,
       UnitPrice-(select AVG(UnitPrice) from Products) Difference

    from Products

select ProductName,
       UnitPrice,
       (select AVG(UnitPrice) from Products) Average,
       UnitPrice-(select Avg(UnitPrice) from Products) Difference
from Products
where UnitPrice > (select AVG(UnitPrice) from Products)

-- average price of product in category
select ProductName,

       UnitPrice,
       (select  avg(UnitPrice) from Products sub_inner where sub_outer.CategoryID = sub_inner.CategoryID) Average
from products sub_outer

-- price of products whose price in category is higher than average in category
select ProductName,
       UnitPrice,
       (select avg(UnitPrice) from Products sub_inner
                              where sub_outer.categoryID = sub_inner.CategoryID) Average
from Products sub_outer
where sub_outer.UnitPrice > (select  avg(UnitPrice) from products sub_inner
                                      where sub_outer.CategoryID  = sub_inner.CategoryID)
-- biggest amount of ordered units for every product
select distinct productid,
                quantity
from [Order Details] ord1
where Quantity  = (select MAx(Quantity) from [Order Details] ord2  where ord1.ProductID=ord2.ProductID)
order by ProductID

-- biggest amount of ordered units for every product
select productid,
       max(quantity)  as quantity
from [Order Details]
group by productid
order by ProductID

-- list of workers who had order on 9/5/97 using Exists
select LastName,
       EmployeeID
from Employees E
where  EXISTS (select * from orders o
                       where e.EmployeeID = o.EmployeeID
                       and OrderDate = '9/5/1997')

-- list of workers who had order on 9/5/97 using join
select Distinct LastName,
                e.EmployeeID
from Orders o
join employees e
on o.EmployeeID = e.EmployeeID
where o.OrderDate = '9/5/1997'

-- list of workers who had order on 9/5/97 using in
select LastName,
       EmployeeID
from Employees e
where EmployeeID in (select EmployeeID from Orders as o where o.OrderDate = '9/5/1997')

