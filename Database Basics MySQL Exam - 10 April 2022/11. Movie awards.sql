delimiter %%
create procedure udp_award_movie(movie_title VARCHAR(50))
begin
update actors as a
JOIN movies_actors as ma ON a.id = ma.actor_id
JOIN movies as m ON m.id = ma.movie_id
set awards = awards + 1 
where m.title =movie_title;
end;
%%