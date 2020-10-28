select 
first_name,
middle_name,
last_name,
salary,
hire_date
from employees
order by hire_date desc;

select 
	prod.name as product_name,
	price,
	prod.best_before,
	concat(substring(prod.description,1,10),'...') as short_description,   
	pic.url 
from pictures pic
inner join products prod on pic.id = prod.picture_id
where char_length(prod.description) > 100
and YEAR(pic.added_on) < 2019
and prod.price > 20
order by prod.price desc;


select
	s.name,
	count(p.id) as product_count,
	round(avg(p.price), 2) as `avg`
from stores s 
left join products_stores ps on s.id = ps.store_id
left join products p on ps.product_id = p.id
group by s.name
order by product_count desc, `avg` desc, s.id;

select
	concat(e.first_name, ' ', e.last_name),
	s.name, 
	a.name,
	e.salary
from employees e
inner join stores s on e.store_id = s.id
inner join addresses a on s.address_id = a.id
where e.salary < 7000
and locate('a', a.name) > 0
and char_length(s.name) > 5;

select
	reverse(s.name),
	concat(upper(t.name),'-',a.name),
	count(e.id),
	min(p.price) as min_price,
	count(p.id),
•	newest_pic – in a specific format

from employees e
inner join stores s on e.store_id = s.id
inner join addresses a on s.address_id = a.id
inner join towns t on a.town_id = t.id
inner join products_stores ps on s.id = ps.store_id
inner join products p on ps.product_id = p.id

where min(p.price) > 10 
group by s.name
order by s.name,  min_price;






















































































