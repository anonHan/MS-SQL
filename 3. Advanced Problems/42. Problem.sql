--42. Late orders - which employees?
--Some salespeople have more orders arriving late than
--others. Maybe they're not following up on the order
--process, and need more training. Which salespeople have
--the most orders arriving late?


SELECT		E.EmployeeID, E.FirstName, COUNT(O.OrderID) AS TotalLateOrders
FROM		Orders O JOIN Employees E
ON			O.EmployeeID = E.EmployeeID
WHERE		O.ShippedDate > O.RequiredDate
GROUP BY	E.EmployeeID, E.FirstName
ORDER BY	TotalLateOrders DESC
