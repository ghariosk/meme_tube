DROP TABLE IF EXISTS meme;

CREATE TABLE meme (
id SERIAL PRIMARY KEY,
title VARCHAR,
url VARCHAR,
genre VARCHAR,
description VARCHAR
);



INSERT into meme (title, url ,genre, description) VALUES ('tomato' , 'https://www.youtube.com/watch?v=T0xVthFSJBg', 'Cooking', 'How to slice a tomato');