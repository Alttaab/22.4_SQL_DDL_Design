-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE classes
(
  id SERIAL PRIMARY KEY,
  class TEXT NOT NULL,
  description TEXT NULL
);

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE astro_bodies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  class_id INTEGER REFERENCES classes (id) NOT NULL,
  galaxy_id INTEGER REFERENCES galaxies (id) NOT NULL,
  description TEXT NULL
);

CREATE TABLE orbits
(
  id SERIAL PRIMARY KEY,
  body_id INTEGER REFERENCES astro_bodies (id),
  orbits_body_id INTEGER REFERENCES astro_bodies (id),
  orbital_period_in_years FLOAT NOT NULL
);

INSERT INTO classes
  (class, description)
VALUES
  ('Star', 'A star is an astronomical object comprising a luminous spheroid of plasma held together by its gravity.'),
  ('Planet', 'A planet is a large, rounded astronomical body that is neither a star nor its remnant.'),
  ('Dwarf Planet', 'A dwarf planet is a small planetary-mass object that is in direct orbit of the Sun, smaller than any of the eight classical planets but still a world in its own right.'),
  ('Moon', 'A natural satellite is, in the most common usage, an astronomical body that orbits a planet, dwarf planet, or small Solar System body (or sometimes another natural satellite).');

INSERT INTO galaxies
  (name)
VALUES
  ('Milky Way');

INSERT INTO astro_bodies
  (name, class_id, galaxy_id)
VALUES
  ('Sun',1,1),
  ('Gliese 876',1,1),
  ('Proxima Centauri',1,1),
  ('Earth',2,1),
  ('Mars', 2,1),
  ('Venus', 2,1),
  ('Neptune', 2,1),
  ('Proxima Centauri b', 2, 1),
  ('Gliese 876 b', 2, 1),
  ('Pluto',3,1),
  ('The Moon',4,1),
  ('Phobos',4,1),
  ('Deimos',4,1),
  ('Naiad',4,1);

INSERT INTO orbits
  (body_id, orbits_body_id, orbital_period_in_years)
VALUES
  (4,1,1.00),
  (5,1,1.88),
  (8,3,0.03),
  (12,5,0.000913242);