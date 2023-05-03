DROP TABLE IF EXISTS users_games;
DROP TABLE IF EXISTS users_achievements;
DROP TABLE IF EXISTS achievements;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS games;

CREATE TABLE users (
    user_id INT GENERATED ALWAYS AS IDENTITY,
    steam_id VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    currency INT DEFAULT 0,
    PRIMARY KEY (user_id)
);

CREATE TABLE games (
<<<<<<< HEAD
    instance_id INT GENERATED ALWAYS AS IDENTITY,
    app_id INT NOT NULL,
    game_name VARCHAR(255) NOT NULL,
    playtime INT NOT NULL,
    user_id INT NOT NULL,
    PRIMARY KEY (instance_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
=======
    app_id INT GENERATED ALWAYS AS IDENTITY,
    game_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (app_id)
>>>>>>> 04287be2d76797c91043edb26b9316bebd350013
);

CREATE TABLE achievements (
    achievement_id INT GENERATED ALWAYS AS IDENTITY,
    achievement_name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    icon VARCHAR(255) NOT NULL,
    app_id INT NOT NULL,
    PRIMARY KEY (achievement_id),
    FOREIGN KEY (app_id) REFERENCES games (app_id)
);

CREATE TABLE users_games (
    user_id INT NOT NULL,
    app_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (app_id) REFERENCES games (app_id)
);

CREATE TABLE users_achievements (
    user_id INT NOT NULL,
    achievement_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (achievement_id) REFERENCES achievements (achievement_id)
);
