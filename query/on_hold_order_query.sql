SELECT
	o.orderDate,
	DATEDIFF(curdate(), o.orderDate) AS delay,
	o.orderNumber,
	c.contactLastName,
	c.contactLastName,
	SUM(quantityOrdered*priceEach) AS totalOrdered,
	o.comments
FROM
	orders AS o
JOIN
	orderdetails AS od
ON
	od.orderNumber = o.orderNumber
JOIN
	customers AS c
ON
	c.customerNumber = o.customerNumber
WHERE
	status = 'on hold'
GROUP BY
	o.orderNumber;
