delimiter *
create function udf_actor_history_movies_count(full_name VARCHAR(50)) 
returns INT
deterministic
begin 
 return (select count(a.id) from actors as a
JOIN movies_actors as ma ON a.id = ma.actor_id
JOIN movies as m ON m.id = ma.movie_id
JOIN genres_movies as gm ON gm.movie_id = m.id
JOIN genres as g ON g.id = gm.genre_id
where concat(first_name, ' ', last_name) = full_name and g.name = 'History'
group by a.id );
end;
*