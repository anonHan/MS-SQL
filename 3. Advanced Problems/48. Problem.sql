--48. Customer grouping

--Andrew Fuller, the VP of sales at Northwind, would like
--to do a sales campaign for existing customers. He'd like
--to categorize customers into groups, based on how much
--they ordered in 2016. Then, depending on which group
--the customer is in, he will target the customer with
--different sales materials.
--The customer grouping categories are 0 to 1,000, 1,000 to
--5,000, 5,000 to 10,000, and over 10,000.
--A good starting point for this query is the answer from
--the problem “High-value customers - total orders. We
--don’t want to show customers who don’t have any orders
--in 2016.
--Order the results by CustomerID.



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
FROM		Customers C JOIN Orders O
ON			C.CustomerID = O.CustomerID JOIN [Order Details] OD
ON			OD.OrderID = O.OrderID
WHERE		O.OrderDate BETWEEN '19960101' AND '19961231'
GROUP BY	C.CustomerID, C.CompanyName;
