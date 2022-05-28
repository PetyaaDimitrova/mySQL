select c.name , count(p.id) as total_count_of_players, sum(p.salary) as total_sum_of_salaries from players as p
right join teams as t ON t.id = p.team_id
right join stadiums as st ON t.stadium_id = st.id
right join towns as tw ON tw.id = st.town_id
right join countries as c ON c.id = tw.country_id
group by c.name
order by total_count_of_players desc, c.name ;