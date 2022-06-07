select g.name ,release_date, concat(substring(description, 1,10) , '...') as summary , 
(
 CASE 
        WHEN extract(month from release_date) between 01 and 03 THEN 'Q1'
        WHEN extract(month from release_date) between 04 and 06 THEN 'Q2'
        WHEN extract(month from release_date) between 07 and 09 THEN 'Q3'
        WHEN extract(month from release_date) between 10 and 12 THEN 'Q4'
        ELSE 1
    END
 ) as quarter,
 t.name as team_name  from games as g 
join teams as t ON t.id = g.team_id
where extract(year from release_date) = 2022
and extract(month from release_date) % 2 = 0
and g.name like '%2'
order by quarter;