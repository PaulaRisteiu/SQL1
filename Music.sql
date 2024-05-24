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
userID INT FOREIGN KEY REFERENCES UserProfile(userId) 
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
(userID INT FOREIGN KEY REFERENCES UserProfile(userId),
trackID INT FOREIGN KEY REFERENCES Track(trackID),
CONSTRAINT pk_Likes PRIMARY KEY (userID, trackID)
);
CREATE TABLE TrackPlaylist
(position INT CHECK (position>0),
playlistID INT FOREIGN KEY REFERENCES Playlist(playlistID),
trackID INT FOREIGN KEY REFERENCES Track(trackID),
CONSTRAINT pk_TrackPlaylist PRIMARY KEY (playlistID, trackID)
);

