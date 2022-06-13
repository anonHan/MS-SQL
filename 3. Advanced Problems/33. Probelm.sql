--33. High-value customers - total orders

--The manager has changed his mind. Instead of requiring
--that customers have at least one individual orders totaling
--$10,000 or more, he wants to define high-value
--customers as those who have orders totaling $15,000 or
--more in 2016. How would you change the answer to the
problem above?


SELECT		C.CustomerID, 
			C.CompanyName, 
			SUM(OD.UnitPrice * OD.Quantity) AS TotalOrderAmount				
FROM		Customers C JOIN Orders O 
ON			O.CustomerID = C.CustomerID JOIN [Order Details] OD 
ON			OD.OrderID = O.OrderID
WHERE		O.OrderDate BETWEEN  '19960101' AND '19961231'
GROUP BY	C.CustomerID, 
			C.CompanyName
HAVING		SUM(OD.Quantity*Od.UnitPrice)>15000
ORDER BY	TotalOrderAmount DESC;
