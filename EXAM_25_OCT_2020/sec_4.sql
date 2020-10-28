CREATE FUNCTION `udf_top_paid_employee_by_store`(store_name VARCHAR(50)) 
RETURNS VARCHAR(100)
BEGIN

	RETURN 	(
		select 
		concat(e.first_name, ' ', substring(e.middle_name,1,2),'.',e.last_name, ' works in store for ', floor(datediff(now(), e.hire_date) / 365) , ' years' )
		from stores s 
		inner join employees e on s.id = e.store_id
		where s.name = store_name
		order by e.salary desc
		limit 1
	);
END
SELECT udf_top_paid_employee_by_store('Stronghold') as 'full_info';
SELECT udf_top_paid_employee_by_store('Keylex') as 'full_info';

CREATE DEFINER=`root`@`localhost` PROCEDURE `udp_update_product_price`(address_name VARCHAR(50))
BEGIN
	update 
	addresses as a
	inner join stores as s on a.id = s.address_id
	inner join products_stores as ps on s.id = ps.store_id
	inner join products as p on ps.product_id = p.id
set p.price = 
	(case
		when substring(address_name,1,1) = '0' then p.price + 100
		when substring(address_name,1,1) <> '0' then p.price + 200
	end) 
where a.name = address_name; 
END

CALL udp_update_product_price('07 Armistice Parkway');
SELECT name, price FROM products WHERE id = 15;

CALL udp_update_product_price('1 Cody Pass');
SELECT name, price FROM products WHERE id = 17;


