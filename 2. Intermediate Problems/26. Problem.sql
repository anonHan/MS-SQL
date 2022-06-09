-- 26. High freight charges - 2015

-- We're continuing on the question above on high freight charges. Now, instead of using all the orders we have, we
-- only want to see orders from the year 2015.

SELECT TOP 3	ShipCountry,AVG(Freight) as AverageFreight
FROM			Orders	
WHERE			YEAR(CONVERT(Date,OrderDate)) = 1998
GROUP BY		ShipCountry
ORDER BY		AVG(Freight) DESC;

-- I am using year 1998 instead of 2015, because the database did not have data for year 2015.
