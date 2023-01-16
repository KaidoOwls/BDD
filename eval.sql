--Ex 1--
SELECT CompanyName, ContactName, ContactTitle, Phone 
FROM `customers`
 WHERE Country = 'France'
--EX 2--
SELECT ProductName, UnitPrice  
FROM `products` 
JOIN suppliers 
ON suppliers.SupplierID= products.SupplierID 
WHERE CompanyName= 'Exotic Liquids'
--Ex 3--
SELECT CompanyName, COUNT(UnitsOnOrder)
 FROM `suppliers` 
 JOIN products 
 ON products.SupplierID = suppliers.SupplierID
  where country='France'
   GROUP BY  CompanyName D
   ESC
--Ex 4--
SELECT CompanyName, COUNT(OrderId) 
FROM `customers` 
JOIN orders 
on orders.CustomerID =customers.CustomerID
 WHERE country = 'France' 
 GROUP BY CompanyName 
 HAVING COUNT(OrderId) >10
--Ex 5--
SELECT CompanyName,SUM(UnitPrice*Quantity) ca, Country 
FROM `customers` 
INNER JOIN orders 
ON orders.CustomerID = customers.CustomerID
 JOIN `order details` on orders.OrderID = `order details`.OrderID
GROUP BY CompanyName 
HAVING SUM(UnitPrice*Quantity)>30000 
ORDER BY ca DESC
--Ex 6--
SELECT ShipCountry FROM `orders` 
JOIN `order details`
 on orders.OrderID = `order details`.OrderID 
JOIN products 
ON products.ProductID= `order details`.ProductID 
JOIN suppliers 
ON products.SupplierID = suppliers.SupplierID
 WHERE CompanyName = 'Exotic Liquids' 
 GROUP BY ShipCountry;
 --Ex 7--
SELECT SUM(UnitPrice*Quantity) ca 
FROM `order details`
JOIN orders on orders.OrderID= `order details`.`OrderID` 
WHERE YEAR(OrderDate)=1997
--Ex 8--
SELECT SUM(UnitPrice*Quantity), MONTH(OrderDate) ca
 FROM `order details`
 JOIN orders on orders.OrderID= `order details`.`OrderID` 
 WHERE YEAR(OrderDate)=1997 
 GROUP BY MONTH(OrderDate)
--Ex 9--
SELECT MAX(OrderDate) 
FROM `orders`JOIN customers 
ON customers.CustomerID=orders.CustomerID 
WHERE CompanyName= 'Du monde entier'
--Ex 10--
SELECT AVG(DATEDIFF(ShippedDate,OrderDate)) FROM `orders` 


