create table addresses(
id INT auto_increment primary key,
name VARCHAR(50) not null
);

create table categories(
id INT auto_increment primary key,
name VARCHAR(10) not null
);

create table offices(
id INT auto_increment primary key,
workspace_capacity INT not null,
website VARCHAR(50) ,
address_id INT not null,
constraint fk_offices_addresses
foreign key (address_id)
references addresses(id)
);

create table employees(
id INT auto_increment primary key,
first_name VARCHAR (30) not null,
last_name VARCHAR (30) not null,
age INT not null,
salary DECIMAL (10,2) not null,
job_title VARCHAR(20) not null,
happiness_level CHAR(1) not null
);

create table teams(
id INT auto_increment primary key,
name VARCHAR(40) not null,
office_id INT not null,
leader_id INT not null unique,
constraint fk_teams_offices
foreign key (office_id)
references offices(id),
constraint fk_teams_employees
foreign key (leader_id)
references employees(id)
);

create table games(
id INT auto_increment primary key,
name VARCHAR(50) not null unique,
`description` TEXT,
rating FLOAT not null default 5.5,
budget DECIMAL (10,2) not null,
release_date DATE,
team_id INT not null,
constraint fk_teams_games
foreign key (team_id)
references teams(id)
);

create table games_categories(
game_id INT not null,
category_id INT not null,
constraint fk_gk_games
foreign key (game_id)
references games(id),
constraint fk_gk_category
foreign key (category_id)
references categories(id),
constraint fkmappingTable primary key(game_id, category_id)
);