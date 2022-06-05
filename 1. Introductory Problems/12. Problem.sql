-- 12. Employees full name

-- Show the FirstName and LastName columns from the Employees table, and then create a new column called
-- FullName, showing FirstName and LastName joined together in one column, with a space in-between.

SELECT	FirstName, LastName, CONCAT(FirstName,' ',LastName) as FullName
FROM	Employees;
