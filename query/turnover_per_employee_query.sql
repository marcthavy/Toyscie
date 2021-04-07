SELECT
	e.EmployeeNumber,
    e.lastName,
    o.orderDate,
    od.quantityOrdered*priceEach AS CA
FROM
    employees AS e
JOIN
	customers AS c
ON
	e.employeeNumber = c.salesRepEmployeeNumber
JOIN
	orders AS o
ON
	c.customerNumber=o.customerNumber
JOIN
	orderdetails AS od
ON
	od.orderNumber = o.orderNumber;
