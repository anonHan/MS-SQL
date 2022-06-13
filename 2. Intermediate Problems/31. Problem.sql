-- 31. Customers with no orders for EmployeeID 4

-- One employee (Margaret Peacock, EmployeeID 4) has placed the most orders. However, there are some
-- customers who've never placed an order with her. Show only those customers who have never placed an order with her.



SELECT			C.CustomerID, O.CustomerID
FROM			Customers C LEFT JOIN Orders O 
ON				O.CustomerID = C.CustomerID AND O.EmployeeID = 4
WHERE			O.CustomerID IS NULL;
