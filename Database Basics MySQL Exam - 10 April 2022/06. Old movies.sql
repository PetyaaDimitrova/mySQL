select i.id, m.title, runtime, budget, release_date from movies_additional_info as i
join movies as m ON m.movie_info_id = i.id
where extract(YEAR from release_date) between 1996 and 1999
order by runtime, id LIMIT 20;