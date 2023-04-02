-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic


CREATE TABLE airline
(id SERIAL PRIMARY KEY,
 name text NOT NULL);

CREATE TABLE city
(
  id SERIAL PRIMARY KEY,
  name text NOT NULL
);

CREATE TABLE country (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id int REFERENCES airline,
  from_city int REFERENCES city,
  from_country int REFERENCES country,
  to_city int REFERENCES city,
  to_country int REFERENCES country
);


INSERT INTO airline 
  (name)
VALUES
 ('United'),('British Airways'),('Delta'),('TUI Fly Belgium'),('Air China'),('American Airlines'),('Avianca Brasil');
 

INSERT INTO country
  (name)
VALUES
 ('United States'),('Japan'),('France'), ('China'),('UAE'),('Chile'), ('Brazil'),('Mexico'),('Morocco'),('United Kingdom')
 ; 


 
INSERT INTO city
  (name)
VALUES
('Las Vegas'),
 ('Washington DC'), ('Tokyo'),
('Los Angeles'), ('Seattle'),('Paris'),('Charlotte'),('Sao Paolo'),('New Orleans'),('Chicago'),('Mexico City'),('Casablanca'),('London'); 
 
 --To use a single table twice in a query by giving it two names, in the case below, city1 and city2 are aliases like so;

-- The aliases are often introduced with the keyword AS.
--You also normally specify a join condition (for without it, you get the Cartesian Product of the table joined with itself). For preference you use the explicit JOIN notation.

 --SELECT first_name, airline.name, city1.name AS from_city, city2.name AS to_city FROM tickets 
--  JOIN airline ON airline_id = airline.id
-- JOIN city city1 ON from_city = city1.id
-- JOIN city city2 ON to_city = city2.id;

INSERT INTO tickets
  (first_name, last_name, seat, departure, arrival, airline_id, from_city, from_country, to_city, to_country)
VALUES
 ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 1,5, 1),
  ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 2, 2, 13, 10),


  -- ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
  -- ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
  -- ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
  -- ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
  -- ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
  -- ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
  -- ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
  -- ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
  -- ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
  -- ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');