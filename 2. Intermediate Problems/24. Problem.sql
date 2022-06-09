-- 24. Customer list by region

-- A salesperson for Northwind is going on a business trip to visit customers, and would like to see a list of all
-- customers, sorted by region, alphabetically. However, he wants the customers with no region (null in
-- the Region field) to be at the end, instead of at the top, where you’d normally find the null values. Within the
-- same region, companies should be sorted by CustomerID.

SELECT		CustomerID, CompanyName, Region
FROM		Customers
ORDER BY	(CASE 
				WHEN Region IS NOT NULL
				THEN 1
				ELSE 0
			END) DESC;
