SELECT DATE_FORMAT(o.orderDate,'%M') Mois, MONTH(o.orderDate) `id Mois`,
	CAST(DATE_FORMAT(o.orderDate,'%Y%m') AS UNSIGNED) `id date`, DATE_FORMAT(o.orderDate,'%M %Y') `Période`,
	SUM(CASE WHEN CAST(DATE_FORMAT(o.orderDate,'%Y%m') AS UNSIGNED) BETWEEN 201900 AND 202000
		THEN od.quantityOrdered
		ELSE NULL
	END) `Année 2019`,
	SUM(CASE WHEN CAST(DATE_FORMAT(o.orderDate,'%Y%m') AS UNSIGNED) BETWEEN 202000 AND 202100
		THEN od.quantityOrdered
		ELSE NULL
	END) `Année 2020`,
	SUM(CASE WHEN CAST(DATE_FORMAT(o.orderDate,'%Y%m') AS UNSIGNED) BETWEEN 202100 AND 202200
		THEN od.quantityOrdered
		ELSE NULL
	END) `Année 2021`
FROM orders o
JOIN orderdetails od
ON o.orderNumber = od.orderNumber
GROUP BY `id date`, `Période`, Mois, `id Mois`
ORDER BY `id date` ASC; 