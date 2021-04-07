SELECT
	p.productName,
	SUM(od.quantityOrdered) AS TotalQtyordered,
	p.quantityInStock AS Stock
FROM
	products AS p
JOIN
	orderdetails AS od
ON
	p.productCode = od.productCode
JOIN
	orders AS o
ON
	o.orderNumber=orderdetails.orderNumber
WHERE
	o.status = 'shipped' OR 'Resolved'
GROUP BY
	p.productName, p.quantityInStock
ORDER BY
	SUM(orderdetails.quantityOrdered) DESC
LIMIT 5;
