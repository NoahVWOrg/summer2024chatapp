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
    
    FOREIGN KEY (chatID) REFERENCES User(userID)
);

CREATE TABLE IF NOT EXISTS Messages (
	entryNum INT,
    chatID INT,
    message TEXT,
    timestamp TIMESTAMP,
    userID INT,
    PRIMARY KEY(entryNum, chatID),
    
    FOREIGN KEY (chatID) REFERENCES Chats(chatID),
	FOREIGN KEY (userID) REFERENCES User(userID)
);

CREATE TABLE IF NOT EXISTS Admin(
	gAdmin INT PRIMARY KEY,

    FOREIGN KEY (gAdmin) REFERENCES User(userID)
);

CREATE TABLE IF NOT EXISTS members(
	memberID INT PRIMARY KEY,
    joinOrder INT UNIQUE,
	joinDate DATE,
    
    FOREIGN KEY (memberID) REFERENCES User(userID)
);

CREATE TABLE IF NOT EXISTS GroupChat(
	chatID INT,
	memberID INT,
    gName VARCHAR(255),
    gAdmin INT,
    PRIMARY KEY(chatID, memberID),
   
	FOREIGN KEY (chatID) REFERENCES Chats(chatID), 
	FOREIGN KEY (memberID) REFERENCES members(memberID),
    FOREIGN KEY (gAdmin) REFERENCES Admin(gAdmin)
);

CREATE TABLE IF NOT EXISTS DirectChat(
	chatID INT,
	memberID INT,
    PRIMARY KEY(chatID, memberID),
    
	FOREIGN KEY (chatID) REFERENCES Chats(chatID),
	FOREIGN KEY (memberID) REFERENCES User(userID)
);



-- Insert data into User table
INSERT INTO User (userID, username, name, email, DOB, password, publicKey, privateKeyHash) VALUES
(1, 'user1', 'John Doe', 'john.doe@example.com', '1990-01-15', 'password1', 'pubKey1', 'privKeyHash1'),
(2, 'user2', 'Jane Smith', 'jane.smith@example.com', '1985-02-25', 'password2', 'pubKey2', 'privKeyHash2'),
(3, 'user3', 'Alice Johnson', 'alice.johnson@example.com', '1992-03-30', 'password3', 'pubKey3', 'privKeyHash3'),
(4, 'user4', 'Bob Brown', 'bob.brown@example.com', '1988-07-07', 'password4', 'pubKey4', 'privKeyHash4'),
(5, 'user5', 'Carol White', 'carol.white@example.com', '1995-12-12', 'password5', 'pubKey5', 'privKeyHash5');

-- Insert data into Chats table
INSERT INTO Chats (chatID, creationDate) VALUES
(1, '2024-01-01'),
(2, '2024-02-14'),
(3, '2024-03-20'),
(4, '2024-04-10'),
(5, '2024-05-05');

-- Insert data into Messages table
INSERT INTO Messages (entryNum, chatID, message, timestamp, userID) VALUES
(1, 1, 'Hello, world!', '2024-01-01 10:00:00', 1),
(2, 1, 'How are you?', '2024-01-01 10:05:00', 2),
(3, 2, 'Happy Valentine''s!', '2024-02-14 08:30:00', 3),
(4, 3, 'Spring is here!', '2024-03-20 12:00:00', 4),
(5, 4, 'Let''s meet up.', '2024-04-10 14:15:00', 5),
(6, 5, 'Cinco de Mayo!', '2024-05-05 18:45:00', 1);

-- Insert data into Admin table
INSERT INTO Admin (gAdmin) VALUES
(1),
(3);

-- Insert data into Members table
INSERT INTO members (memberID, joinOrder, joinDate) VALUES
(1, 1, '2024-01-01'),
(2, 2, '2024-02-01'),
(3, 3, '2024-03-01'),
(4, 4, '2024-04-01'),
(5, 5, '2024-05-01');

-- Insert data into GroupChat table
INSERT INTO GroupChat (chatID, memberID, gName, gAdmin) VALUES
(1, 1, 'Group One', 1),
(2, 2, 'Group Two', 1),
(3, 3, 'Group Three', 3),
(4, 4, 'Group Four', 3),
(5, 5, 'Group Five', 3);

-- Insert data into DirectChat table
INSERT INTO DirectChat (chatID, memberID) VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 1);


-- Select all data from User table
SELECT * FROM User;

-- Select all data from Chats table
SELECT * FROM Chats;

-- Select all data from Messages table
SELECT * FROM Messages;

-- Select all data from Admin table
SELECT * FROM Admin;

-- Select all data from members table
SELECT * FROM members;

-- Select all data from GroupChat table
SELECT * FROM GroupChat;

-- Select all data from DirectChat table
SELECT * FROM DirectChat;
