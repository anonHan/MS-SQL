--43. Late orders vs. total orders
--Andrew, the VP of sales, has been doing some more
--thinking some more about the problem of late orders. He
--realizes that just looking at the number of orders arriving
--late for each salesperson isn't a good idea. It needs to be
--compared against the total number of orders per
--salesperson.


SELECT		E.EmployeeID,
			E.LastName,
			COUNT(O.ORDERID) AS LateOrders
INTO		#TempTable
FROM		Orders O JOIN Employees E 
ON			E.EmployeeID = O.EmployeeID
WHERE		O.ShippedDate > O.RequiredDate
GROUP BY	E.EmployeeID, E.LastName
ORDER BY	LateOrders DESC;

SELECT		E.EmployeeID,
			E.LastName,
			COUNT(O.ORDERID) AS AllOrders,
			T.LateOrders
FROM		Orders O JOIN Employees E 
ON			E.EmployeeID = O.EmployeeID JOIN #TempTable T
ON			T.EmployeeID = E.EmployeeID
GROUP BY	E.EmployeeID, E.LastName, T.LateOrders
ORDER BY	LateOrders DESC;
