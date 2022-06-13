--35. Month-end orders

--At the end of the month, salespeople are likely to try
--much harder to get orders, to meet their month-end
--quotas. Show all orders made on the last day of the
--month. Order by EmployeeID and OrderID


SELECT		EmployeeID, 
			OrderID,
			CONVERT(DATE,OrderDate) AS OrderDate
FROM		Orders
WHERE		CONVERT(DATE,OrderDate) =  EOMONTH(OrderDate)
ORDER BY	EmployeeID, OrderID

-- or 

SELECT		O.EmployeeID, O.OrderID, O.OrderDate
FROM		Orders O
WHERE		O.OrderDate =  EOMONTH(O.OrderDate)
ORDER BY	O.EmployeeID, O.OrderID
