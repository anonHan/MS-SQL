--39. Orders - accidental double-entry details
--Based on the previous question, we now want to show
--details of the order, for orders that match the above
--criteria.


SELECT		O.Orderid,  OD.Quantity,COUNT(O.OrderID)
FROM		Orders O JOIN [Order Details] OD
ON			O.OrderID = OD.OrderID
WHERE		OD.Quantity >= 60 
GROUP BY	O.OrderID, OD.Quantity
HAVING		COUNT(O.OrderID) > 1
ORDER BY	O.OrderID
