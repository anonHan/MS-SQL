--55. First order in each country

--Looking at the Orders table—we’d like to show details
--for each order that was the first in that particular country,
--ordered by OrderID.
--So, we need one row per ShipCountry, and CustomerID,
--OrderID, and OrderDate should be of the first order from
--that country.


SELECT		O.ShipCountry, MIN(O.OrderDate) AS OrdeDate
INTO		#Temp 
FROM		Customers C JOIN Orders O 
ON			C.CustomerID = O.CustomerID
GROUP BY	O.ShipCountry;

SELECT		T.ShipCountry,C.CustomerID, O.OrderID, T.OrdeDate
FROM		Orders O JOIN #Temp T 
ON			T.ShipCountry = O.ShipCountry AND T.OrdeDate = O.OrderDate  JOIN Customers C
ON			C.CustomerID = O.CustomerID
ORDER BY	T.ShipCountry ASC;
