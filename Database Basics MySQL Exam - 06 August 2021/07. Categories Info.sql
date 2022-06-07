select c.name, count(c.name) as games_count , round(avg(g.budget),2), max(rating) as max_rating  from games_categories as gc
join categories as c ON gc.category_id = c.id
join games as g ON g.id = gc.game_id
group by c.name 
having max_rating >= 9.5
order by games_count desc , c.name;