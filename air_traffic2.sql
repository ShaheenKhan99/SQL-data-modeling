-- from the terminal run:
-- psql < air_traffic2.sql

DROP DATABASE IF EXISTS air_traffic2;

CREATE DATABASE air_traffic2;

\c air_traffic2


CREATE TABLE passengers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);


INSERT INTO passengers
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');




CREATE TABLE countries 
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO countries
  (name)
VALUES
  ('United States'),
  ('Japan'),
  ('United Kingdom'),
  ('France'),
  ('Mexico'),
  ('Morocco'),
  ('UAE'),
  ('China'),
  ('Chile'),
  ('Brazil');



CREATE TABLE cities 
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country_id INTEGER REFERENCES countries 
);

INSERT INTO cities
  (name, country_id)
VALUES
  ('Beijing', 8),
  ('Casablanca', 6),
  ('Cedar Rapids', 1),
  ('Charlotte', 1),
  ('Chicago', 1),
  ('Dubai', 7),
  ('Las Vegas', 1),
  ('London', 3),
  ('Los Angeles', 1),
  ('Mexico City', 5),
  ('New Orleans', 1),
  ('New York', 1),
  ('Paris', 4),
  ('Santiago', 9),
  ('Sao Paolo', 10),
  ('Seattle', 1),
  ('Tokyo', 2),
  ('Washington DC', 1);
  


CREATE TABLE airlines 
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO airlines
  (name)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('Tui Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');



CREATE TABLE flights
(
  id SERIAL PRIMARY KEY,
  airline_id INTEGER REFERENCES airlines,
  departure timestamp without time zone NOT NULL,
  arrival timestamp without time zone NOT NULL,
  from_city_id INTEGER REFERENCES cities,
  to_city_id INTEGER REFERENCES cities
);


INSERT INTO flights 
  (airline_id, departure, arrival, from_city_id, to_city_id)
VALUES
  (1,'2018-04-08 09:00:00', '2018-04-08 12:00:00', 18, 16),
  (2, '2018-12-19 12:45:00', '2018-12-19 16:15:00', 17, 8),
  (3, '2018-01-02 07:00:00', '2018-01-02 08:03:00', 9, 7),
  (3, '2018-04-15 16:50:00', '2018-04-15 21:00:00', 16, 10),
  (4, '2018-08-01 18:30:00', '2018-08-01 21:50:00', 13, 2),
  (5, '2018-10-31 01:15:00', '2018-10-31 12:55:00', 6, 1),
  (1, '2019-02-06 06:00:00', '2019-02-06 07:47:00', 12, 4),
  (6, '2018-12-22 14:42:00', '2018-12-22 15:56:00', 3, 5),
  (6, '2019-02-06 16:28:00', '2019-02-06 19:18:00', 4, 11),
  (7, '2019-01-20 19:30:00', '2019-01-20 22:45:00', 15, 14);




CREATE TABLE tickets 
(
  passenger_id INTEGER REFERENCES passengers,
  flight_id INTEGER REFERENCES flights,
  seat_number TEXT NOT NULL
);

INSERT INTO tickets
  (passenger_id, flight_id, seat_number)
VALUES
  (1, 1, '33B'),
  (2, 2, '8A'),
  (3, 3, '12F'),
  (1, 4, '20A'),
  (4, 5, '23D'),
  (2, 6, '18C'),
  (5, 7, '9E'),
  (6, 8, '1A'),
  (5, 9, '32B'),
  (7, 10, '10D');



  




  