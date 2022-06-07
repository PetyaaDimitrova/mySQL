delete from countries as c
where not exists (SELECT country_id FROM movies as m WHERE m.country_id = c.id);