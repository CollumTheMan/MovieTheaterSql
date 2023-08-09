CREATE TABLE movie_theater(
    id int NOT NULL PRIMARY KEY,
    name varchar(255) NOT NULL
);

CREATE TABLE room(
    id int NOT NULL PRIMARY KEY,
    number int NOT NULL,
    movie_theater_id int NOT NULL,
    FOREIGN KEY (movie_theater_id) REFERENCES movie_theater(id)
);

CREATE TABLE active_movie(
    id int NOT NULL PRIMARY KEY,
    name varchar(255) NOT NULL,
    movie_theater_id int NOT NULL,
    FOREIGN KEY (movie_theater_id) REFERENCES movie_theater(id)
);

CREATE TABLE showing(
    id int NOT NULL PRIMARY KEY,
    active_movie_id int NOT NULL,
    room_id int NOT NULL,
    FOREIGN KEY (active_movie_id) REFERENCES active_movie(id),
    FOREIGN KEY (room_id) REFERENCES room(id)
);

CREATE TABLE ticket(
    id int NOT NULL PRIMARY KEY,
    showing_id int NOT NULL,
    FOREIGN KEY (showing_id) REFERENCES showing(id)
);

CREATE TABLE customer(
    id int NOT NULL PRIMARY KEY,
    name varchar(255) NOT NULL,
    ticket_id int NOT NULL,
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);