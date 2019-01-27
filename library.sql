CREATE DATABASE library;
USE [library];

CREATE TABLE LIBRARY_BRANCH (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR(50) NOT NULL,
	AddressLIB VARCHAR(70) NOT NULL
);

CREATE TABLE PUBLISHER (
	PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	AddressPUB VARCHAR(70) NOT NULL,
	PhonePUB VARCHAR(20) NOT NULL
);

CREATE TABLE BOOKS (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (100,1),
	Title VARCHAR(70) NOT NULL,
	PublisherName VARCHAR(50) FOREIGN KEY REFERENCES PUBLISHER(PublisherName)
);

CREATE TABLE BOOK_AUTHORS (
	BookID INT FOREIGN KEY REFERENCES BOOKS(BookID),
	AuthorName VARCHAR(50) NOT NULL
);

CREATE TABLE BOOK_COPIES (
	BookID INT FOREIGN KEY REFERENCES BOOKS(BookID),
	BranchID INT FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID),
	NumberOfCopies INT NOT NULL
);

CREATE TABLE BORROWER (
	CardNo INT PRIMARY KEY NOT NULL,  /*MIGHT END UP BEING A PROBLEM WHO KNOWS YOLO*/
	NameBRW VARCHAR(50) NOT NULL,
	AddressBRW VARCHAR(70) NOT NULL,
	PhoneBRW VARCHAR(20) NOT NULL
);


CREATE TABLE BOOK_LOANS (
	BookID INT FOREIGN KEY REFERENCES BOOKS(BookID),
	BranchID INT FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID),
	CardNo INT FOREIGN KEY REFERENCES BORROWER(CardNo),
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL
);


INSERT INTO LIBRARY_BRANCH
	(BranchName, AddressLIB)
	VALUES
	('Sharpstown', '7835 Sierra Mist AVE'),
	('Central', '48924 Central Circle'),
	('West Virginia', '8894 Country Road'),
	('Chuck E Cheese', 'Next to the Skeeball')
;

INSERT INTO PUBLISHER
	(PublisherName, AddressPUB, PhonePUB)
	VALUES
	('IKEA', 'Sweden?', 28889435677),
	('Chris Angel: Mindfreak', 'Under Your Chair', 482783648),
	('the Dharma Initiative', '42 Wallaby Way, Sydney', 4815162342),
	('Big Frog', 'Small Pond', 7)
;

INSERT INTO BOOKS
	(Title, PublisherName)
	VALUES
	('It Really Be Like That Sometimes', 'Big Frog'),
	('The Lost Tribe', 'IKEA'),
	('Christine', 'Big Frog'),
	('Yoga: Empower Your Core', 'IKEA'),
	('A Very Shreksgiving', 'Chris Angel: Mindfreak'),
	('Macrame: Not Just For Dogs', 'Chris Angel: Mindfreak'),
	('Silence of the Hams', 'the Dharma Initiative'),
	('Boku No Hero Academia', 'the Dharma Initiative'),
	('Eat, Pray, Love', 'the Dharma Initiative'),
	('Convince Everyone of your Very Real Gluten Allergy', 'IKEA'),
	('One Direction Fan Fiction', 'IKEA'),
	('Welcome to Applebees', 'Chris Angel: Mindfreak'),
	('Thus Spoke Zarathustra', 'IKEA'),
	('Difficult Difficult Lemon Difficult', 'Chris Angel: Mindfreak'),
	('Are You a Botanist?', 'IKEA'),
	('Auntie Kris! It is me!', 'the Dharma Initiative'),
	('The Lost Bribe', 'IKEA'),
	('The Lost Scribe', 'IKEA'),
	('The Lost Vibe', 'IKEA'),
	('The Flossed Tribe', 'IKEA'),
	('The Frost Tribe', 'IKEA'),
	('The Crossed Tribe', 'IKEA'),
	('The Missing Horde', 'IKEA'),
	('The Misplaced Collective', 'IKEA'),
	('The Wayward Clan', 'IKEA'),
	('So You Think You Can Dance', 'Big Frog'),
	('The Communist Manifesto', 'Big Frog')
;

SELECT * FROM BOOK_LOANS

INSERT INTO BOOK_AUTHORS
	(BookID, AuthorName)
	VALUES
	(100, 'Alec Berkin'),
	(101, 'Soulja Boy'),
	(102, 'Stephen King'),
	(103, 'Stephen King'),
	(104, 'Stephen King'),
	(105, 'Stephen King'),
	(106, 'Stephen King'),
	(107, 'Stephen King'),
	(108, 'Stephen King'),
	(109, 'Stephen King'),
	(110, 'Stephen King'),
	(111, 'Stephen King'),
	(112, 'Kim Kardashian'),
	(113, 'Amazon Alexa'),
	(114, 'Lil Pump'),
	(115, 'Todd Kraines'),
	(116, 'Scorpion'),
	(117, 'Diet Coke'),
	(118, 'James Cameron'),
	(119, 'Steve Harvey'),
	(120, 'Justin Timberlake'),
	(121, 'the Player Formerly Known as Mousecop'),
	(122, 'Ireland'),
	(123, 'Iris Kim'),
	(124, 'Pete Wentz'),
	(125, 'Deepak Chopra'),
	(126, 'Keira Knightly')
;

INSERT INTO BOOK_COPIES
	(BookID, BranchID, NumberOfCopies)
	VALUES
	(101, 1, 4),
	(116, 1, 6),
	(117, 1, 2),
	(118, 1, 3),
	(119, 1, 6),
	(120, 1, 2),
	(121, 1, 3),
	(122, 1, 7),
	(123, 1, 2),
	(124, 1, 4),
	(102, 2, 2),
	(103, 2, 4),
	(104, 2, 7),
	(105, 2, 3),
	(106, 2, 2),
	(107, 2, 4),
	(108, 2, 2),
	(109, 2, 3),
	(110, 2, 5),
	(111, 2, 2),
	(112, 4, 6),
	(126, 4, 2),
	(102, 4, 5),
	(105, 4, 3),
	(100, 4, 8),
	(113, 4, 2),
	(114, 4, 7),
	(115, 4, 10),
	(125, 4, 2),
	(122, 4, 3),
	(100, 3, 5),
	(104, 3, 7),
	(108, 3, 3),
	(114, 3, 5),
	(115, 3, 4),
	(125, 3, 5),
	(120, 3, 2),
	(111, 3, 3),
	(105, 3, 2),
	(123, 3, 3)
;

INSERT INTO BOOK_COPIES
	(BookID, BranchID, NumberOfCopies)
	VALUES
	(101, 4, 2)
;

INSERT INTO BORROWER
	(CardNo, NameBRW, AddressBRW, PhoneBRW)
	VALUES
	(483914, 'Keanu Reeves', 'Literally Every Outback Steakhouse', 911),
	(473102, 'Not Kanye West', '254 SE 1st St, Miami, FL 33131', 3053750700),
	(524323, 'Barlen Bercrete', '2603 Ohio Ave, Parkersburg, WV 26101', 3044227427),
	(489512, 'Bronco Sacclin', '5000 S Arizona Mills Cir, Tempe, AZ 85282', 4807529100),
	(482506, 'Jefferson Steelflex', '4401 W Reno Ave, Oklahoma City, OK 73107', 4059499339),
	(984378, 'Alvin Yakitori', '16962 Barbara Ln, Tinley Park, IL 60477', 8723027303),
	(653636, 'Hamtaro Tottoko', '396 South Ave S396, Bloomington, MN 55425', 9528536600),
	(439000, 'Lentil Andrews', '567 W Broadway, Jackson, WY 83002', 3076994826)
;

INSERT INTO BORROWER
	(CardNo, NameBRW, AddressBRW, PhoneBRW)
	VALUES
	(743289, 'Kipland Dynamite', '143 Jitney Lane, Preston, ID 83262', 2088520898)
;

INSERT INTO BOOK_LOANS
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	(108, 2, 439000, '10-5-2018', '10-5-2019'),
	(106, 2, 439000, '10-5-2018', '10-5-2019'),
	(111, 2, 439000, '10-5-2018', '10-5-2019'),
	(105, 2, 439000, '10-5-2018', '10-5-2019'),
	(110, 2, 439000, '10-5-2018', '10-5-2019'),
	(104, 2, 439000, '10-5-2018', '10-5-2019'),
	(114, 4, 482506, '10-5-2018', '10-5-2019'),
	(122, 4, 482506, '10-5-2018', '10-5-2019'),
	(113, 4, 482506, '10-5-2018', '10-5-2019'),
	(105, 4, 482506, '10-5-2018', '10-5-2019'),
	(100, 4, 482506, '10-5-2018', '10-5-2019'),
	(102, 4, 482506, '10-5-2018', '10-5-2019'),
	(114, 3, 483914, '10-5-2018', '10-5-2019'),
	(120, 3, 483914, '10-5-2018', '10-5-2019'),
	(105, 3, 483914, '10-5-2018', '10-5-2019'),
	(115, 3, 483914, '10-5-2018', '10-5-2019'),
	(104, 3, 483914, '10-5-2018', '10-5-2019'),
	(108, 2, 489512, '10-5-2018', '10-5-2019'),
	(100, 4, 489512, '10-5-2018', '10-5-2019'),
	(114, 4, 489512, '10-5-2018', '10-5-2019'),
	(115, 4, 489512, '10-5-2018', '10-5-2019'),
	(102, 4, 489512, '10-5-2018', '10-5-2019'),
	(115, 3, 524323, '10-5-2018', '10-5-2019'),
	(122, 4, 524323, '10-5-2018', '10-5-2019'),
	(104, 4, 524323, '10-5-2018', '10-5-2019'),
	(115, 3, 473102, '10-5-2018', '10-5-2019'),
	(115, 4, 473102, '10-5-2018', '10-5-2019'),
	(106, 2, 473102, '10-5-2018', '10-5-2019'),
	(122, 1, 473102, '10-5-2018', '10-5-2019'),
	(115, 3, 473102, '10-5-2018', '10-5-2019'),
	(112, 4, 984378, '10-5-2018', '10-5-2019'),
	(100, 4, 984378, '10-5-2018', '10-5-2019'),
	(114, 4, 984378, '10-5-2018', '10-5-2019'),
	(126, 4, 984378, '10-5-2018', '10-5-2019'),
	(125, 4, 984378, '10-5-2018', '10-5-2019'),
	(113, 4, 984378, '10-5-2018', '10-5-2019'),
	(100, 4, 653636, '10-5-2018', '10-5-2019'),
	(101, 1, 653636, '10-5-2018', '10-5-2019'),
	(116, 1, 653636, '10-5-2018', '10-5-2019'),
	(122, 1, 653636, '10-5-2018', '10-5-2019'),
	(125, 4, 653636, '10-5-2018', '10-5-2019'),
	(115, 4, 653636, '10-5-2018', '10-5-2019'),
	(115, 4, 483914, '10-5-2018', '10-5-2019'),
	(114, 4, 483914, '10-5-2018', '10-5-2019'),
	(104, 3, 483914, '10-5-2018', '10-5-2019'),
	(122, 1, 483914, '10-5-2018', '10-5-2019'),
	(103, 2, 483914, '10-5-2018', '10-5-2019'),
	(116, 1, 483914, '10-5-2018', '10-5-2019'),
	(119, 1, 483914, '10-5-2018', '10-5-2019'),
	(104, 2, 483914, '10-5-2018', '10-5-2019'),
	(100, 4, 483914, '10-5-2018', '10-5-2019')
;

INSERT INTO BOOK_LOANS
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	(122, 1, 439000, '10-6-2018', '1-27-2019')
;

/* 1. HOW MANY COPIES OF "THE LOST TRIBE" ARE AT THE SHARPSTOWN BRANCH? */

SELECT NumberOfCopies, Title, BranchName
	FROM ((BOOK_COPIES
	INNER JOIN BOOKS ON BOOK_COPIES.BookID = BOOKS.BookID)
	INNER JOIN LIBRARY_BRANCH ON LIBRARY_BRANCH.BranchID = BOOK_COPIES.BranchID)           
	WHERE Title = 'The Lost Tribe' AND BranchName = 'Sharpstown';     

/* 2. HOW MANY COPIES OF "THE LOST TRIBE" ARE AT EACH LIBRARY BRANCH? */

SELECT NumberOfCopies, Title, BranchName
	FROM ((BOOK_COPIES
	INNER JOIN BOOKS ON BOOK_COPIES.BookID = BOOKS.BookID)
	INNER JOIN LIBRARY_BRANCH ON LIBRARY_BRANCH.BranchID = BOOK_COPIES.BranchID)           
	WHERE Title = 'The Lost Tribe';

/* 3. RETRIEVE THE NAMES OF ALL BORROWERS WHO DO NOT HAVE ANY BOOKS CHECKED OUT */

SELECT NameBRW
FROM BORROWER
WHERE CardNo NOT IN (SELECT CardNo FROM BOOK_LOANS);

/* 4. FOR EACH BOOK LOANED OUT FROM SHARPSTOWN WHOS DUE DATE IS TODAY RETRIEVE THE BOOK TITLE,
		BORROWERS NAME AND BORROWERS ADDRESS */

SELECT Title, NameBRW, AddressBRW, BranchName
	FROM (((BOOK_LOANS
	INNER JOIN BOOKS ON BOOKS.BookID = BOOK_LOANS.BookID)
	INNER JOIN BORROWER ON BORROWER.CardNo = BOOK_LOANS.CardNo)
	INNER JOIN LIBRARY_BRANCH ON LIBRARY_BRANCH.BranchID = BOOK_LOANS.BranchID)
	WHERE DateDue = '1-27-2019' AND BranchName = 'Sharpstown';

/* 5. FOR EACH LIBRARY BRANCH RETRIEVE THE BRANCH NAME AND THE TOTAL NUMBER OF BOOKS CHECKED OUT */

SELECT COUNT(BranchName) AS BooksLoaned, BranchName
	FROM (BOOK_LOANS
	INNER JOIN LIBRARY_BRANCH ON LIBRARY_BRANCH.BranchID = BOOK_LOANS.BranchID)
	GROUP BY BranchName;

/* 6. RETRIEVE NAMES, ADDRESSES AND NUMBER OF BOOKS CHECKED OUT FOR ALL BORROWERS WITH MORE THAN 5 BOOKS CHECKED OUT */

SELECT COUNT(BOOK_LOANS.CardNo) AS BooksLoaned, NameBRW, AddressBRW
	FROM (BOOK_LOANS
	INNER JOIN BORROWER ON BORROWER.CardNo = BOOK_LOANS.CardNo)
	GROUP BY NameBRW, AddressBRW
	HAVING COUNT(BOOK_LOANS.CardNo) > 5;

/* 7. RETRIEVE THE TITLE AND THE NUMBER OF COPIES OWNED OF EACH BOOK BY STEPHEN KING AT CENTRAL */

SELECT NumberOfCopies, Title, AuthorName
	FROM (((BOOK_COPIES
	INNER JOIN BOOKS ON BOOKS.BookID = BOOK_COPIES.BookID)
	INNER JOIN BOOK_AUTHORS ON BOOK_AUTHORS.BookID = BOOK_COPIES.BookID)
	INNER JOIN LIBRARY_BRANCH ON LIBRARY_BRANCH.BranchID = BOOK_COPIES.BranchID)
	WHERE BranchName = 'Central';