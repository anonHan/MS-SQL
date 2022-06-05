-- 8. Orders shipping to France or Belgium
-- Looking at the Orders table, there’s a field called
-- ShipCountry. Write a query that shows the OrderID,
-- CustomerID, and ShipCountry for the orders where the ShipCountry is either France or Belgium.

SELECT	OrderID, CustomerID, ShipCountry
FROM	Orders
WHERE	ShipCountry IN ('France','Belgium');
