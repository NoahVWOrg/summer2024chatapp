DROP DATABASE IF EXISTS chat24;
CREATE DATABASE chat24;

CREATE TABLE IF NOT EXISTS User (
	userID INT PRIMARY KEY,
    username VARCHAR(15) UNIQUE,
    password VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    DOB DATE,
    publicKey TEXT,
    privateKeyHash TEXT
);

CREATE TABLE IF NOT EXISTS Chats (
	chatID INT PRIMARY KEY,
    userID INT, 
    creationDate DATE,
    
    FOREIGN KEY (userID) REFERENCES User(userID)
);

CREATE TABLE IF NOT EXISTS Messages (
	chatID INT,
    message TEXT,
    timestamp TIMESTAMP,
    
    FOREIGN KEY (chatID) REFERENCES Chats(chatID)
);

CREATE TABLE IF NOT EXISTS GroupInfo(
	chatID INT,
    memberID INT,
    role VARCHAR(10),
    PRIMARY KEY(chatID, memberID),
    
	FOREIGN KEY (chatID) REFERENCES Chats(chatID),
	FOREIGN KEY (memberID) REFERENCES User(userID)
);

INSERT INTO User VALUES (1, 'vandeJ', 'pass1', 'vjake870@gmail.com', '2000-08-26', 'naofnowe k k', 'fuhihi9923jbj2o4');
INSERT INTO User VALUES (2, 'vandeN ', 'pass3', 'vandenoa000@gmail.com', '2000-09-24', 'sniiasdf', 'v3v5vhj2hvhgjv2');
INSERT INTO Chats VALUES (1, 1, '2023-06-09');
INSERT INTO groupinfo VALUES (1, 1, 'owner');  
INSERT INTO groupinfo VALUES (1, 2, 'member');  

SELECT * FROM groupinfo;
SELECT * FROM User;