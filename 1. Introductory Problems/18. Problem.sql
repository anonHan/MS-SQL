-- 18. Products with associated supplier names

-- We’d like to show, for each product, the associated Supplier. Show the ProductID, ProductName, and the
-- CompanyName of the Supplier. Sort by ProductID. This question will introduce what may be a new concept,
-- the Join clause in SQL. The Join clause is used to join two or more relational database tables together in a logical way.


SELECT		p.ProductID, p.ProductName, s.CompanyName
FROM		  Products p 
			    INNER JOIN Suppliers s 
			    ON s.SupplierID = p.SupplierID;
