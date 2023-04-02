DROP DATABASE IF EXISTS  soccer_db;
CREATE DATABASE soccer_db;
\c soccer_db

-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- will be written differently from all the other files because of exporting, result is the same


CREATE TABLE "season" (
    "id" SERIAL PRIMARY KEY ,
    "name" text   NOT NULL,
    "start_date" date   NOT NULL,
    "end_date" date   NOT NULL
   
);

CREATE TABLE "team" (
    "id" SERIAL PRIMARY KEY ,
    "name" text   NOT NULL
  
);

CREATE TABLE "player" (
    "id" SERIAL PRIMARY KEY ,
    "team_id" int   NOT NULL,
    "name" text   NOT NULL
);

CREATE TABLE "referee" (
    "id" SERIAL PRIMARY KEY ,
    "name" text   NOT NULL
);

CREATE TABLE "match" (
    "id" SERIAL PRIMARY KEY,
    "season_id" int   NOT NULL,
    "team1_id" int   NOT NULL,
    "team2_id" int   NOT NULL,
    "referee1_id" int   NOT NULL,
    "referee2_id" int   NOT NULL
);

CREATE TABLE "goal" (
    "id" SERIAL PRIMARY KEY,
    "match_id" int   NOT NULL,
    "player_id" int   NOT NULL
);

CREATE TABLE "result" (
    "id" SERIAL PRIMARY KEY  ,
    "match_id" int   NOT NULL,
    "winner" int   NOT NULL
);

ALTER TABLE "player" ADD CONSTRAINT "fk_player_team_id" FOREIGN KEY("team_id")
REFERENCES "team" ("id");

ALTER TABLE "match" ADD CONSTRAINT "fk_match_season_id" FOREIGN KEY("season_id")
REFERENCES "season" ("id");

ALTER TABLE "match" ADD CONSTRAINT "fk_match_team1_id" FOREIGN KEY("team1_id")
REFERENCES "team" ("id");

ALTER TABLE "match" ADD CONSTRAINT "fk_match_team2_id" FOREIGN KEY("team2_id")
REFERENCES "team" ("id");

ALTER TABLE "match" ADD CONSTRAINT "fk_match_referee1_id" FOREIGN KEY("referee1_id")
REFERENCES "referee" ("id");

ALTER TABLE "match" ADD CONSTRAINT "fk_match_referee2_id" FOREIGN KEY("referee2_id")
REFERENCES "referee" ("id");

ALTER TABLE "goal" ADD CONSTRAINT "fk_goal_match_id" FOREIGN KEY("match_id")
REFERENCES "match" ("id");

ALTER TABLE "goal" ADD CONSTRAINT "fk_goal_player_id" FOREIGN KEY("player_id")
REFERENCES "player" ("id");

ALTER TABLE "result" ADD CONSTRAINT "fk_result_match_id" FOREIGN KEY("match_id")
REFERENCES "match" ("id");

ALTER TABLE "result" ADD CONSTRAINT "fk_result_winner" FOREIGN KEY("winner")
REFERENCES "team" ("id");

