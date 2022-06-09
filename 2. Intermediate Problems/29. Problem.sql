-- 29. Inventory list
-- We're doing inventory, and need to show information like the below, for all orders. Sort by OrderID and Product ID.


SELECT			E.EmployeeID, E.LastName, O.OrderID, P.ProductName, OD.Quantity
FROM			Products P					JOIN [Order Details] OD 
ON				OD.ProductID = P.ProductID  JOIN Orders O 
ON				O.OrderID = OD.OrderID		JOIN Employees E
ON				E.EmployeeID = O.EmployeeID
