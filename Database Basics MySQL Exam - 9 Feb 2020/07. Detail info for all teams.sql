select t.name as team_name, established, fan_base, (select count(*) from players where team_id = t.id) as players_count from teams as t
JOIN players as p ON p.team_id = t.id
group by t.id
order by players_count desc , fan_base desc;