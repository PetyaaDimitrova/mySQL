delimiter *
create function udf_game_info_by_name (game_name VARCHAR (20))
returns TEXT
deterministic
begin 
 return concat('The ',  game_name, ' is developed by a ', (select t.name from teams as t join games as g ON g.team_id = t.id
where g.name = game_name), ' in an office with an address ' , (select a.name as gameName from games as g
 join teams as t ON t.id = g.team_id
 join offices as o ON t.office_id = o.id
 join addresses as a ON a.id = o.address_id
where g.name = game_name) ); 
end;
*