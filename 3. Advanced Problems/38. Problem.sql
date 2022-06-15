--38. Orders - accidental double-entry

--Janet Leverling, one of the salespeople, has come to you
--with a request. She thinks that she accidentally doubleentered a line item on an order, with a different
--ProductID, but the same quantity. She remembers that the
--quantity was 60 or more. Show all the OrderIDs with line
--items that match this, in order of OrderID.


SELECT		O.Orderid,  OD.Quantity,COUNT(O.OrderID)
FROM		Orders O JOIN [Order Details] OD
ON			O.OrderID = OD.OrderID
WHERE		OD.Quantity >= 60 
GROUP BY	O.OrderID, OD.Quantity
HAVING		COUNT(O.OrderID) > 1
ORDER BY	O.OrderID
