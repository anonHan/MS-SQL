--32. High-value customers

--We want to send all of our high-value customers a special
--VIP gift. We're defining high-value customers as those
--who've made at least 1 order with a total value (not
--including the discount) equal to $10,000 or more. We
--only want to consider orders made in the year 2016.

SELECT		C.CustomerID, 
			C.CompanyName, 
			O.OrderID, 
			(OD.UnitPrice * OD.Quantity) AS TotalOrderAmount			
FROM		Customers C JOIN Orders O 
ON			O.CustomerID = C.CustomerID JOIN [Order Details] OD 
ON			OD.OrderID = O.OrderID
WHERE		(OD.UnitPrice * OD.Quantity) >= 10000 AND O.OrderDate > '19960101'
ORDER BY	TotalOrderAmount DESC;
