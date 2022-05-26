create table countries(
id INT PRIMARY KEY auto_increment,
name VARCHAR(45)
);

create table towns(
id INT PRIMARY KEY auto_increment,
name VARCHAR(45),
country_id INT NOT NULL,
constraint fk_towns_countries
foreign key (country_id)
references countries(id)
);

create table stadiums(
id INT PRIMARY KEY auto_increment,
name VARCHAR(45),
capacity INT NOT NULL,
town_id INT NOT NULL,
constraint fk_stadiums_towns
foreign key (town_id)
references towns(id)
);

create table teams(
id INT PRIMARY KEY auto_increment,
name VARCHAR(45),
established DATE NOT NULL,
fan_base BIGINT NOT NULL default 0,
stadium_id INT NOT NULL ,
constraint fk_teams_stadiums
foreign key (stadium_id)
references stadiums(id)
);

create table skills_data(
id INT PRIMARY KEY auto_increment,
dribbling INT default 0,
pace int default 0,
passing INT default 0,
shooting INT default 0,
speed INT default 0,
strength INT default 0
);

create table coaches(
id INT PRIMARY KEY auto_increment,
first_name VARCHAR (10) NOT NULL,
last_name VARCHAR (20) NOT NULL,
salary DECIMAL(10,2) NOT NULL default 0,
coach_level INT NOT NULL default 0
);

create table players(
id INT PRIMARY KEY auto_increment,
first_name VARCHAR (10) NOT NULL,
last_name VARCHAR (20) NOT NULL,
age INT not null default 0,
position CHAR(1) not null,
salary DECIMAL(10,2) not null default 0,
hire_date DATETIME,
skills_data_id INT not null,
team_id INT,
constraint fk_players_skills
foreign key (skills_data_id)
references skills_data(id),
constraint fk_players_teams
foreign key (team_id)
references teams(id)
);

create table players_coaches(
player_id INT, 
coach_id INT,
constraint fk_maping_players
foreign key (player_id)
references players(id),
constraint fk_maping_coaches
foreign key (coach_id)
references coaches(id),
constraint fkmappingTable  primary key(player_id, coach_id)
);
