/*
** Author: Sai Sushank Manthri Pramod, Advitha Bawgi
** Course: IFT/530
** SQL Server Version: Microsoft SQL Server 2012 (SP1) 
** History
** Date Created    Comments
** 04/24/2024      Final Project
*/


 --- Tables Creation 
CREATE TABLE Users (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    username NVARCHAR(50) NOT NULL UNIQUE,
    email NVARCHAR(100) NOT NULL UNIQUE,
    password NVARCHAR(100) NOT NULL,
    subscription_type NVARCHAR(10) NOT NULL
);




CREATE TABLE Artists (
    artist_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL UNIQUE,
    genre NVARCHAR(50)
);

CREATE TABLE Songs (
    song_id INT IDENTITY(1,1) PRIMARY KEY,
    title NVARCHAR(100) NOT NULL,
    artist_id INT NOT NULL,
    album_id INT,
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id),
    FOREIGN KEY (album_id) REFERENCES Albums(album_id)
);

CREATE TABLE Albums (
    album_id INT IDENTITY(1,1) PRIMARY KEY,
    title NVARCHAR(100) NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id)
);

CREATE TABLE Playlists (
    playlist_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    title NVARCHAR(100) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);



CREATE TABLE Listening_Habits (
    habit_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    song_id INT NOT NULL,
    timestamp DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (song_id) REFERENCES Songs(song_id)
);


CREATE TABLE Subscriptions (
    subscription_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);


CREATE TABLE Payments (
    payment_id INT IDENTITY(1,1) PRIMARY KEY,
    subscription_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date DATE NOT NULL,
    FOREIGN KEY (subscription_id) REFERENCES Subscriptions(subscription_id)
);

--Tables Population 
INSERT INTO Users (username, email, password, subscription_type) VALUES
('divya', 'divya@gmail.com', 'divyareddy', 'Free'),
('ravi', 'ravi@gmail.com', 'ravi', 'Premium'),
('rajiv', 'rajiv@gmail.com', 'rajivsr', 'Free'),
('sravani', 'sravani@gmail.com', 'sravanimvs', 'Premium'),
('shiva', 'shiva@gmail.com', 'shiva', 'Free'),
('raju', 'raju@gmail.com', 'rajunrs', 'Premium'),
('mahesh', 'mahesh@gmail.com', 'mahesh', 'Free'),
('nani', 'nani@gmail.com', 'nanimir', 'Premium'),
('karthik', 'karthik@gmail.com', 'karthikcvs', 'Free'),
('sushank', 'sushank@gmail.com', 'sushankmantri', 'Premium'), 
('raj', 'raj@gmail.com', 'rajnr', 'Premium'),
('mahi', 'mahi@gmail.com', 'mahi', 'Free'),
('nanu', 'nanu@gmail.com', 'nanumir', 'Premium'),
('karthika', 'karthika@gmail.com', 'karthikacv', 'Free'),
('sushma', 'sushma@gmail.com', 'sushmadvr', 'Premium'), 
('rajender', 'rajender@gmail.com', 'rajenderphl', 'Premium'),
('maharaj', 'maharaj@gmail.com', 'maharaj', 'Free'),
('nagesh', 'nagesh@gmail.com', 'nagesh', 'Premium'),
('koushik', 'koushik@gmail.com', 'koushiktrs', 'Free'),
('sreya', 'sreya@gmail.com', 'sreyatdp', 'Premium'), 
('rajesh', 'rajesh@gmail.com', 'rajesh', 'Premium'),
('maharani', 'maharani@gmail.com', 'maharani', 'Free'),
('nageshwar', 'nageshwar@gmail.com', 'nageshwar', 'Premium'),
('kalyan', 'kalyan@gmail.com', 'kalyan', 'Free'),
('sreeja', 'sreeja@gmail.com', 'sreeja', 'Premium');

select * from Users;


INSERT INTO Artists (name, genre) VALUES
('Anirudh', 'Rock'),
('Sidsriram', 'Pop'),
('Taylorswift', 'Hip Hop'),
('Keeravani', 'Electronic'),
('Rahul', 'Jazz'),
('DSP', 'R&B'),
('Manish', 'Classical'),
('Rajamouli', 'Indie'),
('Trivikram', 'Country'),
('Prashanth', 'Reggae'),
('Lakshmi', 'Rock'),
('Priya', 'Pop'),
('Anusha', 'Hip Hop'),
('Manisha', 'Electronic'),
('Megha', 'Jazz'),
('Kavya', 'R&B'),
('Chandu', 'Classical'),
('Sagar', 'Indie'),
('Kiara', 'Country'),
('Saritha', 'Reggae'),
('Sangeetha', 'Rock'),
('Sabitha', 'Pop'),
('Sreeja', 'Hip Hop'),
('Naveen', 'Electronic'),
('Chinni', 'Jazz');

select * from Artists;

INSERT INTO Songs (title, artist_id, album_id) VALUES
('Tujhse Naraaz Nahi', 1, NULL),
('Tere Bina Zindagi se Koi', 2, NULL),
('Kun Faya Kun', 3, NULL),
('Kal Ho Naa Ho', 4, NULL),
('Pal Pal Dil Ke Paas ', 5, NULL),
('Kisi ki Muskurahaton Pe Ho Nisar', 6, NULL),
('Main Kabhi Batlata Nahi ', 7, NULL),
('Masakali ', 8, NULL),
('Ajib Dastan Hai Yeh', 9, NULL),
('Aye Zindagi Gale Laga Le', 10, NULL),
('Mitwa ', 11, NULL),
('Maine Tere Liye Hi', 12, NULL),
('Lag Ja Gale ', 13, NULL),
('Tera Mera Pyar Amar ', 14, NULL),
('Taal Se Taal ', 15, NULL),
('Badan Pe Sitare', 16, NULL),
('Pyaar Hua Ikraar Hua', 17, NULL),
('Neele Neele Ambar Par ', 18, NULL),
('Hum Tum Ek Kamre Mein Band Ho ', 19, NULL),
('Dheere Dheere Se Meri Zindagi Mein Aana', 20, NULL),
('Mere Rang Mein Rangne Wali ', 21, NULL),
('Chura Liya Hai Tumne', 22, NULL),
('O haseena Zulfo Waali ', 23, NULL),
('Iktara', 24, NULL),
('Jiya Dhadak Dhadak Jaye', 25, NULL);
select * from Songs;

INSERT INTO Albums (title, artist_id) VALUES
('Album1', 1),
('Album2', 2),
('Album3', 3),
('Album4', 4),
('Album5', 5),
('Album6', 6),
('Album7', 7),
('Album8', 8),
('Album9', 9),
('Album10', 10),
('Album11', 11),
('Album12', 12),
('Album13', 13),
('Album14', 14),
('Album15', 15),
('Album16', 16),
('Album17', 17),
('Album18', 18),
('Album19', 19),
('Album20', 20),
('Album21', 21),
('Album22', 22),
('Album23', 23),
('Album24', 24),
('Album25', 25);
select * from Albums;

INSERT INTO Playlists (user_id, title) VALUES
(19, 'Playlist1'),
(20, 'Playlist2'),
(21, 'Playlist3'),
(22, 'Playlist4'),
(23, 'Playlist5'),
(24, 'Playlist6'),
(25, 'Playlist7'),
(26, 'Playlist8'),
(27, 'Playlist9'),
(28, 'Playlist10'),
(29, 'Playlist11'),
(30, 'Playlist12'),
(31, 'Playlist13'),
(32, 'Playlist14'),
(33, 'Playlist15'),
(34, 'Playlist16'),
(35, 'Playlist17'),
(36, 'Playlist18'),
(37, 'Playlist19'),
(38, 'Playlist20'),
(39, 'Playlist21'),
(40, 'Playlist22'),
(41, 'Playlist23'),
(42, 'Playlist24'),
(43, 'Playlist25');

select *  from Playlists;


INSERT INTO Listening_Habits (user_id, song_id, timestamp) VALUES
(19, 1, '2024-04-16 08:30:00'),
(20, 2, '2024-04-16 09:15:00'),
(21, 3, '2024-04-16 10:00:00'),
(22, 4, '2024-04-16 10:45:00'),
(23, 5, '2024-04-16 11:30:00'),
(24, 6, '2024-04-16 12:15:00'),
(25, 7, '2024-04-16 13:00:00'),
(26, 8, '2024-04-16 13:30:00'),
(27, 9, '2024-04-16 14:00:00'),
(28, 10, '2024-04-16 14:30:00'),
(29, 11, '2024-04-16 13:30:00'),
(30, 12, '2024-04-16 06:15:00'),
(31, 13, '2024-04-16 11:00:00'),
(32, 14, '2024-04-16 12:45:00'),
(33, 15, '2024-04-16 19:30:00'),
(34, 16, '2024-04-16 16:15:00'),
(35, 17, '2024-04-16 19:00:00'),
(36, 18, '2024-04-16 21:30:00'),
(37, 19, '2024-04-16 08:00:00'),
(38, 20, '2024-04-16 01:30:00'),
(39, 21, '2024-04-16 02:30:00'),
(40, 22, '2024-04-16 03:30:00'),
(41, 23, '2024-04-16 04:30:00'),
(42, 24, '2024-04-16 05:30:00'),
(43, 25, '2024-04-16 06:30:00');
select * from Listening_Habits;






INSERT INTO Subscriptions (user_id, start_date, end_date) VALUES
(19, '2024-01-01', '2025-12-31'),
(20, '2024-01-02', '2025-12-31'),
(21, '2024-01-03', '2025-12-31'),
(22, '2024-01-04', '2025-12-31'),
(23, '2024-01-05', '2025-12-31'),
(24, '2024-01-06', '2025-12-31'),
(25, '2024-01-07', '2025-12-31'),
(26, '2024-01-08', '2025-12-31'),
(27, '2024-01-09', '2025-12-31'),
(28, '2024-01-10', '2025-12-31'),
(29, '2024-01-11', '2025-12-31'),
(30, '2024-01-12', '2025-12-31'),
(31, '2024-01-13', '2025-12-31'),
(32, '2024-01-14', '2025-12-31'),
(33, '2024-01-15', '2025-12-31'),
(34, '2024-01-16', '2025-12-31'),
(35, '2024-01-17', '2025-12-31'),
(36, '2024-01-18', '2025-12-31'),
(37, '2024-01-19', '2025-12-31'),
(38, '2024-01-20', '2025-12-31'),
(39, '2024-01-21', '2025-12-31'),
(40, '2024-01-22', '2025-12-31'),
(41, '2024-01-23', '2025-12-31'),
(42, '2024-01-24', '2025-12-31'),
(43, '2024-01-25', '2025-12-31');
select * from Subscriptions;

INSERT INTO Payments (subscription_id, amount, payment_date) VALUES
(37, 10.99, '2024-01-01'),
(38, 15.99, '2024-01-02'),
(39, 10.99, '2024-01-03'),
(40, 15.99, '2024-01-04'),
(41, 10.99, '2024-01-05'),
(42, 15.99, '2024-01-06'),
(43, 10.99, '2024-01-07'),
(44, 15.99, '2024-01-08'),
(45, 10.99, '2024-01-09'),
(46, 15.99, '2024-01-10'),
(47, 10.99, '2024-01-11'),
(48, 15.99, '2024-01-12'),
(49, 10.99, '2024-01-13'),
(50, 15.99, '2024-01-14'),
(51, 10.99, '2024-01-15'),
(52, 15.99, '2024-01-16'),
(53, 10.99, '2024-01-17'),
(54, 15.99, '2024-01-18'),
(55, 10.99, '2024-01-19'),
(56, 15.99, '2024-01-20'),
(57, 10.99, '2024-01-21'),
(58, 15.99, '2024-01-22'),
(59, 10.99, '2024-01-23'),
(60, 15.99, '2024-01-24'),
(61, 10.99, '2024-01-25');
select * from Payments;

--Views

CREATE VIEW User_Playlist_Details AS
SELECT u.username, p.title AS playlist_title, s.title AS song_title
FROM Users u
JOIN Playlists p ON u.user_id = p.user_id
LEFT JOIN Listening_Habits lh ON p.user_id = lh.user_id
LEFT JOIN Songs s ON lh.song_id = s.song_id
WHERE u.username = 'sreeja';


SELECT * FROM User_Playlist_Details;


CREATE VIEW User_Subscription_Payment_History AS
SELECT u.username, s.start_date, s.end_date, p.amount, p.payment_date
FROM Users u
JOIN Subscriptions s ON u.user_id = s.user_id
JOIN Payments p ON s.subscription_id = p.subscription_id
WHERE u.username = 'sushma';

SELECT * FROM User_Subscription_Payment_History;








CREATE VIEW RecentlyAddedSongs AS
SELECT s.title AS song_title, a.name AS artist_name
FROM Songs s
JOIN Artists a ON s.artist_id = a.artist_id
WHERE s.song_id IN (
    SELECT TOP 5 song_id FROM Songs ORDER BY song_id DESC
);
SELECT * from RecentlyAddedSongs;

-- Audit Table

CREATE TABLE ArtistsAudit (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    artist_id INT,
    name NVARCHAR(100),
    genre NVARCHAR(50),
    ChangeType NVARCHAR(10),
    ChangeDateTime DATETIME
);
SELECT * FROM ArtistsAudit;

--Trigger

CREATE TRIGGER trgArtists_Update
ON Artists
AFTER UPDATE
AS
BEGIN
    INSERT INTO ArtistsAudit (artist_id, name, genre, ChangeType, ChangeDateTime)
    SELECT artist_id, name, genre, 'UPDATE', GETDATE()
    FROM inserted;
END;
GO

CREATE TRIGGER trgArtists_Delete
ON Artists
AFTER DELETE
AS
BEGIN
    INSERT INTO ArtistsAudit (artist_id, name, genre, ChangeType, ChangeDateTime)
    SELECT artist_id, name, genre, 'DELETE', GETDATE()
    FROM deleted;
END;
GO


-- Inserting data into the original table
INSERT INTO Artists (name, genre) VALUES ('Artist1', 'Rock');

-- Updating data in the original table
UPDATE Artists SET genre = 'Pop' WHERE name = 'Artist1';

-- Deleting data from the original table
DELETE FROM Artists WHERE name = 'Artist1';

-- Checking the contents of the audit table
SELECT * FROM ArtistsAudit;


-- Create stored procedure to retrieve playlists by user
CREATE PROCEDURE GetPlaylistsByUser
    @username NVARCHAR(50)
AS
BEGIN
    SELECT p.title AS PlaylistTitle
    FROM Users u
    INNER JOIN Playlists p ON u.user_id = p.user_id
    WHERE u.username = @username;
END;

EXEC sp_helptext 'GetPlaylistsByUser';



-- Create UDF to calculate total number of songs in a playlist
CREATE FUNCTION dbo.GetTotalSongsInPlaylist
(
    @playlist_id INT
)
RETURNS INT
AS
BEGIN
    DECLARE @total_songs INT;
    SELECT @total_songs = COUNT(*)
    FROM Listening_Habits
    WHERE playlist_id = @playlist_id;

    RETURN @total_songs;
END;


-- Create UDF to calculate total number of songs in a playlist
CREATE FUNCTION dbo.GetTotalSongsInPlaylist
(
    @playlist_id INT
)
RETURNS INT
AS
BEGIN
    DECLARE @total_songs INT;
    SELECT @total_songs = COUNT(*)
    FROM Listening_Habits
    WHERE user_id = @playlist_id; -- Assuming user_id represents the playlist_id in Listening_Habits table

    RETURN @total_songs;
END;
EXEC GetPlaylistsByUser 'sreeja';

DECLARE @playlist_id INT;
SET @playlist_id = 1; -- Replace with the actual playlist ID

SELECT dbo.GetTotalSongsInPlaylist(@playlist_id) AS TotalSongsInPlaylist;

-- Drop stored procedure



-- Drop the stored procedure if it exists
IF OBJECT_ID('dbo.GetPlaylistsByUser', 'P') IS NOT NULL
    DROP PROCEDURE dbo.GetPlaylistsByUser;
GO

-- Drop the UDF if it exists
IF OBJECT_ID('dbo.GetTotalSongsInPlaylist', 'FN') IS NOT NULL
    DROP FUNCTION dbo.GetTotalSongsInPlaylist;
GO

-- cursor
-- Create a cursor to iterate over the Users table
DECLARE @username NVARCHAR(50)

DECLARE user_cursor CURSOR FOR
SELECT username
FROM Users

-- Open the cursor
OPEN user_cursor

-- Fetch the first row from the cursor
FETCH NEXT FROM user_cursor INTO @username

-- Loop through the cursor and print each username
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Username: ' + @username

    -- Fetch the next row
    FETCH NEXT FROM user_cursor INTO @username
END

-- Close the cursor
CLOSE user_cursor

-- Deallocate the cursor
DEALLOCATE user_cursor



