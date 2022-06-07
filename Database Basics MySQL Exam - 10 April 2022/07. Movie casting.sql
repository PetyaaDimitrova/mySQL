select concat(first_name, ' ', last_name) as full_name , concat(reverse(last_name) , length(last_name) , '@cast.com'), 
(select timestampdiff(year, birthdate , '2022-12-31' ) as age), height from actors as a
where not exists (SELECT m.actor_id FROM movies_actors as m WHERE m.actor_id = a.id) order by height asc;