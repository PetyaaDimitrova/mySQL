select p.id ,p.date as date_and_time ,p.description , count(c.photo_id) as commentsCount from photos as p
join comments as c ON c.photo_id = p.id
group by c.photo_id
order by commentsCount desc, p.id
limit 5;