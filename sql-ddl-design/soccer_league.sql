DROP DATABASE IF EXISTS  soccer_league_db;

CREATE DATABASE soccer_league_db;

\c soccer_league_db

CREATE TABLE seasons (
  id SERIAL PRIMARY KEY,
  start_date DATE NOT NULL,
  end_date DATE NULL
);

CREATE TABLE teams (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE players (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  team INTEGER REFERENCES teams (id) NOT NULL,
  season INTEGER REFERENCES seasons (id) NOT NULL,
  number INTEGER NOT NULL
);

CREATE TABLE matches (
  id SERIAL PRIMARY KEY,
  match_date DATE NOT NULL,
  season INTEGER REFERENCES seasons (id) NOT NULL,
  home_team INTEGER REFERENCES teams (id) NOT NULL,
  away_team INTEGER REFERENCES teams (id) NOT NULL,
  winning_team INTEGER REFERENCES teams (id) NULL
);

CREATE TABLE goals (
  id SERIAL PRIMARY KEY,
  player INTEGER REFERENCES players (id) NOT NULL,
  match INTEGER REFERENCES matches (id) NOT NULL,
  notes TEXT NULL
);

CREATE TABLE referees (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  match INTEGER REFERENCES matches (id) NOT NULL
);

CREATE TABLE rankings (
  id serial PRIMARY KEY,
  team INTEGER REFERENCES teams (id) NOT NULL,
  season INTEGER REFERENCES seasons (id) NOT NULL,
  ranking INTEGER NOT NULL
);