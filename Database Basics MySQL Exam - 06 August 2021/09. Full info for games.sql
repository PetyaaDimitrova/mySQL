select g.name, 
(
 CASE 
        WHEN g.budget < 50000 THEN 'Normal budget'
        ELSE 'Insufficient budget'
    END
 )  as budget_level ,t.name as team_name ,a.name as address_name from games as g
join teams as t ON g.team_id = t.id
join offices as o ON t.office_id = o.id
join addresses as a ON a.id = o.address_id
where not exists (SELECT game_id FROM games_categories as gc WHERE gc.game_id = g.id)
and release_date is null
order by g.name;