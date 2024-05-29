CREATE DATABASE Music;
GO
USE Music;
CREATE TABLE UserProfile
 (userID INT PRIMARY KEY IDENTITY,
 username VARCHAR(50) UNIQUE,
 email VARCHAR(50) UNIQUE,
 password varchar(50)
);
CREATE TABLE Artist
(artistID INT PRIMARY KEY IDENTITY,
artistName VARCHAR(50), 
country VARCHAR(50),
);
CREATE TABLE Subscription
(subscriptionID INT PRIMARY KEY IDENTITY,
name VARCHAR(50),
price decimal(10,2),
description VARCHAR(100),
userID INT FOREIGN KEY REFERENCES UserProfile(userID)
);
CREATE TABLE Payment 
(paymentID INT PRIMARY KEY IDENTITY,
amount DECIMAL(10,2),
paymentDate DATE,
method VARCHAR(50),
subscriptionID INT FOREIGN KEY REFERENCES Subscription(subscriptionID)
);
CREATE TABLE Playlist 
(playlistID INT PRIMARY KEY IDENTITY, 
title VARCHAR(50),
creationDate DATE,
userID INT FOREIGN KEY REFERENCES UserProfile(userID) 
);
CREATE TABLE Album 
(albumID INT PRIMARY KEY IDENTITY,
title VARCHAR(50),
releaseDate Date,
artistID  INT FOREIGN KEY REFERENCES Artist(artistID)
);
CREATE TABLE Track
(trackID INT PRIMARY KEY IDENTITY,
title VARCHAR(50),
duration TIME,
albumID INT FOREIGN KEY REFERENCES Album(albumID)
);
CREATE TABLE Likes 
(userID INT FOREIGN KEY REFERENCES UserProfile(userID),
trackID INT FOREIGN KEY REFERENCES Track(trackID),
CONSTRAINT pk_Likes PRIMARY KEY (userID, trackID)
);
CREATE TABLE TrackPlaylist
(position INT CHECK (position>0),
playlistID INT FOREIGN KEY REFERENCES Playlist(playlistID),
trackID INT FOREIGN KEY REFERENCES Track(trackID),
CONSTRAINT pk_TrackPlaylist PRIMARY KEY (playlistID, trackID)
);
--inserare date Utilizatori
INSERT INTO UserProfile(username, email, password) VALUES 
('Paula','paula@gmail.com', 'pass'), ('Maria', 'maria@gmail.com', 'parola'),
('Ana', 'ana@gmail.com', 'sql'), ('Alin', 'alin@gmail.com','pass324'),
('Luca', 'luca@gmail.com', 'parola1234'),('David', 'david@gmail.com', 'sql435');
SELECT * FROM UserProfile;

--inserare artist 
INSERT INTO Artist(artistName, country) VALUES
('Taylor Swift', 'USA'), ('The Beatles', 'USA'), ('Lady Gaga', 'USA'),
('Adele', 'London'), ('Jurjak', 'Romania'), ('Imagine Dragons', 'USA'),
('Vita de Vie', 'Romania'), ('Vama', 'Romania'), ('Irina Rimes', 'Moldova');
SELECT * FROM Artist;

--inserare subscriptie
INSERT INTO dbo.Subscription(name, price, description, userID) VALUES
('Standard', '10.3', 'Listen to music without ads', 1),
('Premium', '27.5', 'Listen to music without ads and Download to listen offline', 2),
('Standard', '10.3', 'Listen to music without ads', 3),
('Premium', '27.5', 'Listen to music without ads and Download to listen offline', 4),
('Premium', '27.5', 'Listen to music without ads and Download to listen offline', 5),
('Premium', '27.5', 'Listen to music without ads and Download to listen offline', 6);
SELECT * FROM Subscription;

--inserare payment
INSERT INTO dbo.Payment(amount, paymentDate, method, subscriptionID) VALUES
('10.30', '2024-05-22', 'card', 1),
('27.50', '2024-05-23', 'card', 2),
('10.30', '2024-05-24', 'credit card', 1),
('27.50', '2024-05-23', 'card', 2),
('27.50', '2024-05-24', 'credit card', 2),
('27.50', '2024-05-26', 'credit card', 2);
SELECT * FROM Payment;

--inserare Playlist 
INSERT INTO Playlist (title, creationDate, userID) VALUES
('Liked', '2024-05-27', 1),
('Popular songs', '2024-02-26', 2),
('Liked songs', '2024-05-21', 3),
('Recently played', '2024-05-15', 4),
('Daily Mix', '2024-04-10', 5),
('Favourites', '2024-03-26', 6);
SELECT * FROM Playlist;

--inserare Album
INSERT INTO Album (title, releaseDate, artistID) VALUES
('The Tortured Poets Department','2024-04-19', 1),
('Here Comes the Sun', '1969-03-26', 2),
('Joanne', '2016-10-21', 3),
('21', '2011-01-24', 4),
('Casa din padure', '2023-12-08', 5),
('Origins', '2018-11-09', 6),
('Acustic', '2013-04-05', 7),
('Better', '2017-09-12', 8),
('Acasa', '2022-06-03', 9);
SELECT * FROM Album;

--inserare Track 
INSERT INTO Track(title, duration, albumID) VALUES
('Fortnight', '3:49',1), ('So Long, London', '3:24', 1), ('Florida!!!','3:35',1),
('Come Together','4:20', 2),('Oh! Darling', '3:27', 2),
('Joanne', '3:16', 3), ('Diamond Heart', '3:30', 3), ('Million Reasons', '3:25', 3),
('Rolling in the Deep', '3:48', 4), ('Set Fire on the Rain', '4:02', 4),
('Mort si Viu', '2:23', 5), ('Casa din padure', '3:29', 5),
('Natural', '3:09', 6), ('Zero', '3:31', 6), ('Cool Out', '3:09', 6),
('Ieri', '1:59', 7), ('Azi', '3:19', 7), ('Liber', '3:50', 7),
('Summer Love', '5:38', 8), ('Memories Now', '3:34', 8),
('Acasa', '5:32', 9), ('Un altfel de ieri', '2:49', 9);
SELECT * FROM Track;

--inserare Likes
INSERT INTO dbo.Likes(userID, trackID) VALUES
(1,1), (1,2), (1,3),
(2,4), (2,5), (2,6),
(3,7), (3,8), (3,9), (3,22),(3,3), (3,13),
(4,10), (4,11), (4,12), (4,4),
(5,13), (5,14), (5,15), (5,21), (5,22),
(6,16), (6,17), (6,18), (6,19), (6,20);
SELECT * FROM Likes;

--inserare TrackPlaylist
INSERT INTO TrackPlaylist (position, playlistID, trackID) VALUES
('1',1,1), ('1',1,2),('1',1,3),
('2', 2,21), ('2',2,12),('2',2,4), ('2',2,16), ('2',2,20),
('3',3,7), ('3',3,8), ('3',3,9), ('3',3,22),('3',3,3), ('3',3,13),
('4', 4,11), ('4', 4,4), ('4',4,22),('4',4,17),
('5',5,5), ('5',5,6), ('5',5,10), ('5',5,18), 
('6',6,14), ('6',6,15), ('6',6,3), ('6',6,19), ('6',6,21);
SELECT * FROM TrackPlaylist; 

--DELETE FROM TrackPlaylist;

--2.interogare clauza WHERE
SELECT title FROM Track WHERE albumID=3;
SELECT artistName FROM Artist WHERE country='USA';  

--3.interogare clauza WHERE cu conditie compuse AND sau OR.
SELECT * FROM Subscription WHERE price>20 and name='Premium';
SELECT * FROM TrackPlaylist WHERE playlistID=3 or trackID =3;

--4.interogare care extrage date din 3 tabele cu INNER JOIN.
SELECT username, name, trackID FROM UserProfile 
INNER JOIN Subscription ON UserProfile.userID=Subscription.userID 
INNER JOIN Likes ON UserProfile.userID=Likes.userID;

--5.interogare care extrage date din 2 tabele cu LEFT JOIN, RIGHT JOIN sau FULL JOIN.
SELECT artistName, username FROM Artist LEFT OUTER JOIN UserProfile ON Artist.artistID=UserProfile.userID; 

SELECT name, title FROM Subscription RIGHT OUTER JOIN Track ON Subscription.subscriptionID= Track.trackID;

SELECT title, trackID FROM Album FULL OUTER JOIN TrackPlaylist ON Album.albumID=TrackPlaylist.trackID;

--6.interogare care con?ine clauzele GROUP BY ?i HAVING; se va folosi una dintre urm?toarele func?ii de agregare: COUNT, MIN, MAX, SUM sau AVG.
SELECT COUNT(*) FROM Track;
SELECT MAX (price) FROM Subscription;
SELECT Artist.artistName, COUNT(Album.albumID) AS albumCount FROM Artist INNER JOIN Album ON Artist.artistID = Album.artistID GROUP BY Artist.artistName, Artist.artistID; 
SELECT Subscription.name, SUM(Payment.amount) AS totalAmount FROM Subscription INNER JOIN Payment ON Subscription. subscriptionID = Payment.subscriptionID 
GROUP BY Subscription.name, Subscription.subscriptionID
HAVING SUM(Payment.amount)>50;

--7.interogare care con?ine clauzele TOP ?i ORDER BY.
SELECT duration, title FROM Track ORDER BY duration; -- DESC;
SELECT TOP 5 title FROM Album ORDER BY title DESC; --ASC;

--8.interogare care con?ine DISTINCT în clauza SELECT.
SELECT DISTINCT title FROM Album;
SELECT DISTINCT artistName FROM Artist;

--9.interogare care con?ine unul dintre operatorii: UNION, INTERSECT sau EXCEPT.
SELECT name FROM Subscription WHERE subscriptionID IN (SELECT subscriptionID FROM Payment WHERE price>20)
EXCEPT
SELECT name FROM Subscription WHERE subscriptionID IN (SELECT subscriptionID FROM Payment WHERE price=7);

SELECT name FROM Subscription WHERE subscriptionID IN (SELECT subscriptionID FROM Payment WHERE price>20)
UNION ALL
SELECT name FROM Subscription WHERE subscriptionID IN (SELECT subscriptionID FROM Payment WHERE price>9);

--10.interogare care con?ine o subinterogare în clauza WHERE. Pentru a încadra subinterogarea în clauza WHERE, se va folosi operatorul IN sau EXISTS.
SELECT artistName FROM Artist WHERE artistID IN (SELECT artistID FROM Album); 
SELECT title FROM Track WHERE EXISTS (SELECT * FROM  Album WHERE Album.albumID = Track.albumID); 
