-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music



CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name text 
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT 
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  artist1_id int REFERENCES artists,
  artist2_id int REFERENCES artists,
  album TEXT NOT NULL,
  producer1_id int REFERENCES producers,
  producer2_id int REFERENCES producers
);


INSERT INTO artists
(name)
VALUES 
('Hanson'),('Queen'),('Mariah Cary'),('Boyz II Men'),('Lady Gaga'),('Bradley Cooper'),
('Nickelback');

INSERT INTO producers
(name)
VALUES 
('Dust Brothers'),('Stephen Lironi'),('Roy Thomas Baker'),('Walter Afanasieff'),('Benjamin Rice'),('Rick Parashar');

INSERT INTO songs
(title, duration_in_seconds, release_date, artist1_id,artist2_id, album, producer1_id, producer2_id)
VALUES
  ('MMMBop', 238, '04-15-1997', 1,NULL, 'Middle of Nowhere', 1,2),
  ('Bohemian Rhapsody', 355, '10-31-1975', 2,NULL, 'A Night at the Opera', 3,NULL),
  ('One Sweet Day', 282, '11-14-1995', 3,4, 'Daydream', 4,NULL),
  ('Shallow', 216, '09-27-2018', 5,6, 'A Star Is Born',5,NULL),
  ('How You Remind Me', 223, '08-21-2001', 7,NULL, 'Silver Side Up', 6,NULL);

-- To show data on 2 artists(2 of the same values from the same table), use alias method like so;

-- SELECT songs.title, art1.name AS Artist_1, art2.name AS artist_2 
-- FROM songs 
-- JOIN artists art1 ON artist1_id= art1.id 
-- JOIN artists art2 ON artist2_id = art2.id;


  -- ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),
  -- ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),
  -- ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
  -- ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),
  -- ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}');
