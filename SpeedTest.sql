-- Таблиця фільмів
CREATE TABLE MOVIE (
    movie_id BIGSERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INTEGER
);

-- Таблиця акторів
CREATE TABLE ACTOR (
    actor_id BIGSERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    birth_date DATE
);

-- Таблиця ролей
CREATE TABLE ROLE (
    role_id BIGSERIAL PRIMARY KEY,
    role_title VARCHAR(255) NOT NULL
);

-- Таблиця акторського складу (Зв'язок Movie + Actor + Role)
CREATE TABLE MOVIE_CAST (
    mc_id BIGSERIAL PRIMARY KEY,
    movie_id BIGINT REFERENCES MOVIE(movie_id) ON DELETE CASCADE,
    actor_id BIGINT REFERENCES ACTOR(actor_id) ON DELETE CASCADE,
    role_id BIGINT REFERENCES ROLE(role_id) ON DELETE SET NULL
);


--Заповнення ролей
INSERT INTO role (role_title) VALUES 
('Jack Sparrow'), ('Captain Flint'), ('Sherlock Holmes'), ('James Bond'),
('Harry Potter'), ('Darth Vader'), ('Luke Skywalker'), ('Indiana Jones'),
('Ellen Ripley'), ('Sarah Connor'), ('Tony Stark'), ('Steve Rogers'),
('Bruce Wayne'), ('Joker'), ('Hannibal Lecter'), ('Clarice Starling'),
('Forrest Gump'), ('Tyler Durden'), ('Vito Corleone'), ('Michael Corleone'),
('Gandalf'), ('Frodo Baggins'), ('Aragorn'), ('Legolas'),
('Gollum'), ('Katniss Everdeen'), ('Hermione Granger'), ('Ron Weasley'),
('Marty McFly'), ('Doc Brown'), ('Neo'), ('Morpheus'),
('Trinity'), ('John Wick'), ('Maximus'), ('Rocky Balboa'),
('Peter Parker'), ('Wolverine'), ('Deadpool'), ('Wonder Woman');


--Заповнення акторів
INSERT INTO actor (full_name, birth_date) VALUES 
('Johnny Depp', '1963-06-09'), ('Graham McTavish', '1961-01-04'), ('Benedict Cumberbatch', '1976-07-19'), ('Daniel Craig', '1968-03-02'), ('Daniel Radcliffe', '1989-07-23'), ('James Earl Jones', '1931-01-17'), ('Mark Hamill', '1951-09-25'), ('Harrison Ford', '1942-07-13'), ('Sigourney Weaver', '1949-10-08'), ('Linda Hamilton', '1956-09-26'), ('Robert Downey Jr.', '1965-04-04'), ('Chris Evans', '1981-06-13'), ('Christian Bale', '1974-01-30'), ('Heath Ledger', '1979-04-04'), ('Anthony Hopkins', '1937-12-31'), ('Jodie Foster', '1962-11-19'), ('Tom Hanks', '1956-07-09'), ('Brad Pitt', '1963-12-18'), ('Marlon Brando', '1924-04-03'), ('Al Pacino', '1940-04-25'), ('Ian McKellen', '1939-05-25'), ('Elijah Wood', '1981-01-28'), ('Viggo Mortensen', '1958-10-20'), ('Orlando Bloom', '1977-01-13'), ('Andy Serkis', '1964-04-20'), ('Jennifer Lawrence', '1990-08-15'), ('Emma Watson', '1990-04-15'), ('Rupert Grint', '1988-08-24'), ('Michael J. Fox', '1961-06-09'), ('Christopher Lloyd', '1938-10-22'), ('Keanu Reeves', '1964-09-02'), ('Laurence Fishburne', '1961-07-30'), ('Carrie-Anne Moss', '1967-08-21'), ('Russell Crowe', '1964-04-07'), ('Sylvester Stallone', '1946-07-06'), ('Tom Holland', '1996-06-01'), ('Hugh Jackman', '1968-10-12'), ('Ryan Reynolds', '1976-10-23'), ('Gal Gadot', '1985-04-30'),('Paul Mescal', '1996-02-02');

--Заповнення фільмів
INSERT INTO movie (title, release_year, country_id) VALUES 
('Pirates of the Caribbean', 2003, 1), ('Black Sails', 2014, 1), ('Sherlock', 2010, 3), ('Casino Royale', 2006, 3), ('Harry Potter and the Sorcerer''s Stone', 2001, 3), ('Star Wars: A New Hope', 1977, 1), ('Raiders of the Lost Ark', 1981, 1), ('Alien', 1979, 3), ('The Terminator', 1984, 1), ('Iron Man', 2008, 1), ('Captain America: The First Avenger', 2011, 1), ('The Dark Knight', 2008, 1), ('The Silence of the Lambs', 1991, 1), ('Forrest Gump', 1994, 1), ('Fight Club', 1999, 1), ('The Godfather', 1972, 1), ('The Lord of the Rings: The Fellowship of the Ring', 2001, 3), ('The Hunger Games', 2012, 1), ('Back to the Future', 1985, 1), ('The Matrix', 1999, 1), ('John Wick', 2014, 1), ('Gladiator', 2000, 1), ('Rocky', 1976, 1), ('Spider-Man: No Way Home', 2021, 1), ('X-Men', 2000, 1), ('Deadpool', 2016, 1), ('Wonder Woman', 2017, 1);

--Заповнення таблиці «MOVIE_CAST» 
INSERT INTO movie_cast (movie_id, actor_id, role_id) VALUES 
(1, 1, 1),   -- Johnny Depp as Jack Sparrow in Pirates...
(2, 2, 2),   -- Graham McTavish as Captain Flint in Black Sails
(3, 3, 3),   -- Benedict Cumberbatch as Sherlock Holmes
(4, 4, 4),   -- Daniel Craig as James Bond
(5, 5, 5),   -- Daniel Radcliffe as Harry Potter
(5, 27, 27), -- Emma Watson as Hermione Granger
(5, 28, 28), -- Rupert Grint as Ron Weasley
(6, 7, 7),   -- Mark Hamill as Luke Skywalker
(6, 8, 8),   -- Harrison Ford as Indiana Jones
(12, 13, 13),-- Christian Bale as Bruce Wayne
(12, 14, 14),-- Heath Ledger as Joker
(10, 11, 11),-- Robert Downey Jr. as Tony Stark
(20, 31, 31),-- Keanu Reeves as Neo
(22, 34, 35);-- Russell Crowe as Maximus in Gladiator


