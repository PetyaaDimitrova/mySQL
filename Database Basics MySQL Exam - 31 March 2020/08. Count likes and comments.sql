select p.id as photo_id, count(distinct l.id) as likes_count,  count(distinct c.id) as comments_count  from photos as p 
left join comments as c ON c.photo_id = p.id
left join likes as l ON l.photo_id = p.id
group by photo_id
order by likes_count desc, comments_count  desc, photo_id;