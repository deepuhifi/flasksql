CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  origin VARCHAR NOT NULL,
  destination VARCHAR NOT NULL,
  duration INTEGER NOT NULL
);
/*  CREATION OF flights TABLE */

INSERT INTO flights (origin, destination, duration) VALUES ('New York', 'London', 415);
INSERT INTO flights (origin, destination, duration) VALUES ('New Jersey', 'Dubai', 315);
INSERT INTO flights (origin, destination, duration) VALUES ('Tokyo', 'Los Angeles', 425);
INSERT INTO flights (origin, destination, duration) VALUES ('Hong Kong', 'Paris', 275);
INSERT INTO flights (origin, destination, duration) VALUES ('New york', 'Istanbul', 245);

/*  INSERTION OF flights TABLE */

CREATE TABLE passengers (
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  flight_id INTEGER REFERENCES flights
);

/*  CREATION OF passengers TABLE an create REFERENCES btw id and flight_id*/

INSERT INTO passengers ( name, flight_id) VALUES ('Nancy', 4);
INSERT INTO passengers ( name, flight_id) VALUES ('June', 1);
INSERT INTO passengers ( name, flight_id) VALUES ('May', 2);
INSERT INTO passengers ( name, flight_id) VALUES ('Ash', 3);
INSERT INTO passengers ( name, flight_id) VALUES ('Ray', 5);
INSERT INTO passengers ( name, flight_id) VALUES ('Sammy', 1);

/*  INSERTION OF passengers TABLE */

SELECT origin,destination,duration,name FROM flights JOIN passengers ON passengers.flight_id = flights.id;

/*  JOINin two tables et al */
