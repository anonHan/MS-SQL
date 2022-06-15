--37. Orders - random assortment.

--The Northwind mobile app developers would now like to
--just get a random assortment of orders for beta testing on
--their app. Show a random set of 2% of all orders.

SELECT		TOP 2 PERCENT 
			O.OrderID, O.EmployeeID, O.CustomerID
FROM		Orders O


-- or
SELECT		TOP 2 PERCENT
			OrderID
FROM		Orders
ORDER BY	NEWID()
