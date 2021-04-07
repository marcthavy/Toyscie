SELECT p.productLine `Catégorie`, SUM(od.quantityOrdered) `Produits vendus`, YEAR(o.orderDate) `Année`,
	CASE WHEN c.country = 'UK' THEN 'United Kingdom' ELSE c.country END `Pays`
FROM orders o
JOIN orderdetails od
ON o.orderNumber = od.orderNumber
JOIN customers c
ON o.customerNumber = c.customerNumber
JOIN products p
ON p.productCode = od.productCode
JOIN
	(SELECT DISTINCT YEAR(o.orderDate) Year
    FROM orders o
    ORDER BY YEAR(o.orderDate) DESC
    LIMIT 2) LastYear
ON YEAR(o.orderDate) = LastYear.Year
GROUP BY `Catégorie`, `Pays`, `Année`;