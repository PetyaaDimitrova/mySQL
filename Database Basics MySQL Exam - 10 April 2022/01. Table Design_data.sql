create table countries(
id INT auto_increment primary key,
name VARCHAR (30) not null unique,
continent VARCHAR (30) not null,
currency VARCHAR (5) not null
); 

create table genres (
id INT auto_increment primary key,
name VARCHAR (50) not null unique
);

create table actors (
id INT auto_increment primary key,
first_name VARCHAR (50) not null,
last_name VARCHAR (50) not null,
birthdate DATE not null,
height INT,
awards INT,
country_id INT not null,
constraint fk_actors_countries
foreign key (country_id)
references countries(id)
);

create table  movies_additional_info (
id INT auto_increment primary key,
rating DECIMAL (10,2) not null,
runtime INT not null,
picture_url VARCHAR (80) not null,
budget DECIMAL (10,2),
release_date DATE not null,
has_subtitles tinyint(1),
`description` TEXT 
);

create table movies (
id INT auto_increment primary key,
title VARCHAR(70) not null unique,
country_id INT not null,
movie_info_id INT not null unique,
constraint fk_movies_countries
foreign key (country_id)
references countries(id),
constraint fk_movies_info
foreign key (movie_info_id)
references movies_additional_info(id)
);

create table movies_actors(
movie_id INT,
actor_id INT,
constraint fk_movies_mapping
foreign key (movie_id)
references movies(id),
constraint fk_actors_mapping
foreign key (actor_id)
references actors(id)
);

create table genres_movies (
genre_id INT,
movie_id INT,
constraint fk_movies_mapping2
foreign key (movie_id)
references movies(id),
constraint fk_genres_mapping
foreign key (genre_id)
references genres(id)
);