select t.name as team_name, a.name as address_name, length(a.name) as count_of_characters from teams as t
join offices as o ON t.office_id = o.id
join addresses as a ON a.id = o.address_id
where o.website is not null
order by team_name, address_name
;