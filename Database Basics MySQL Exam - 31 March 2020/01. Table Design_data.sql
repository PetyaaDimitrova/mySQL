

create table users(
id INT auto_increment primary key,
username VARCHAR(30) not null unique,
`password` VARCHAR(30) not null,
email VARCHAR(50) not null,
gender CHAR(1) not null,
age INT not null,
job_title VARCHAR(40) not null,
ip VARCHAR(30) not null
);

create table addresses(
id INT auto_increment primary key,
address VARCHAR(30) not null,
town VARCHAR(30) not null,
country VARCHAR(30) not null,
user_id INT not null,
constraint fk_addresses_users
foreign key (user_id)
references users(id)
);

create table photos(
id INT auto_increment primary key,
description TEXT not null,
date DATETIME not null,
views INT not null default 0
);

create table comments(
id INT auto_increment primary key,
comment VARCHAR(255) not null,
date DATETIME not null,
photo_id INT not null,
constraint fk_comments_photos
foreign key (photo_id)
references photos(id)
);

create table likes(
id INT auto_increment primary key,
photo_id INT not null,
user_id INT not null,
constraint fk_likes_photos
foreign key (photo_id)
references photos(id),
constraint fk_likes_users
foreign key (user_id)
references users(id)
);


create table users_photos(
user_id INT not null,
photo_id INT not null,
constraint fk_maping_users
foreign key (user_id)
references users(id),
constraint fk_maping_photos
foreign key (photo_id)
references photos(id)
);

