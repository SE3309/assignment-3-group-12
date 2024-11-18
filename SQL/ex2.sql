USE videogamereccomender;

-- Create Genre table
CREATE TABLE Genre (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(50) NOT NULL
);

-- Describe Genre table
DESC Genre;

create table Admin (
	admin_id INT PRIMARY KEY
);
DESC admin;

create table Studio (
	studio_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    head_location VARCHAR(50) NOT NULL,
    description VARCHAR(50) NOT NULL
);
DESC Studio;

CREATE TABLE VideoGame (
    game_id INT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    genre_id INT,
    release_date DATE,
    platform VARCHAR(50) NOT NULL,
    studio_id INT,
    publisher VARCHAR(50) NOT NULL,
    FOREIGN KEY (genre_id) REFERENCES Genre(genre_id),
    FOREIGN KEY (studio_id) REFERENCES Studio(studio_id)
);
DESC VideoGame;
