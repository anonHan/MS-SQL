-- Categories, and the total products in each category

-- For this problem, we’d like to see the total number of products in each category. Sort the results by the total
-- number of products, in descending order.


SELECT		C.CategoryName, 
			COUNT(DISTINCT P.ProductID)
FROM		Categories C 
LEFT JOIN	Products P 
ON			P.CategoryID = C.CategoryID
GROUP BY	C.CategoryName 
ORDER BY	C.CategoryName;
