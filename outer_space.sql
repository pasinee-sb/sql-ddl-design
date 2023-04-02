-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space



CREATE TABLE be_orbited
(
 id SERIAL PRIMARY KEY,
 name text NOT NULL
);

CREATE TABLE galaxy
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INT REFERENCES be_orbited,
  galaxy INT REFERENCES galaxy
  
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  planet_id INT REFERENCES planets
);

INSERT INTO be_orbited
  (name)
VALUES ('The Sun'),('Proxima Centauri'),('Gliese 876');

INSERT INTO galaxy
  (name)
VALUES ('Milky Way');


INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy)
VALUES

  ('Earth', 1.00,1,1),
  ('Mars', 1.88,1,1),
  ('Venus', 0.62,1,1),
  ('Neptune', 164.8,1,1),
  ('Proxima Centauri b', 0.03,2,1),
  ('Gliese 876 b', 0.23,3,1);

INSERT INTO moons
  (name,planet_id)
VALUES ('The Moon',1),('Phobos',2),('Deimos',2),('Naiad',4),('Thalassa',4),('Despina',4);








