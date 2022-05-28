delimiter *
create function udf_stadium_players_count (stadium_name VARCHAR(30))
returns INT 
deterministic
begin 
 return (select count(p.id) from players as p
right join teams as t ON t.id = p.team_id
right join stadiums as st ON t.stadium_id = st.id
where st.name = stadium_name);
end;
*