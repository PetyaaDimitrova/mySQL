delimiter %%
create procedure udp_find_playmaker(min_dribbling_points INT, team_name VARCHAR(45))
begin
select concat(p.first_name , ' ', p.last_name) as 'full_name' , p.age, p.salary, dribbling , speed as speedy,  t.name from players as p
join skills_data as sc ON sc.id = p.skills_data_id
join teams as t ON t.id = p.team_id
where t.name = team_name and dribbling > min_dribbling_points and speed > (select avg(speed) from skills_data)
order by speed desc limit 1;
end;
%%