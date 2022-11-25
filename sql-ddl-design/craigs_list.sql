

DROP DATABASE IF EXISTS  craigslist_db;

CREATE DATABASE craigslist_db;

\c craigslist_db

CREATE TABLE regions (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  preferred_region INTEGER REFERENCES regions (id) NOT NULL,
  username TEXT NOT NULL,
  password TEXT NOT NULL,
  email TEXT NOT NULL
);

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  content TEXT NOT NULL,
  poster INTEGER REFERENCES users (id) NOT NULL,
  location TEXT NOT NULL,
  region INTEGER REFERENCES regions (id) NOT NULL,
  category INTEGER REFERENCES categories (id) NOT NULL
);

