insert into games (name, rating, budget, team_id) 
(
select substring(lower(reverse(name)), 1, length(name) - 1), id, leader_id * 1000, id from teams where id between 1 and 9
);