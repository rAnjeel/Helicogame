-- DataBase Used Postgres
CREATE DATABASE Helico;
CREATE USER pilote WITH PASSWORD 'postgres';
ALTER DATABASE Helico OWNER TO pilote;
ALTER USER  pilote WITH SUPERUSER CREATEDB CREATEROLE;

\c helico;

CREATE TABLE Point (
    id SERIAL PRIMARY KEY,
    x INT,
    y INT
);


create table Obstacle ( 
    id serial primary key,
    points POINT[]
);

-- Inserting Data
INSERT INTO Obstacle (points) VALUES
    (ARRAY[point(1, 1), point(2, 2), point(3, 3)]),
    (ARRAY[point(4, 4), point(5, 5), point(6, 6)]),
    (ARRAY[point(7, 7), point(8, 8), point(9, 9)]);

