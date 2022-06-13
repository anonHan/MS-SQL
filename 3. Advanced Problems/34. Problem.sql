--34. High-value customers - with discount

--Change the above query to use the discount when
--calculating high-value customers. Order by the total
--amount which includes the discount.


SELECT		C.CustomerID, 
			C.CompanyName, 
			SUM((OD.Quantity * OD.UnitPrice) * (1- OD.Discount)) AS AmountAfterDiscount				
FROM		Customers C JOIN Orders O 
ON			O.CustomerID = C.CustomerID JOIN [Order Details] OD 
ON			OD.OrderID = O.OrderID
WHERE		O.OrderDate BETWEEN '19960101' AND '19961231'
GROUP BY	C.CustomerID, 
			C.CompanyName
HAVING		SUM((OD.Quantity * OD.UnitPrice) * (1- OD.Discount)) > 15000
ORDER BY	AmountAfterDiscount DESC;
