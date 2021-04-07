SELECT
	orderDate AS `Période`,
	ROUND(DATEDIFF(orders.shippedDate,orders.orderDate),1) `Temps de traitement, en nbr de jours`
FROM
	orders;
