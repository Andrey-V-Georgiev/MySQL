#DROP SCHEMA `fsd`;

#CREATE SCHEMA `fsd`;

USE `fsd`;

#countries
CREATE TABLE `countries`(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL
);

#towns
CREATE TABLE `towns`(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    country_id INTEGER NOT NULL,
    CONSTRAINT fk_country_id FOREIGN KEY (country_id) REFERENCES countries(id)
);

#stadiums
CREATE TABLE `stadiums`(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    capacity INTEGER NOT NULL,
    town_id INTEGER NOT NULL,
    CONSTRAINT fk_town_id FOREIGN KEY (town_id) REFERENCES towns(id)
);

#teams
CREATE TABLE `teams` (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    established DATE NOT NULL,
    fan_base BIGINT NOT NULL DEFAULT 0,
    stadium_id INTEGER NOT NULL,
    CONSTRAINT fk_stadium_id FOREIGN KEY (stadium_id) REFERENCES stadiums(id)
);

#skils_data
CREATE TABLE `skills_data`(
	 id INTEGER PRIMARY KEY AUTO_INCREMENT,
     dribbling INTEGER DEFAULT 0,
     pace INTEGER DEFAULT 0,
     passing INTEGER DEFAULT 0,
     shooting INTEGER DEFAULT 0,
     speed INTEGER DEFAULT 0,
     strength INTEGER DEFAULT 0
);

#coaches
CREATE TABLE `coaches`(
	 id INTEGER PRIMARY KEY AUTO_INCREMENT,
     first_name VARCHAR(10) NOT NULL,
     last_name VARCHAR(20) NOT NULL,
     salary DECIMAL(10, 2) NOT NULL DEFAULT 0,
     coach_level INTEGER NOT NULL DEFAULT 0
);

#payers
CREATE TABLE`players` (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(10) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    age INTEGER NOT NULL DEFAULT 0,
    position CHAR(1) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL DEFAULT 0,
    hire_date DATETIME,
    skills_data_id INTEGER NOT NULL,
    team_id INTEGER,
    CHECK (position = 'A' OR position = 'M' OR position = 'D'),
    CONSTRAINT fk_skills_data_id FOREIGN KEY (skills_data_id) REFERENCES skills_data(id),
    CONSTRAINT fk_team_id FOREIGN KEY (team_id) REFERENCES teams(id)
);

#players_coaches
CREATE TABLE `players_coaches`(
	player_id INTEGER,
    coach_id INTEGER,
    CONSTRAINT fk_player_id FOREIGN KEY (player_id) REFERENCES players(id),
	CONSTRAINT fk_coach_id FOREIGN KEY (coach_id) REFERENCES coaches(id)
);












