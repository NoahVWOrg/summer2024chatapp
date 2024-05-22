DROP DATABASE IF EXISTS chat24;
CREATE DATABASE chat24;

CREATE TABLE IF NOT EXISTS User (
	userID INT PRIMARY KEY,
    username VARCHAR(15) UNIQUE,
    name VARCHAR(100),
    email VARCHAR(255) UNIQUE,
    DOB DATE,
	password VARCHAR(255),
    publicKey TEXT,
    privateKeyHash TEXT
);

CREATE TABLE IF NOT EXISTS Chats (
	chatID INT PRIMARY KEY,
    creationDate DATE,
    
    FOREIGN KEY (userID) REFERENCES User(userID)
);

CREATE TABLE IF NOT EXISTS Messages (
	entryNum INT,
    chatID INT,
    message TEXT,
    timestamp TIMESTAMP,
    PRIMARY KEY(entryNum, chatID),
    
    FOREIGN KEY (chatID) REFERENCES Chats(chatID)
);

CREATE TABLE IF NOT EXISTS GroupChat(
	chatID INT,
	memberID INT,
    gName VARCHAR(255),
    gAdmin VARCHAR(10),
    PRIMARY KEY(chatID, memberID),
    
	FOREIGN KEY (chatID) REFERENCES Chats(chatID),
	FOREIGN KEY (memberID) REFERENCES User(userID),
    FOREIGN KEY (gAdmin) REFERENCES User(userID)
);

CREATE TABLE IF NOT EXISTS DirectChat(
	chatID INT,
	memberID INT,
    PRIMARY KEY(chatID, memberID),
    
	FOREIGN KEY (chatID) REFERENCES Chats(chatID),
	FOREIGN KEY (memberID) REFERENCES User(userID),
    FOREIGN KEY (gAdmin) REFERENCES User(userID)
);

INSERT INTO User VALUES (1, 'vandeJ', 'vjake870@gmail.com', '2000-08-26', 'pass1', 'naofnowe k k', 'fuhihi9923jbj2o4');
INSERT INTO User VALUES (2, 'vandeN ', 'vandenoa000@gmail.com', '2000-09-24', 'pass3', 'sniiasdf', 'v3v5vhj2hvhgjv2');
INSERT INTO Chats VALUES (1, 1, '2023-06-09');
INSERT INTO groupinfo VALUES (1, 1, 'Foodies',  'owner');  
INSERT INTO groupinfo VALUES (1, 2, 'Foodies', 'member');  

SELECT * FROM groupinfo;
SELECT * FROM User;