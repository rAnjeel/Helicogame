-- DataBase Used Postgres

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
insert into Obstacle (points) values ('{ (1, 1), (2, 2), (3, 3) }');
insert into Obstacle (points) values ((1, 1), (2, 2), (3, 3));

