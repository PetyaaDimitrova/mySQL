select max(sk.speed) as max_speed, tw.name as town_name from skills_data as sk 
right join players as p ON p.skills_data_id = sk.id
right join teams as t ON t.id = p.team_id
right join stadiums as st ON t.stadium_id = st.id
right join towns as tw ON tw.id = st.town_id
where t.name != 'Devify'
group by tw.name
order by max_speed desc , town_name;
