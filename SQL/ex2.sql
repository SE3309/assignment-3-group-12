USE videogamereccomender;

-- Create Genre table
CREATE TABLE Genre (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(50) NOT NULL
);

-- Describe Genre table
DESC Genre;

CREATE TABLE Admin (
	admin_id INT PRIMARY KEY
);
DESC admin;

CREATE TABLE Studio (
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

CREATE TABLE User (
	user_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    # password uses VARCHAR(255) to accomodate length of hashed password
    password VARCHAR(255) NOT NULL, 
    age INT,
    registration_date DATE
);
DESC User;

CREATE TABLE Rating (
	rating_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    game_id INT NOT NULL,
	FOREIGN KEY (user_id) REFERENCES User(user_id),
	FOREIGN KEY (game_id) REFERENCES VideoGame(game_id),
	review VARCHAR(1000),
    rating_date DATE
);
DESC Rating;

CREATE TABLE Recommendation (
	recommendation_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    game_id INT NOT NULL,
    reason VARCHAR(1000),
	FOREIGN KEY (user_id) REFERENCES User(user_id),
	FOREIGN KEY (game_id) REFERENCES VideoGame(game_id)
);
DESC Recommendation;

CREATE TABLE Wishlist (
	wishlist_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    game_id INT NOT NULL,
    added_date DATE,
    comments VARCHAR(1000),
	FOREIGN KEY (user_id) REFERENCES User(user_id),
	FOREIGN KEY (game_id) REFERENCES VideoGame(game_id)
);
DESC Wishlist;
