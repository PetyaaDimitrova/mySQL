select c.name , count(m.id) as movies_count  from countries as c
join movies as m ON m.country_id = c.id
group by m.country_id
having movies_count >= 7
order by c.name desc;