--44. Late orders vs. total orders - missing
--employee
--There's an employee missing in the answer from the
--problem above. Fix the SQL to show all employees who
--have taken orders.


SELECT		E.EmployeeID,
			E.LastName,
			COUNT(O.ORDERID) AS LateOrders
INTO		#Temp2
FROM		Orders O RIGHT JOIN Employees E 
ON			E.EmployeeID = O.EmployeeID
WHERE		O.ShippedDate > O.RequiredDate
GROUP BY	E.EmployeeID, E.LastName
ORDER BY	LateOrders DESC;

SELECT * FROM #Temp2

SELECT		E.EmployeeID,
			E.LastName,
			COUNT(O.ORDERID) AS AllOrders,
			T.LateOrders
FROM		Orders O JOIN Employees E 
ON			E.EmployeeID = O.EmployeeID JOIN #Temp2 T
ON			T.EmployeeID = E.EmployeeID
GROUP BY	E.EmployeeID, E.LastName, T.LateOrders
ORDER BY	LateOrders DESC;
