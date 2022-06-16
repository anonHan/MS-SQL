--41. Late orders
--Some customers are complaining about their orders
--arriving late. Which orders are late?


SELECT		O.OrderID, DATEDIFF(DAY,O.OrderDate,O.ShippedDate)
FROM		Orders O
WHERE		O.ShippedDate > O.RequiredDate;
