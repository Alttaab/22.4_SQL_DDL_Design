-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE flights
(
  id SERIAL PRIMARY KEY,
  flight_number VARCHAR(6) NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline TEXT NOT NULL,
  from_city TEXT NOT NULL,
  from_country TEXT NOT NULL,
  to_city TEXT NOT NULL,
  to_country TEXT NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  flight_id INTEGER REFERENCES flights (id) NOT NULL,
  seat TEXT NOT NULL
);

INSERT INTO flights
  (flight_number, departure, arrival, airline, from_city, from_country, to_city, to_country)
VALUES
  ('UA0408', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
  ('BA1219', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
  ('DA0102', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
  ('DA0415', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
  ('TB0801', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
  ('AC1031', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
  ('UA0206', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
  ('AA1222', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
  ('AA0206', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
  ('AB0120', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');

INSERT INTO tickets
  (first_name, last_name, flight_id, seat)
VALUES
  ('Jennifer', 'Finch', 1, '33B'),
  ('Thadeus', 'Gathercoal', 2, '8A'),
  ('Sonja', 'Pauley', 3, '12F'),
  ('Jennifer', 'Finch', 4, '20A'),
  ('Waneta', 'Skeleton', 5, '23D'),
  ('Thadeus', 'Gathercoal', 6, '18C'),
  ('Berkie', 'Wycliff', 7, '9E'),
  ('Alvin', 'Leathes', 8, '1A'),
  ('Berkie', 'Wycliff', 9, '32B'),
  ('Cory', 'Squibbes', 10, '10D');