--50. Customer grouping with percentage
--Based on the above query, show all the defined
--CustomerGroups, and the percentage in each. Sort by the
--total in each group, in descending order.


SELECT		C.CustomerID, C.CompanyName,
			SUM(OD.Quantity * OD.UnitPrice) AS TotalOrderAmount ,
			CASE 
				WHEN SUM(OD.Quantity * OD.UnitPrice) BETWEEN 0 AND 1000 THEN 'LOW'
				WHEN SUM(OD.Quantity * OD.UnitPrice) BETWEEN 1000 AND 5000 THEN 'MEDIUM'
				WHEN SUM(OD.Quantity * OD.UnitPrice) BETWEEN 5000 AND 10000 THEN 'HIGH'
				WHEN SUM(OD.Quantity * OD.UnitPrice) > 10000 THEN 'VERY HIGH'
			ELSE NULL
			END 
			AS CustomerGroup
INTO		#GroupedCustomers
FROM		Customers C JOIN Orders O
ON			C.CustomerID = O.CustomerID JOIN [Order Details] OD
ON			OD.OrderID = O.OrderID
WHERE		O.OrderDate BETWEEN '19960101' AND '19961231'
GROUP BY	C.CustomerID, C.CompanyName;


SELECT		G.CustomerGroup, 
			COUNT(G.CustomerID) AS TotalInGroup,
			ROUND((COUNT(G.CustomerID)*1.0/(SELECT COUNT(CustomerID) FROM #GroupedCustomers))*100,2) AS PercentageINGroup
FROM		#GroupedCustomers G
GROUP BY	G.CustomerGroup
ORDER BY	TotalInGroup
