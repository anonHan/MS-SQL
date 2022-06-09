-- 30. Customers with no orders

-- There are some customers who have never actually placed an order. Show these customers.

SELECT			C.CustomerID, O.orderId
FROM			Customers C LEFT JOIN Orders O
ON				O.CustomerID = C.CustomerID
WHERE			O.OrderID IS NULL;
