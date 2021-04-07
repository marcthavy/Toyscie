SELECT
	*
FROM 
	(SELECT
		YEAR(o.orderDate) AS Annee,
		MONTH(o.orderDate) AS Mois,
		DATE_FORMAT(o.orderDate,'%m-%Y') AS Bonnedate,
		o.orderDate AS Date,
		e.lastName AS Nom, 
		SUM(od.quantityOrdered*priceEach) AS CA
	FROM
		employees AS e
	JOIN
		customers AS c
	ON
		e.employeeNumber = c.salesRepEmployeeNumber
	JOIN
		orders AS o
	ON
		c.customerNumber = o.customerNumber
	JOIN
		orderdetails AS od
	ON
		od.orderNumber = o.orderNumber
	GROUP BY
		YEAR(o.orderDate), MONTH(o.orderDate), e.EmployeeNumber, o.orderDate, DATE_FORMAT(o.orderDate,'%m-%Y') 
	ORDER BY
		YEAR(o.orderDate), MONTH(o.orderDate), SUM(od.quantityOrdered*priceEach) DESC) AS Table1
WHERE
	(SELECT
		COUNT(*)
	FROM
		(SELECT
			YEAR(o.orderDate) AS Annee,
			MONTH(o.orderDate) AS Mois,
			DATE_FORMAT(o.orderDate,'%m-%Y') AS Bonnedate,
			o.orderDate AS Date,
			e.lastName AS Nom, 
			SUM(od.quantityOrdered*priceEach) AS CA
		FROM
			employees AS e
		JOIN
			customers c
		ON
			e.employeeNumber = c.salesRepEmployeeNumber
		JOIN
			orders AS o
		ON
			c.customerNumber=o.customerNumber
		JOIN
			orderdetails AS od
		ON
			od.orderNumber = o.orderNumber
		GROUP BY
			YEAR(o.orderDate), MONTH(o.orderDate), e.EmployeeNumber, o.orderDate, DATE_FORMAT(o.orderDate,'%m-%Y') 
		ORDER BY
			YEAR(o.orderDate), MONTH(o.orderDate), SUM(od.quantityOrdered*priceEach) DESC) Table2
	WHERE
		Table1.Annee = Table2.Annee
	AND
		Table1.Mois = Table2.Mois
	AND
		Table2.CA >= Table1.CA) <= 2 ;
