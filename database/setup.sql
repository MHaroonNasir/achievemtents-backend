DROP TABLE IF EXISTS user_sessions;
DROP TABLE IF EXISTS achievements;
DROP TABLE IF EXISTS games;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS users;


CREATE TABLE users (
    user_id INT GENERATED ALWAYS AS IDENTITY,
    steam_id VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    currency INT DEFAULT 100000,
    PRIMARY KEY (user_id)
);


CREATE TABLE games (
    instance_id INT GENERATED ALWAYS AS IDENTITY,
    app_id INT NOT NULL,
    game_name VARCHAR(255) NOT NULL,
    playtime INT NOT NULL,
    user_id INT NOT NULL,
    game_description VARCHAR(2550) NOT NULL,
    genres json[] NOT NULL,
    background_image VARCHAR(255) NOT NULL,
    PRIMARY KEY (app_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);


CREATE TABLE achievements (
    achievement_id INT GENERATED ALWAYS AS IDENTITY,
    achievement_name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    icon VARCHAR(255) NOT NULL,
    app_id INT NOT NULL,
    user_id INT NOT NULL,
    PRIMARY KEY (achievement_id),
    FOREIGN KEY (app_id) REFERENCES games (app_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);


CREATE TABLE items (
    item_id INT GENERATED ALWAYS AS IDENTITY,
    item_name VARCHAR(255) NOT NULL,
    price INT NOT NULL,
    item_icon VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (item_id)
);


CREATE TABLE user_sessions (
  sid varchar NOT NULL COLLATE "default",
  sess json NOT NULL,
  expire timestamp(6) NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "user_sessions" ADD CONSTRAINT "session_pkey" PRIMARY KEY ("sid") NOT DEFERRABLE INITIALLY IMMEDIATE;
CREATE INDEX "IDX_session_expire" ON "user_sessions" ("expire");


INSERT INTO items
    (item_name, price, item_icon, quantity)
VALUES
    ('Steam £5 Wallet Code', 5000, 'https://cdn.cloudflare.steamstatic.com/steamcommunity/public/images/clans/41316928/f7f5587c77587cc8ae5eb50e39defcbcc3acaa88.jpg', 10),
    ('Steam £10 Wallet Code', 10000, 'https://cdn.cloudflare.steamstatic.com/steamcommunity/public/images/clans/41316928/f7f5587c77587cc8ae5eb50e39defcbcc3acaa88.jpg', 10),
    ('Steam £15 Wallet Code', 25000, 'https://cdn.cloudflare.steamstatic.com/steamcommunity/public/images/clans/41316928/f7f5587c77587cc8ae5eb50e39defcbcc3acaa88.jpg', 10),
    ('Steam £25 Wallet Code', 32000, 'https://cdn.cloudflare.steamstatic.com/steamcommunity/public/images/clans/41316928/f7f5587c77587cc8ae5eb50e39defcbcc3acaa88.jpg', 10),
    ('Gingerbread House Decoration', 1200, 'https://community.cloudflare.steamstatic.com/economy/image/97c58bX8zwhvXgjKSAjB9RM9BTXPUDXeFj-L-X6MQvU1Dx_-6RPwei34n22Iv9VZjtGbVNMvq1djxjUmmVZdyIES1jtMhyc45MpC4-fP18d4OOzY62rBcGHSL6VpQLlr/360fx360f', 5),
    ('Pace Pete Decoration', 1500, 'https://community.cloudflare.steamstatic.com/economy/image/97c58bX8zwhvXgjKSAjB9RM9BTXPUDXeFj-L-X6MQvU1Dx_-6RPwei34n22Iv9VZjtGbVNMvq1djxjUmmVZdyIES1jtfmAIj1MBP-vHC7ZQsU-bGrzyIP3mI8pNQvPQ/360fx360f', 3),
    ('Vomitous Tots', 2000, 'https://community.cloudflare.steamstatic.com/economy/image/jsobcfQDmhizvpbTAOdHeug7O4L-U2fOLwxdx4kOevf-WAtkX9IJEJYyrFGaOwVCUw2r0E3iHmY7Iu6_MPyiXCI/360fx360f', 25),
    ('Customer Service', 1800, 'https://community.cloudflare.steamstatic.com/economy/image/jsobcfQDmhizvpbTAOdHeug7O4L-U2fOLwxdx4kOevf-WAtkX9IJEJYyrFGaOwVCUw2r0E3iGGU7Iu6_Y-Mgmy0/360fx360f', 15),
    ('Black Fedora', 4500, 'https://community.cloudflare.steamstatic.com/economy/image/a5HYp9Sw61Iks7TiNF57DFqTxPCXnhdgwCvwcWpEChTJEA/360fx360f', 5),
    ('Headset (Grey)', 1000, 'https://community.cloudflare.steamstatic.com/economy/image/a5HYp9Sw61Iks7TiNF57DFqT8t-NrXZ8zivwcWrTwGn96A/360fx360f', 5)

