update coaches as c
set c.coach_level = c.coach_level + 1 where  
c.id IN(select coach_id from players_coaches)
and first_name LIKE 'A%'
;