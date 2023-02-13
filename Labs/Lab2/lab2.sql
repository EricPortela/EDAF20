


-- ----------------- D7 a) WRITE SQL COMMANDS TO CREATE TABLES (PRIMARY + FOREIGN KEYS) ----------------- 

-- STEP 1
-- Delete the tables if they exist. To be able to drop
-- them in arbitrary order, DISABLE FOREIGN KEY checks.

USE hbg09;

set foreign_key_checks = 0; -- MySQL
drop table if exists Users;
drop table if exists Theatres;
drop table if exists Movies;
drop table if exists Performances;
drop table if exists Reservations;



-- STEP 2
-- ENABLE FOREIGN KEY checks. We can now create tables, correctly with FOREIGN KEYs.
set foreign_key_checks = 1; -- MySQL



-- STEP 3
-- Create tables/relations

-- 3.1 Users 
CREATE TABLE IF NOT EXISTS Users (
    -- COLUMNS
    UserName VARCHAR(50),
    Name VARCHAR(50), 
    Address VARCHAR(50), 
    PhoneNbr INT,

    -- KEYS
    PRIMARY KEY (UserName)
);

-- 3.2 Theatres
CREATE TABLE IF NOT EXISTS Theatres (
    -- COLUMNS
    TheatreName VARCHAR(50),
    MaxSeats INT,

    -- KEYS
    PRIMARY KEY (TheatreName)
);

-- 3.3 Movies
CREATE TABLE if NOT EXISTS Movies (
    -- COLUMNS
    MovieName VARCHAR(50),

    -- KEYS
    PRIMARY KEY (MovieName)
);

-- 3.4 Performances
CREATE TABLE if NOT EXISTS Performances (
    -- COLUMNS
    TimeDate DATE,
    BookedSeats INT,
    MovieName VARCHAR(50),
    TheatreName VARCHAR(50),

    -- KEYS
    PRIMARY KEY (TimeDate, MovieName),
    FOREIGN KEY (MovieName) REFERENCES Movies(MovieName),
    FOREIGN KEY (TheatreName) REFERENCES Theatres(TheatreName)
);

-- 3.5 Reservations 
CREATE TABLE if NOT EXISTS Reservations(
    -- COLUMNS
    ReservationNbr INT AUTO_INCREMENT,
    UserName VARCHAR(50),
    TimeDate DATE,
    MovieName VARCHAR(50),

    -- KEYS
    PRIMARY KEY (ReservationNbr),
    FOREIGN KEY (UserName) REFERENCES Users(UserName),
    FOREIGN KEY (TimeDate) REFERENCES Performances(TimeDate)
);



-- STEP 4
-- INSERT data INTO tables

-- 4.1 Users
INSERT INTO Users (UserName, Name, Address, PhoneNbr) values 
    ('eric10', 'Eric Portela', 'Bryggaregatan 40', 87343832),
    ('sven99', 'Sven Olsson', 'Nobelgatan 20', 83234316),
    ('eliteCoder', 'Elite Codersson', 'Hackergatan 1337', 90892330);


-- 4.2 Theatres (3 different theatres)
INSERT INTO Theatres (TheatreName, MaxSeats) VALUES 
    ('SF Malmö', 120),
    ('SF Lund', 2),
    ('SF Helsingborg', 50);


-- 4.3 Movies (5 different movies)
INSERT INTO Movies (MovieName) VALUES 
    ('Star Wars'),
    ('Avatar'),
    ('Death Note'),
    ('Robocop'),
    ('Fast & Furious');


-- 4.4 Performances ()
INSERT INTO Performances(TimeDate, BookedSeats, MovieName, TheatreName) VALUES
    -- 2023-01-01
    ('2023-01-01', 0, 'Star Wars', 'SF Malmö'),
    -- ('2023-01-01', 0, 'Star Wars', 'SF HEJ'), -- Add Perfromance to a non-existing Theatre
    ('2023-01-01', 0, 'Avatar', 'SF Lund'),
    ('2023-01-01', 0, 'Death Note', 'SF Helsingborg'),
    ('2023-01-01', 0, 'Robocop', 'SF Malmö'),
    ('2023-01-01', 0, 'Fast & Furious', 'SF Helsingborg'),

    -- 2023-01-02
    ('2023-01-02', 0, 'Star Wars', 'SF Lund'),
    ('2023-01-02', 0, 'Avatar', 'SF Malmö'),
    ('2023-01-02', 0, 'Death Note', 'SF Lund'),
    ('2023-01-02', 0, 'Robocop', 'SF Helsingborg'),
    ('2023-01-02', 0, 'Fast & Furious', 'SF Malmö');


-- 4.5 Reservations ()
INSERT INTO Reservations (UserName, TimeDate, MovieName) VALUES 
    ('eric10', '2023-01-01', 'Star Wars'),
    ('sven99', '2023-01-01', 'Star Wars'),
    ('eliteCoder', '2023-01-02', 'Star Wars');

-- ------------------------------------------------------------------------------------------------------




-- ----------------- D7 b) -----------------

SELECT *
FROM Movies;

SELECT Performances.TimeDate, Performances.MovieName
FROM Performances LEFT JOIN Movies
on Movies.MovieName = Performances.MovieName;

SELECT *
FROM Performances
WHERE MovieName = 'Avatar';




