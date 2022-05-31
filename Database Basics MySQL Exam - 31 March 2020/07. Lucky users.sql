select concat(id, ' ', username) as id_username , email from users as u
join users_photos as up ON up.user_id = u.id
where user_id = photo_id
order by id_username;