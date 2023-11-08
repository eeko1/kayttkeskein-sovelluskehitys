DROP DATABASE IF EXISTS mediashare;
CREATE DATABASE mediashare;
USE mediashare;


-- Create tables
CREATE TABLE Users (
  user_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  user_level_id INT NOT NULL,
  created_at TIMESTAMP NOT NULL
);

CREATE TABLE MediaItems (
  media_id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  filename VARCHAR(255) NOT NULL,
  filesize INT NOT NULL,
  media_type VARCHAR(255) NOT NULL,
  title VARCHAR(255) NOT NULL,
  description VARCHAR(255),
  created_at TIMESTAMP NOT NULL,
  PRIMARY KEY (media_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Comments (
  comment_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  media_id INT NOT NULL,
  user_id INT NOT NULL,
  comment_text TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  FOREIGN KEY (media_id) REFERENCES MediaItems(media_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Likes (
  like_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  media_id INT NOT NULL,
  user_id INT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  FOREIGN KEY (media_id) REFERENCES MediaItems(media_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- adding mock data users
INSERT INTO Users VALUES (260, 'VCHar', 'secret123', 'vchar@example.com', 1, null);
INSERT INTO Users VALUES (null, 'Donatello', 'secret234', 'dona@example.com', 1, null); 
INSERT INTO Users VALUES (null, 'Matt', 'secret345', 'Matt@example.com', 1, null);
INSERT INTO Users VALUES (null, 'Ibe', 'secret456', 'ibelius@example.com', 1, null);

-- add media items
INSERT INTO MediaItems (filename, filesize, title, description, user_id, media_type, created_at) 
  VALUES ('ffd8.jpg', 887574, 'Favorite drink', null, 260, 'image/jpeg', null),
        ('fcd8.jpg', 887574, 'Amazing drink', null, 261, 'image/jpeg', null),
        ('dbbd.jpg', 60703, 'Miika', 'My Photo', 262, 'image/jpeg', null),
        ('2f9b.jpg', 30635, 'Aksux and Jane', 'friends', 263, 'image/jpeg', null);

-- adding comments  
INSERT INTO Comments (media_id, user_id, comment_text, created_at) 
    VALUES (2, 260, 'Very cool drink!', null),
            (4, 262, 'You look extra handsome today!', null);


INSERT INTO Likes (media_id, user_id, created_at) 
    VALUES (1, 260, null),
           (2, 261, null),
           (3, 262, null); 