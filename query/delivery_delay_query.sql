SELECT
	analysedates.comments AS `Etat commandes`,
	COUNT(analysedates.orderNumber) AS `Nombre de commandes`
FROM 
	(SELECT
		orders.orderNumber,
		DATEDIFF(orders.shippedDate,orders.requiredDate) AS ecartdates,
	CASE 
		WHEN DATEDIFF(orders.shippedDate,orders.requiredDate)<0 THEN 'Date expédition antérieure à la date de livraison requise par le client'
		WHEN DATEDIFF(orders.shippedDate,orders.requiredDate)>0 THEN 'Date expédition ultérieure à la date de livraison requise par le client'
		WHEN DATEDIFF(orders.shippedDate,orders.requiredDate) IS NULL THEN 'Commandes non expédiées'
		ELSE 'Date expédition égale à la date livraison requise par le client'
	END comments
	FROM
		orders
	) AS analysedates
GROUP BY
	analysedates.comments
ORDER BY
	`Nombre de commandes` DESC;
