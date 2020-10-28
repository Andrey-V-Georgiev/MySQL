# 02 INSERT
 INSERT INTO products_stores (product_id, store_id)
 (
	select p.id, 1 
	from products p
	left join products_stores ps on p.id <> ps.product_id
	group by p.id
 );

SELECT store_id, s.name, p.name, product_id FROM products_stores
JOIN products p ON p.id = products_stores.product_id
JOIN stores s ON products_stores.store_id = s.id
ORDER BY product_id, store_id;

# UPDATE
UPDATE 
employees AS e
inner join stores as s on e.store_id = s.id 
SET c.comment = (CASE
	WHEN c.id % 2 = 0 THEN 'Very good article.'
	WHEN c.id % 3 = 0 THEN 'This is interesting.'
	WHEN c.id % 5 = 0 THEN 'I definitely will read the article again.'
	WHEN c.id % 7 = 0 THEN 'The universe is such an amazing thing.'
	ELSE c.comment
END)
WHERE year(e.hire_date) > 2003
and s.name <> 'Cardguard'
and s.name <> 'Veribet';

# DELETE
DELETE FROM employees as e 
WHERE e.salary >= 6000
AND e.manager_id is not null;

SELECT first_name, salary, hire_date, id
FROM employees;





















































 
 