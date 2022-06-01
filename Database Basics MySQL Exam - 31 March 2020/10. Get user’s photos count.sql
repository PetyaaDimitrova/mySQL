delimiter *
create function udf_users_photos_count (username VARCHAR(30))
returns INT 
deterministic
begin 
 return (select count(up.user_id) as c from users as u
join users_photos as up ON up.user_id = u.id
where u.username = username );
end;
*