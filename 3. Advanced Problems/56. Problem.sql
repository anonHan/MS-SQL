--56. Customers with multiple orders in 5 day period

--There are some customers for whom freight is a major
--expense when ordering from Northwind.
--However, by batching up their orders, and making one
--larger order instead of multiple smaller orders in a short
--period of time, they could reduce their freight costs
--significantly.
--Show those customers who have made more than 1 order
--in a 5 day period. The sales people will use this to help
--customers reduce their costs.



;WITH Res AS ( SELECT		InitialOrder.CustomerID
							,InitialOrderID = InitialOrder.OrderID
							,InitialOrderDate = InitialOrder.OrderDate ,NextOrderID = NextOrder.OrderID
							,NextOrderDate = NextOrder.OrderDate
							,DaysBetween = DATEDIFF(day,InitialOrder.OrderID,NextOrder.OrderID)
				FROM		Orders InitialOrder JOIN Orders NextOrder
				ON			InitialOrder.CustomerID = NextOrder.CustomerID
				WHERE		InitialOrder.OrderID < NextOrder.OrderID
			)
SELECT	*
FROM	Res 
WHERE	DaysBetween<=5;
