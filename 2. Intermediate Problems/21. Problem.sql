-- Total customers per country/city

--In the Customers table, show the total number of customers per Country and City.

SELECT		Country,
			    City,
			    COUNT(DISTINCT CustomerID)
FROM		  Customers
GROUP BY	Country, City
ORDER BY	Country, City;
