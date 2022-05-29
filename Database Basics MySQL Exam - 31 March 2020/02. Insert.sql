insert into addresses (address , town, country, user_id) 
(
select username, `password`, ip, age from users where gender = 'M'
);