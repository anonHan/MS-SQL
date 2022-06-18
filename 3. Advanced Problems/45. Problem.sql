--45. Late orders vs. total orders - fix null

--Continuing on the answer for above query, let's fix the
--results for row 5 - Buchanan. He should have a 0 instead
--of a Null in LateOrders.


SELECT		E.EmployeeID,
			E.LastName,
			ISNULL(COUNT(O.ORDERID),0) AS LateOrders
INTO		#Temp3
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
ON			E.EmployeeID = O.EmployeeID JOIN #Temp3 T
ON			T.EmployeeID = E.EmployeeID
GROUP BY	E.EmployeeID, E.LastName, T.LateOrders
ORDER BY	LateOrders DESC;
