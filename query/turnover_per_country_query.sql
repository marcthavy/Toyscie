SELECT
	c.customerNumber,
	CASE WHEN c.country = 'UK' THEN 'United Kingdom' ELSE c.country END AS country,
	p.paymentDate,
	p.amount
FROM
	customers AS c
JOIN
	payments AS p
ON
	p.customerNumber = c.customerNumber

#Les 2 derniers mois finis

#WHERE paymentDate >= ADDDATE(ADDDATE(curdate(), INTERVAL -(DAY(curdate()-1)) DAY), INTERVAL -2 MONTH)
#AND paymentDate < ADDDATE(curdate(), INTERVAL -(DAY(curdate()-1)) DAY)

#Les 2 derniers mois finis + mois en cours

#WHERE orderDate >= ADDDATE(ADDDATE(curdate(), INTERVAL -(DAY(curdate()-1)) DAY), INTERVAL -2 MONTH)

#Mois en cours

#AND orderDate >= ADDDATE(curdate(), INTERVAL -(DAY(curdate()-1)) DAY)

#Les 2 derniers mois glissant

#AND orderDate >= ADDDATE(curdate(), INTERVAL -2 MONTH)

;
