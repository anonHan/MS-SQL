--54. Countries with suppliers or customers version 3

--The output of the above is improved, but it’s still not ideal
--What we’d really like to see is the country name, the total
--suppliers, and the total customers.


-- Step 1: Get the number of customers in each country first
SELECT		C.Country,
			COUNT(C.CustomerID) AS TotalCustomers
INTO		#CustomerT
FROM		Customers C 
GROUP BY	C.Country;

-- Step 2: Get the number of suppliers in each country then
SELECT		S.Country,
			COUNT(S.SupplierID) AS TotalSuppliers
INTO		#SupplierT
FROM		Suppliers S 
GROUP BY	S.Country;

-- Step 3:Now join the result of step 1 and step 2 to get the desired result.
SELECT		COALESCE(C.Country,S.Country) AS Country,
			ISNULL(S.TotalSuppliers,0) AS TotalSuppliers,
			ISNULL(C.TotalCustomers,0) AS TotalCustomers
FROM		#CustomerT C FULL JOIN #SupplierT S
ON			S.Country = C.Country;
