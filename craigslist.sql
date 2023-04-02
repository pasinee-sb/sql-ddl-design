DROP DATABASE IF EXISTS craigslist_db;
CREATE DATABASE craigslist_db;
\c craigslist_db

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    name text   NOT NULL
);

CREATE TABLE locations (
    id SERIAL PRIMARY KEY,
    name text   NOT NULL

);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    pref_reg int   NOT NULL
  
);

CREATE TABLE category (
    id SERIAL PRIMARY KEY,
    name text   NOT NULL
);

CREATE TABLE "posts" (
    id SERIAL PRIMARY KEY,
    user_id int   REFERENCES users,
    title text   NOT NULL,
    location_id int   REFERENCES locations,
    region_id int  REFERENCES regions,
    category_id int  REFERENCES category
);

