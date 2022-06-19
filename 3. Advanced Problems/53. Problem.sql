--53. Countries with suppliers or customers,
--version 2
--The employees going on the business trip don’t want just
--a raw list of countries, they want more details. We’d like
--to see output like the below, in the Expected Results.


SELECT		DISTINCT S.Country AS SupplierCountry, 
			C.Country AS CustomerCountry
FROM		Suppliers S FULL JOIN Customers C
ON			C.Country = S.Country;

-- or
SELECT		S.Country
INTO		#SuppliersCountry
FROM		Suppliers S

SELECT		DISTINCT S.Country AS Suppliercountry, C.Country AS CustomerCountry
FROM		Customers C FULL OUTER JOIN #SuppliersCountry S
ON			S.Country = C.Country
