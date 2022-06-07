delimiter %%
create procedure udp_update_budget(min_game_rating INT)
begin
update games as g 
set budget = budget + 100000 ,  release_date = DATE_SUB(release_date,INTERVAL -1 YEAR) 
where not exists (SELECT game_id FROM games_categories as gc WHERE gc.game_id = g.id)
and release_date is not null and rating > min_game_rating;
end;
%%