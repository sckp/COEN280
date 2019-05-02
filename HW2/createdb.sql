--CREATE TABLES

--IMDB User Table
CREATE TABLE IMDB_User(
	IMDB_ID		VARCHAR(5)		PRIMARY KEY,
	lname 		VARCHAR(50),
	fname		VARCHAR(50),
	email		VARCHAR(50),
	gender		CHAR(1) 		CHECK (gender IN ('F','M')), 
	birthdate	VARCHAR(10),
	birthplace	VARCHAR(4)		
);

CREATE TABLE Pro_Comp(
	CID		VARCHAR(50)		PRIMARY KEY
);

--Profile Photo Table
CREATE TABLE Profile_Photo(
	IMDB_ID		VARCHAR(5)		NOT NULL,
	author 		VARCHAR(50),
	name		VARCHAR(50)		NOT NULL,
	descrip		VARCHAR(200),
	CONSTRAINT profilepk PRIMARY KEY (name),
	CONSTRAINT profilefk FOREIGN KEY (IMDB_ID) REFERENCES IMDB_User(IMDB_ID) ON DELETE CASCADE
);

--Person Table
CREATE TABLE Person(
	PID			VARChAR(5)		PRIMARY KEY,
	lname 		VARCHAR(20) 	NOT NULL,
	fname		VARCHAR(20)		NOT NULL,
	gender		CHAR(1) 		CHECK (gender IN ('F','M')), 
	birthdate	VARCHAR(10)	,
	birthplace	VARCHAR(200),
	attributes 	VARCHAR(20)    
);

--Personal Photo Table
CREATE TABLE Personal_Photo(
	PID		 	VARCHAR(5)		NOT NULL,
	author 		VARCHAR(50),
	name		VARCHAR(50)		NOT NULL,
	descrip		VARCHAR(2000),
	CONSTRAINT personalpk PRIMARY KEY (name),
	CONSTRAINT personalfk FOREIGN KEY (PID) REFERENCES Person(PID) ON DELETE CASCADE
);


--Minor
CREATE TABLE Minor(
	MID			VARCHAR(5)		NOT NULL,
	GID			VARCHAR(5)		NOT NULL,
	CONSTRAINT gpk PRIMARY KEY (MID, GID),
	CONSTRAINT mfk FOREIGN KEY (MID) REFERENCES Person(PID) ON DELETE CASCADE, 
	CONSTRAINT gfk FOREIGN KEY (GID) REFERENCES Person(PID) ON DELETE CASCADE
);

--Adult
CREATE Table Adult(
	WID			VARCHAR(5)		NOT NULL,
	HID 		VARCHAR(5)		NOT NULL,
	year 		NUMBER(4),
	CONSTRAINT adultpk PRIMARY KEY (WID, HID),
	CONSTRAINT wfk FOREIGN KEY (WID) REFERENCES Person(PID) ON DELETE CASCADE,
	CONSTRAINT hfk FOREIGN KEY (HID) REFERENCES Person(PID) ON DELETE CASCADE
);


--Movie Table
CREATE TABLE Movie(
	MID			VARCHAR(5)		PRIMARY KEY,
	PID			VARCHAR(5)		NOT NULL,
	title		VARCHAR(200)	NOT NULL,
	year		NUMBER(4)		NOT NULL,
	CID 		VARCHAR(50),
	contract	NUMBER,
	CONSTRAINT directorfk FOREIGN KEY (PID) REFERENCES Person(PID) ON DELETE CASCADE,
	CONSTRAINT profk FOREIGN KEY (CID) REFERENCES Pro_Comp(CID) ON DELETE CASCADE
	);

--Roles Table
CREATE TABLE Roles(
	MID 		VARCHAR(5)		NOT NULL,
	PID			VARCHAR(5)		NOT NULL,
	role 		VARCHAR(50)	,
	--CONSTRAINT rolepk PRIMARY KEY (MID, PID),
	CONSTRAINT moviefk FOREIGN KEY (MID) REFERENCES Movie(MID) ON DELETE CASCADE,
	CONSTRAINT actorfk FOREIGN KEY (PID) REFERENCES Person(PID) ON DELETE CASCADE
);

--Table of Scenes
CREATE TABLE Scene(
	MID 		VARCHAR(5)		NOT NULL,
	Scene_Num	NUMBER			NOT NULL,
	CONSTRAINT scenepk PRIMARY KEY (MID, Scene_Num),
	CONSTRAINT scenefk FOREIGN KEY (MID) REFERENCES Movie(MID) ON DELETE CASCADE
);


CREATE Table Genres(
	MID 		VARCHAR(5)		NOT NULL,
	genre 		VARCHAR(20)		NOT NULL,
	CONSTRAINT genrepk PRIMARY KEY (MID, genre),
	CONSTRAINT moviegenfk FOREIGN KEY (MID) REFERENCES Movie(MID) ON DELETE CASCADE
);

CREATE TABLE TV_Series(
	TID			VARCHAR(5)		PRIMARY KEY,
	CID 		VARCHAR(50)		NOT NULL,
	contract	NUMBER,
	network		VARCHAR(50),
	name		VARCHAR(50),
	CONSTRAINT tvfk FOREIGN KEY (CID) REFERENCES Pro_Comp(CID) ON DELETE CASCADE
);

--Actor is a guest
CREATE TABLE Guest(
	PID			VARCHAR(5)		NOT NULL,
	TID			VARCHAR(5)		NOT NULL,
	CONSTRAINT guestpk	PRIMARY KEY (PID, TID),
	CONSTRAINT guestpfk	FOREIGN KEY (PID) REFERENCES Person(PID) ON DELETE CASCADE,
	CONSTRAINT guesttfk FOREIGN KEY (TID) REFERENCES TV_Series(TID) ON DELETE CASCADE
);

CREATE TABLE Episode(
	TID			VARCHAR(5)		NOT NULL,
	ep_num		INTEGER			NOT NULL,
	title		VARCHAR(50),
	length		VARCHAR(50),
	CONSTRAINT episodepk PRIMARY KEY (TID, ep_num),
	CONSTRAINT episodefk FOREIGN KEY (TID) REFERENCES TV_Series(TID) ON DELETE CASCADE
);

CREATE TABLE Nomination(
	NID    		VARCHAR(5)		PRIMARY KEY,
	category	VARCHAR(50),
	award		VARCHAR(50),
	event		VARCHAR(50)
);

CREATE TABLE Nominated_Movie(
	NID    		VARCHAR(5)		NOT NULL,
	PID    		VARCHAR(5)		NOT NULL,
	win 		NUMBER(1),
	CONSTRAINT nompk PRIMARY KEY (NID, PID),
	CONSTRAINT nomfk FOREIGN KEY (NID) REFERENCES Nomination(NID) ON DELETE CASCADE,
	CONSTRAINT nompfk FOREIGN KEY (PID) REFERENCES Person(PID) ON DELETE CASCADE
);

--Reviews Table
CREATE TABLE Reviews(
	RID 		VARCHAR(5)		PRIMARY KEY,
	IMDB_ID		VARCHAR(5)		NOT NULL,
	MID			VARCHAR(5)		NOT NULL,
	rating		DECIMAL(2, 1)	NOT NULL,
	date_day	NUMBER(2),
	date_month	NUMBER(2),
	date_year	NUMBER(4),
	date_hour	NUMBER(2),
	date_min	NUMBER(2),
	date_sec	NUMBER(2),
	CONSTRAINT authorfk FOREIGN KEY (IMDB_ID) REFERENCES IMDB_User(IMDB_ID) ON DELETE CASCADE,
	CONSTRAINT movierevfk FOREIGN KEY (MID) REFERENCES Movie(MID) ON DELETE CASCADE
	);

CREATE TABLE Votes(
	RID 		VARCHAR(5)		NOT NULL,
	IMDB_ID		VARCHAR(5)		NOT NULL,
	is_helpful	CHAR(1)			NOT NULL,
	CONSTRAINT rreviewfk FOREIGN KEY (RID) REFERENCES Reviews(RID) ON DELETE CASCADE,
	CONSTRAINT IMDBfk FOREIGN KEY (IMDB_ID) REFERENCES IMDB_User(IMDB_ID) ON DELETE CASCADE
);

CREATE TABLE Comments(
	RID 		VARCHAR(5)		NOT NULL,
	author 		VARCHAR(50),
	text_com	VARCHAR(200),
	date_com	DATE,
	CONSTRAINT reviewfk FOREIGN KEY (RID) REFERENCES Reviews(RID) ON DELETE CASCADE
);

		
--IMDB USER DATA
INSERT INTO IMDB_User VALUES ('ID1', 'Smith', 'John', 'john@yahoo.com', 'M', '10/5/1995', 'FL');
INSERT INTO IMDB_User VALUES ('ID2', 'Carlos', 'Juan', 'juan@gmail.com', 'M', '4/12/1994', 'AK');
INSERT INTO IMDB_User VALUES ('ID3', 'Chapel', 'Jane', 'Jane@gmail.com', 'F', '11/2/1993', 'IL');
INSERT INTO IMDB_User VALUES ('ID4', 'Awasthi', 'Aditya', 'adi@yahoo.com', 'M', '12/12/1992', 'CA');
INSERT INTO IMDB_User VALUES ('ID5', 'Williams', 'James', 'james@hotmail.com', 'M', '5/5/1991', 'NY');
INSERT INTO IMDB_User VALUES ('ID6', 'Brown', 'Mike', 'mike@yahoo.com', 'M', '3/1/1988', 'NC');
INSERT INTO IMDB_User VALUES ('ID7', 'Jones', 'Bob', 'bob@yahoo.com', 'M', '2/7/1988', 'NY ');
INSERT INTO IMDB_User VALUES ('ID8', 'Zhang', 'Wei', 'wei@gmail.com', 'F', '8/12/1985', 'NV');
INSERT INTO IMDB_User VALUES ('ID9', 'Davis', 'Mark', 'mark@gmail.com', 'M', '5/10/1984', 'CA');
INSERT INTO IMDB_User VALUES ('ID10', 'Garcia', 'Daniel', 'daniel@yahoo.com', 'M', '6/1/1980', 'NJ');
INSERT INTO IMDB_User VALUES ('ID11', 'Rodriguez', 'Maria', 'maria@hotmail.com', 'F', '3/18/1975', 'CA');
INSERT INTO IMDB_User VALUES ('ID12', 'Wilson', 'Freya', 'freya@yahoo.com', 'F', '2/19/1970', 'NJ');

--INSERT PERSON DATA
INSERT INTO Person VALUES ('P1', 'de forma', 'Brian', 'M', '9/11/1940', 'New York', 'Director');
INSERT INTO Person VALUES ('P2', 'Brest', 'Martin ', 'M', '8/8/1951', 'San Jose', 'Director');
INSERT INTO Person VALUES ('P3', 'Johanson', 'Scarlett ', 'F', '31008', 'Austin', 'Actor');
INSERT INTO Person VALUES ('P4', 'Besson', 'Luc ', 'F', '5/30/75', 'Paris', 'Director');
INSERT INTO Person VALUES ('P5', 'Freeman', 'Morgan ', 'M', '6/5/1953', 'Canberra', 'Actor');
INSERT INTO Person VALUES ('P6', 'Pacino', 'Al ', 'M', '11/12/1956', 'Portland', 'Actor');
INSERT INTO Person VALUES ('P7', 'Jolie', 'Angelina ', 'F', '3/3/70', 'Seattle', 'Actor');
INSERT INTO Person VALUES ('P8', 'Pitt', 'Brad ', 'M', '4/4/75', 'London', 'Actor');
INSERT INTO Person VALUES ('P9', 'Hanks', 'Tom ', 'M', '5/19/1964', 'Perth', 'Actor');
INSERT INTO Person VALUES ('P10', 'Alba', 'Jessica ', 'F', '8/7/83', 'Seoul', 'Actor');
INSERT INTO Person VALUES ('P11', 'Jones', 'Catherine', 'F', '9/29/1969', 'Swansea', 'Actor');
INSERT INTO Person VALUES ('P12', 'Parish', 'Alex ', 'F', '8/7/83', 'San Jose', 'Actor');
INSERT INTO Person VALUES ('P13', 'DiCaprio', 'Leonardo', 'M', '8/7/83', 'Los Angeles', 'Actor');
INSERT INTO Person VALUES ('P14', 'Cruise', 'Tom ', 'M', '7/3/1962', 'New York', 'Actor');
INSERT INTO Person VALUES ('P15', 'Ford', 'Harrison ', 'M', '9/11/1957', 'Canberra', 'Actor');
INSERT INTO Person VALUES ('P16', 'Roberts', 'Julia ', 'F', '1/1/1967', 'Portland', 'Actor');
INSERT INTO Person VALUES ('P17', 'Damon', 'Matt', 'M', '1/7/71', 'Seattle', 'Actor');
INSERT INTO Person VALUES ('P18', 'Lawrence', 'Jennifer', 'F', '2/2/1962', 'London', 'Actor');
INSERT INTO Person VALUES ('P19', 'clooney', 'George', 'M', '3/3/1965', 'Perth', 'Actor');
INSERT INTO Person VALUES ('P20', 'Morton', 'Samantha', 'F', '5/3/77', 'Notingham', 'Actor');
INSERT INTO Person VALUES ('P21', 'Lucas', 'George', 'M', '5/14/1968', 'Modesto', 'Director');
INSERT INTO Person VALUES ('P22', 'McGregor', 'Ewan', 'M', '3/31/1968', 'Perth', 'Actor');
INSERT INTO Person VALUES ('P23', 'Christensen', 'Hayden', 'M', '4/19/81', 'Vancouver', 'Actor');
INSERT INTO Person VALUES ('P24', 'Neeson', 'Liam', 'M', '6/7/1968', 'Antrim', 'Actor');
INSERT INTO Person VALUES ('P25', 'Portman', 'Natalie', 'F', '5/14/1968', 'Jerusalem', 'Actor');
INSERT INTO Person VALUES ('P26', 'Abrams', 'J.J.', 'M', '6/27/1966', 'New York', 'Director');
INSERT INTO Person VALUES ('P27', 'Ridley', 'Daisy', 'F', '4/10/92', 'London', 'Actor');
INSERT INTO Person VALUES ('P28', 'Boyega', 'John', 'M', '3/17/92', 'London', 'Actor');
INSERT INTO Person VALUES ('P29', 'Isaac', 'Oscar', 'M', '3/9/79', 'Guatemala', 'Actor');
INSERT INTO Person VALUES ('P30', 'Jenkins', 'Barry', 'M', '11/19/79', 'Miami', 'Director');
INSERT INTO Person VALUES ('P31', 'Ali', 'Mahershala', 'M', '2/16/74', 'Oakland', 'Actor');
INSERT INTO Person VALUES ('P32', 'Spielberg', 'Steven', 'M', '12/18/1946', 'Cincinnati', 'Director');
INSERT INTO Person VALUES ('P33', 'Blanchett', 'Cate', 'F', '5/14/1969', 'Victoria', 'Actor');
INSERT INTO Person VALUES ('P34', 'Ford', 'Harrison ', 'M', '7/13/1942', 'Chicago', 'Actor');
INSERT INTO Person VALUES ('P35', 'Connery', 'Sean', 'M', '8/25/1930', 'Edinburg', 'Actor');
INSERT INTO Person VALUES ('P36', 'Capshaw', 'Kate', 'F', '11/3/1953', 'Fort Worth', 'Actor');
INSERT INTO Person VALUES ('P37', 'Fiennes', 'Ralph', 'M', '12/22/1962', 'Ipswich', 'Actor');
INSERT INTO Person VALUES ('P38', 'Palmer', 'Teresa', 'F', '2/26/86', 'Adlaide', 'Actor');
INSERT INTO Person VALUES ('P39', 'Bateman', 'Gabriel', 'F', '9/10/04', 'Turlock', 'Actor');
INSERT INTO Person VALUES ('P40', 'Day-Lewis', 'Daniel', 'M', '4/19/1957', 'London', 'Actor');
INSERT INTO Person VALUES ('P41', 'Irvine', 'Jeremy', 'M', '4/19/90', 'Cambridge', 'Actor');
INSERT INTO Person VALUES ('P42', 'Watson', 'Emily', 'F', '1/14/1967', 'London', 'Actor');
INSERT INTO Person VALUES ('P43', 'Bell', 'Jamie', 'M', '3/14/86', 'Billingam', 'Actor');
INSERT INTO Person VALUES ('P44', 'Serkis', 'Andy', 'M', '4/20/1964', 'London', 'Actor');
INSERT INTO Person VALUES ('P45', 'Scheider', 'Roy', 'M', '11/10/1932', 'Little Rock', 'Actor');
INSERT INTO Person VALUES ('P46', 'Shaw', 'Robert', 'M', '7/9/1927', 'Mayo', 'Actor');
INSERT INTO Person VALUES ('P47', 'Smothers', 'Tom', 'M', '2/2/1937', 'New York', 'Actor');
INSERT INTO Person VALUES ('P48', 'Astin', 'John', 'M', '3/30/1930', 'Baltimore', 'Actor');
INSERT INTO Person VALUES ('P49', 'DeVito', 'Danny', 'M', '11/17/1944', 'New Jersey', 'Actor');
INSERT INTO Person VALUES ('P50', 'Piscopo', 'Joe', 'M', '6/17/1951', 'New Jersey', 'Actor');
INSERT INTO Person VALUES ('P51', 'Farrow', 'Mia', 'F', '02/09/1942', 'Los Angeles', 'Actor');
INSERT INTO Person VALUES ('P52', 'Highmore', 'Freddie', 'M', '2/14/92', 'London', 'Actor');

--INSERT MOVIE DATA 
INSERT INTO Movie VALUES  ('M1', 'P1', 'Scarface', 1988, NULL, NULL);
INSERT INTO Movie VALUES  ('M5', 'P1', 'Mr. and Mrs Smith', 1965, NULL, NULL);
INSERT INTO Movie VALUES  ('M8', 'P1', 'The Man with one red shoe', 1984, NULL, NULL);
INSERT INTO Movie VALUES  ('M13', 'P1', 'The God Father part II', 1975, NULL, NULL);
INSERT INTO Movie VALUES  ('M27', 'P1', 'Get To Know Your Rabbit', 1972, NULL, NULL);
INSERT INTO Movie VALUES  ('M28', 'P1', 'Lights Out ', 2016, NULL, NULL);
INSERT INTO Movie VALUES  ('M32', 'P1', 'Wise Guys', 1986, NULL, NULL);
INSERT INTO Movie VALUES  ('M33', 'P1', 'The Black Dahlia', 2006, NULL, NULL);
INSERT INTO Movie VALUES  ('M34', 'P1', 'Mission: Impossible', 1996, NULL, NULL);
INSERT INTO Movie VALUES  ('M2', 'P2', 'Scent of a women', 1995, NULL, NULL);
INSERT INTO Movie VALUES  ('M9', 'P2', 'The Polar Express', 2010, NULL, NULL);
INSERT INTO Movie VALUES  ('M10', 'P2', 'Her', 2013, NULL, NULL);
INSERT INTO Movie VALUES  ('M15', 'P2', 'Angels and Daemons', 2009, NULL, NULL);
INSERT INTO Movie VALUES  ('M4', 'P21', 'Star Wars: The Force Awakens', 2015, NULL, NULL);
INSERT INTO Movie VALUES  ('M6', 'P21', 'Star Wars: Episode III - Revenge of the Sith ', 2013, NULL, NULL);
INSERT INTO Movie VALUES  ('M11', 'P21', 'Star Wars: Episode I - The Phantom Menace', 1999, NULL, NULL);
INSERT INTO Movie VALUES  ('M21', 'P21', 'Star Wars: Episode II - Attack of the Clones', 2002, NULL, NULL);
INSERT INTO Movie VALUES  ('M17', 'P30', 'Moonlight', 2016, NULL, NULL);
INSERT INTO Movie VALUES  ('M18', 'P32', 'Indiana Jones and the Kingdom of the Crystal Skull', 2008, NULL, NULL);
INSERT INTO Movie VALUES  ('M19', 'P32', 'Indiana Jones and the Last Crusade', 1989, NULL, NULL);
INSERT INTO Movie VALUES  ('M20', 'P32', 'Indiana Jones and the Temple of Doom', 1984, NULL, NULL);
INSERT INTO Movie VALUES  ('M22', 'P32', 'The Terminal ', 2004, NULL, NULL);
INSERT INTO Movie VALUES  ('M23', 'P32', 'Catch me if you can ', 2002, NULL, NULL);
INSERT INTO Movie VALUES  ('M24', 'P32', 'Minority Report ', 2002, NULL, NULL);
INSERT INTO Movie VALUES  ('M25', 'P32', 'Saving Private Ryan', 1998, NULL, NULL);
INSERT INTO Movie VALUES  ('M26', 'P32', 'Schindlers List', 1993, NULL, NULL);
INSERT INTO Movie VALUES  ('M38', 'P32', 'The adventures of Tintin', 2011, NULL, NULL);
INSERT INTO Movie VALUES  ('M39', 'P32', 'War Horse', 2011, NULL, NULL);
INSERT INTO Movie VALUES  ('M40', 'P32', 'Lincoln', 2012, NULL, NULL);
INSERT INTO Movie VALUES  ('M3', 'P4', 'My big fat greek wedding', 2000, NULL, NULL);
INSERT INTO Movie VALUES  ('M7', 'P4', 'Barely Lethal', 2014, NULL, NULL);
INSERT INTO Movie VALUES  ('M12', 'P4', 'The Da Vinci Code', 2005, NULL, NULL);
INSERT INTO Movie VALUES  ('M16', 'P4', 'The Island', 2010, NULL, NULL);
INSERT INTO Movie VALUES  ('M29', 'P4', 'Lucy', 2014, NULL, NULL);
INSERT INTO Movie VALUES  ('M30', 'P4', 'Arthur and the Invisibles ', 2006, NULL, NULL);
INSERT INTO Movie VALUES  ('M31', 'P4', 'The Big Blue', 1988, NULL, NULL);
INSERT INTO Movie VALUES  ('M35', 'P4', 'Arthur and the Invisibles: The Making of the Years Greatest Adventure', 2007, NULL, NULL);
INSERT INTO Movie VALUES  ('M36', 'P4', 'Arthur 3: The War of the Two Worlds', 2010, NULL, NULL);
INSERT INTO Movie VALUES  ('M37', 'P4', 'Arthur and the Revenge of Maltazard ', 2009, NULL, NULL);

--INSERT ROLES DATA
INSERT INTO Roles VALUES ('M1', 'P5', 'Jessica');
INSERT INTO Roles VALUES ('M1', 'P6', 'robert');
INSERT INTO Roles VALUES ('M2', 'P5', 'John');
INSERT INTO Roles VALUES ('M2', 'P6', 'Mark');
INSERT INTO Roles VALUES ('M3', 'P9', 'Alex');
INSERT INTO Roles VALUES ('M3', 'P7', 'Julie');
INSERT INTO Roles VALUES ('M4', 'P27', 'Rey');
INSERT INTO Roles VALUES ('M4', 'P28', 'Finn ');
INSERT INTO Roles VALUES ('M4', 'P29', 'Poe');
INSERT INTO Roles VALUES ('M5', 'P7', 'Jennifer');
INSERT INTO Roles VALUES ('M5', 'P8', 'Tom');
INSERT INTO Roles VALUES ('M5', 'P5', 'Milo');
INSERT INTO Roles VALUES ('M6', 'P23', 'Anakin Skywalker');
INSERT INTO Roles VALUES ('M6', 'P25', 'Padme');
INSERT INTO Roles VALUES ('M6', 'P22', 'Obi-Wan Kenobi');
INSERT INTO Roles VALUES ('M7', 'P10', 'Jane');
INSERT INTO Roles VALUES ('M7', 'P5', 'Brad');
INSERT INTO Roles VALUES ('M8', 'P9', 'Lucas');
INSERT INTO Roles VALUES ('M8', 'P10', 'Juanita');
INSERT INTO Roles VALUES ('M9', 'P9', 'Clayne');
INSERT INTO Roles VALUES ('M9', 'P9', 'Jane');
INSERT INTO Roles VALUES ('M9', 'P9', 'Brad');
INSERT INTO Roles VALUES ('M9', 'P9', 'Lucas');
INSERT INTO Roles VALUES ('M9', 'P9', 'Bradley');
INSERT INTO Roles VALUES ('M9', 'P9', 'Justin');
INSERT INTO Roles VALUES ('M9', 'P17', 'Martin');
INSERT INTO Roles VALUES ('M9', 'P19', 'Mike');
INSERT INTO Roles VALUES ('M10', 'P3', 'Travis');
INSERT INTO Roles VALUES ('M10', 'P5', 'Alexander');
INSERT INTO Roles VALUES ('M10', 'P6', 'Justin');
INSERT INTO Roles VALUES ('M11', 'P22', 'Obi-Wan Kenobi');
INSERT INTO Roles VALUES ('M11', 'P24', 'Qui-Gon Jinn');
INSERT INTO Roles VALUES ('M11', 'P25', 'Padme');
INSERT INTO Roles VALUES ('M12', 'P9', 'Gatek');
INSERT INTO Roles VALUES ('M12', 'P10', 'Rose');
INSERT INTO Roles VALUES ('M12', 'P3', 'maria');
INSERT INTO Roles VALUES ('M13', 'P5', 'Travis');
INSERT INTO Roles VALUES ('M13', 'P6', 'Alexander');
INSERT INTO Roles VALUES ('M13', 'P16', 'Pearl');
INSERT INTO Roles VALUES ('M15', 'P12', 'Sofia');
INSERT INTO Roles VALUES ('M15', 'P18', 'chrissy');
INSERT INTO Roles VALUES ('M15', 'P9', 'Mike');
INSERT INTO Roles VALUES ('M16', 'P10', 'Martin');
INSERT INTO Roles VALUES ('M16', 'P15', 'Bill');
INSERT INTO Roles VALUES ('M16', 'P16', 'Emilia');
INSERT INTO Roles VALUES ('M17', 'P31', 'Juan');
INSERT INTO Roles VALUES ('M18', 'P33', 'Irina');
INSERT INTO Roles VALUES ('M18', 'P34', 'Indiana Jones ');
INSERT INTO Roles VALUES ('M19', 'P34', 'Indiana Jones ');
INSERT INTO Roles VALUES ('M19', 'P35', 'Henry');
INSERT INTO Roles VALUES ('M20', 'P34', 'Indiana Jones ');
INSERT INTO Roles VALUES ('M20', 'P36', 'Willie');
INSERT INTO Roles VALUES ('M21', 'P23', 'Anakin Skywalker');
INSERT INTO Roles VALUES ('M21', 'P25', 'Padme');
INSERT INTO Roles VALUES ('M21', 'P22', 'Obi-Wan Kenobi');
INSERT INTO Roles VALUES ('M22', 'P9', 'Viktor ');
INSERT INTO Roles VALUES ('M22', 'P11', 'Amelia');
INSERT INTO Roles VALUES ('M23', 'P9', 'Carl');
INSERT INTO Roles VALUES ('M23', 'P13', 'Frank');
INSERT INTO Roles VALUES ('M24', 'P14', 'John');
INSERT INTO Roles VALUES ('M24', 'P20', 'Agatha');
INSERT INTO Roles VALUES ('M25', 'P9', 'Captain Miller');
INSERT INTO Roles VALUES ('M25', 'P17', 'Private Ryan');
INSERT INTO Roles VALUES ('M26', 'P24', 'Oskar');
INSERT INTO Roles VALUES ('M26', 'P37', 'Amon');
INSERT INTO Roles VALUES ('M27', 'P47', 'Donald Beeman');
INSERT INTO Roles VALUES ('M27', 'P48', 'Mr. Turnbull');
INSERT INTO Roles VALUES ('M28', 'P38', 'Rebecca');
INSERT INTO Roles VALUES ('M28', 'P39', 'Martin');
INSERT INTO Roles VALUES ('M29', 'P3', 'Lucy');
INSERT INTO Roles VALUES ('M29', 'P5', 'Professor Norman');
INSERT INTO Roles VALUES ('M30', 'P51', 'Granny');
INSERT INTO Roles VALUES ('M30', 'P52', 'Arthur');
INSERT INTO Roles VALUES ('M31', 'P5', 'Broddy');
INSERT INTO Roles VALUES ('M31', 'P6', 'Quint');
INSERT INTO Roles VALUES ('M32', 'P49', 'Harry');
INSERT INTO Roles VALUES ('M32', 'P50', 'Moe');
INSERT INTO Roles VALUES ('M33', 'P3', 'Kay');
INSERT INTO Roles VALUES ('M34', 'P14', 'Ethan Hunt');
INSERT INTO Roles VALUES ('M35', 'P51', 'Granny');
INSERT INTO Roles VALUES ('M35', 'P52', 'Arthur');
INSERT INTO Roles VALUES ('M36', 'P51', 'Granny');
INSERT INTO Roles VALUES ('M37', 'P52', 'Arthur');
INSERT INTO Roles VALUES ('M38', 'P44', 'Captain haddock');
INSERT INTO Roles VALUES ('M38', 'P43', 'Tintin');
INSERT INTO Roles VALUES ('M39', 'P42', 'Rose');
INSERT INTO Roles VALUES ('M39', 'P41', 'Albert');
INSERT INTO Roles VALUES ('M40', 'P40', 'Abraham Lincoln');

--INSERT REVIEWS DATA
INSERT INTO Reviews VALUES ('1', 'ID1', 'M1', 1, 29, 10, 2006, 23, 17, 16);
INSERT INTO Reviews VALUES ('2', 'ID1', 'M2', 4.5, 29, 10, 2006, 23, 23, 44);
INSERT INTO Reviews VALUES ('3', 'ID1', 'M3', 4, 29, 10, 2006, 23, 30, 8);
INSERT INTO Reviews VALUES ('4', 'ID1', 'M4', 2, 29, 10, 2006, 23, 16, 52);
INSERT INTO Reviews VALUES ('5', 'ID1', 'M5', 4, 29, 10, 2006, 23, 29, 30);
INSERT INTO Reviews VALUES ('6', 'ID1', 'M6', 4.5, 29, 10, 2006, 23, 25, 15);
INSERT INTO Reviews VALUES ('7', 'ID1', 'M7', 3.5, 29, 10, 2006, 23, 17, 37);
INSERT INTO Reviews VALUES ('8', 'ID1', 'M8', 5, 29, 10, 2006, 23, 24, 49);
INSERT INTO Reviews VALUES ('9', 'ID1', 'M9', 3.5, 29, 10, 2006, 23, 17, 0);
INSERT INTO Reviews VALUES ('10', 'ID1', 'M10', 2, 29, 10, 2006, 23, 16, 42);
INSERT INTO Reviews VALUES ('11', 'ID1', 'M11', 4, 29, 10, 2006, 23, 28, 21);
INSERT INTO Reviews VALUES ('12', 'ID1', 'M12', 3, 29, 10, 2006, 23, 17, 5);
INSERT INTO Reviews VALUES ('13', 'ID1', 'M13', 4.5, 29, 10, 2006, 23, 17, 49);
INSERT INTO Reviews VALUES ('14', 'ID1', 'M15', 0.5, 29, 10, 2006, 23, 17, 8);
INSERT INTO Reviews VALUES ('15', 'ID1', 'M16', 4.5, 29, 10, 2006, 23, 26, 17);
INSERT INTO Reviews VALUES ('16', 'ID1', 'M17', 4, 29, 10, 2006, 23, 24, 45);
INSERT INTO Reviews VALUES ('17', 'ID1', 'M18', 3.5, 29, 10, 2006, 23, 28, 52);
INSERT INTO Reviews VALUES ('18', 'ID1', 'M19', 4.5, 29, 10, 2006, 23, 28, 56);
INSERT INTO Reviews VALUES ('19', 'ID1', 'M20', 4, 29, 10, 2006, 23, 30, 5);
INSERT INTO Reviews VALUES ('20', 'ID1', 'M21', 2.5, 29, 10, 2006, 23, 16, 56);
INSERT INTO Reviews VALUES ('21', 'ID2', 'M1', 4, 29, 10, 2006, 23, 25, 11);
INSERT INTO Reviews VALUES ('22', 'ID2', 'M2', 4, 29, 10, 2006, 23, 17, 20);
INSERT INTO Reviews VALUES ('23', 'ID2', 'M3', 4, 29, 10, 2006, 23, 17, 46);
INSERT INTO Reviews VALUES ('24', 'ID2', 'M4', 4.5, 29, 10, 2006, 23, 24, 1);
INSERT INTO Reviews VALUES ('25', 'ID2', 'M5', 2.5, 29, 10, 2006, 23, 26, 3);
INSERT INTO Reviews VALUES ('26', 'ID2', 'M6', 2, 29, 10, 2006, 23, 16, 39);
INSERT INTO Reviews VALUES ('27', 'ID2', 'M7', 1.5, 29, 10, 2006, 23, 17, 33);
INSERT INTO Reviews VALUES ('28', 'ID2', 'M8', 4, 29, 10, 2006, 23, 29, 25);
INSERT INTO Reviews VALUES ('29', 'ID2', 'M9', 4, 29, 10, 2006, 23, 29, 35);
INSERT INTO Reviews VALUES ('30', 'ID2', 'M10', 4.5, 29, 10, 2006, 23, 30, 50);
INSERT INTO Reviews VALUES ('31', 'ID2', 'M11', 3, 29, 10, 2006, 23, 17, 56);
INSERT INTO Reviews VALUES ('32', 'ID2', 'M12', 3, 29, 10, 2006, 23, 22, 26);
INSERT INTO Reviews VALUES ('33', 'ID2', 'M13', 4.5, 29, 10, 2006, 23, 17, 52);
INSERT INTO Reviews VALUES ('34', 'ID3', 'M15', 3.5, 29, 10, 2006, 23, 24, 54);
INSERT INTO Reviews VALUES ('35', 'ID3', 'M16', 4.5, 29, 10, 2006, 23, 30, 12);
INSERT INTO Reviews VALUES ('36', 'ID3', 'M17', 1.5, 29, 10, 2006, 23, 26, 8);
INSERT INTO Reviews VALUES ('37', 'ID3', 'M18', 3, 29, 10, 2006, 23, 29, 16);
INSERT INTO Reviews VALUES ('38', 'ID3', 'M19', 3, 29, 10, 2006, 23, 22, 43);
INSERT INTO Reviews VALUES ('39', 'ID3', 'M20', 3.5, 29, 10, 2006, 23, 25, 24);
INSERT INTO Reviews VALUES ('40', 'ID3', 'M21', 3.5, 29, 10, 2006, 23, 30, 34);
INSERT INTO Reviews VALUES ('41', 'ID3', 'M1', 3, 29, 10, 2006, 23, 26, 11);
INSERT INTO Reviews VALUES ('42', 'ID3', 'M2', 2.5, 29, 10, 2006, 23, 29, 51);
INSERT INTO Reviews VALUES ('43', 'ID3', 'M3', 3.5, 29, 10, 2006, 23, 30, 40);
INSERT INTO Reviews VALUES ('44', 'ID3', 'M4', 4, 29, 10, 2006, 23, 26, 21);
INSERT INTO Reviews VALUES ('45', 'ID3', 'M5', 0.5, 29, 10, 2006, 23, 21, 25);
INSERT INTO Reviews VALUES ('46', 'ID3', 'M6', 4, 29, 10, 2006, 23, 28, 12);
INSERT INTO Reviews VALUES ('47', 'ID3', 'M7', 3.5, 29, 10, 2006, 23, 25, 8);
INSERT INTO Reviews VALUES ('48', 'ID3', 'M8', 4.5, 29, 10, 2006, 23, 24, 15);
INSERT INTO Reviews VALUES ('49', 'ID4', 'M9', 3.5, 29, 10, 2006, 23, 30, 36);
INSERT INTO Reviews VALUES ('50', 'ID4', 'M10', 4.5, 29, 10, 2006, 23, 25, 18);
INSERT INTO Reviews VALUES ('51', 'ID4', 'M11', 5, 29, 10, 2006, 23, 24, 51);
INSERT INTO Reviews VALUES ('52', 'ID5', 'M12', 3, 4, 12, 2005, 6, 23, 16);
INSERT INTO Reviews VALUES ('53', 'ID5', 'M13', 4, 4, 12, 2005, 6, 22, 4);
INSERT INTO Reviews VALUES ('54', 'ID5', 'M15', 5, 4, 12, 2005, 6, 24, 43);
INSERT INTO Reviews VALUES ('55', 'ID5', 'M16', 4, 4, 12, 2005, 6, 21, 8);
INSERT INTO Reviews VALUES ('56', 'ID5', 'M17', 3, 19, 8, 2007, 19, 7, 25);
INSERT INTO Reviews VALUES ('57', 'ID6', 'M18', 3.5, 4, 12, 2005, 6, 41, 48);
INSERT INTO Reviews VALUES ('58', 'ID6', 'M19', 3.5, 4, 12, 2005, 6, 41, 1);
INSERT INTO Reviews VALUES ('59', 'ID6', 'M20', 5, 4, 12, 2005, 6, 31, 48);
INSERT INTO Reviews VALUES ('60', 'ID6', 'M21', 5, 19, 8, 2007, 19, 10, 52);
INSERT INTO Reviews VALUES ('61', 'ID6', 'M22', 3.5, 4, 12, 2005, 6, 41, 22);
INSERT INTO Reviews VALUES ('62', 'ID6', 'M23', 3, 9, 7, 2006, 9, 6, 16);
INSERT INTO Reviews VALUES ('63', 'ID7', 'M24', 4, 4, 12, 2005, 6, 39, 34);
INSERT INTO Reviews VALUES ('64', 'ID7', 'M25', 3, 4, 12, 2005, 6, 42, 31);
INSERT INTO Reviews VALUES ('65', 'ID7', 'M26', 4, 9, 7, 2006, 9, 6, 12);
INSERT INTO Reviews VALUES ('66', 'ID7', 'M27', 5, 4, 12, 2005, 6, 41, 44);
INSERT INTO Reviews VALUES ('67', 'ID7', 'M28', 5, 4, 12, 2005, 6, 17, 15);
INSERT INTO Reviews VALUES ('68', 'ID7', 'M29', 4, 4, 12, 2005, 6, 6, 20);
INSERT INTO Reviews VALUES ('69', 'ID7', 'M30', 1, 19, 8, 2007, 19, 7, 18);
INSERT INTO Reviews VALUES ('70', 'ID7', 'M31', 5, 4, 12, 2005, 6, 39, 39);
INSERT INTO Reviews VALUES ('71', 'ID7', 'M32', 5, 4, 12, 2005, 6, 5, 43);
INSERT INTO Reviews VALUES ('72', 'ID8', 'M33', 5, 30, 8, 2007, 4, 28, 31);
INSERT INTO Reviews VALUES ('73', 'ID8', 'M34', 5, 19, 8, 2007, 19, 10, 32);
INSERT INTO Reviews VALUES ('74', 'ID8', 'M35', 5, 19, 8, 2007, 19, 10, 18);
INSERT INTO Reviews VALUES ('75', 'ID8', 'M36', 3.5, 4, 12, 2005, 6, 41, 32);
INSERT INTO Reviews VALUES ('76', 'ID8', 'M37', 5, 4, 12, 2005, 6, 23, 8);
INSERT INTO Reviews VALUES ('77', 'ID8', 'M38', 5, 4, 12, 2005, 6, 40, 56);
INSERT INTO Reviews VALUES ('78', 'ID8', 'M39', 4, 4, 12, 2005, 6, 42, 23);
INSERT INTO Reviews VALUES ('79', 'ID8', 'M40', 5, 4, 12, 2005, 6, 18, 13);
INSERT INTO Reviews VALUES ('80', 'ID8', 'M12', 5, 4, 12, 2005, 6, 38, 34);
INSERT INTO Reviews VALUES ('81', 'ID9', 'M13', 3, 4, 12, 2005, 6, 6, 51);
INSERT INTO Reviews VALUES ('82', 'ID9', 'M15', 3.5, 4, 12, 2005, 6, 31, 31);
INSERT INTO Reviews VALUES ('83', 'ID9', 'M16', 5, 9, 7, 2006, 9, 5, 53);
INSERT INTO Reviews VALUES ('84', 'ID9', 'M17', 0.5, 4, 12, 2005, 6, 6, 37);
INSERT INTO Reviews VALUES ('85', 'ID9', 'M18', 4, 4, 12, 2005, 6, 27, 19);
INSERT INTO Reviews VALUES ('86', 'ID9', 'M19', 4, 4, 12, 2005, 6, 17, 48);
INSERT INTO Reviews VALUES ('87', 'ID9', 'M20', 4, 4, 12, 2005, 6, 40, 36);
INSERT INTO Reviews VALUES ('88', 'ID9', 'M21', 3, 4, 12, 2005, 6, 6, 9);
INSERT INTO Reviews VALUES ('89', 'ID9', 'M22', 5, 9, 7, 2006, 9, 5, 50);
INSERT INTO Reviews VALUES ('90', 'ID9', 'M23', 5, 4, 12, 2005, 6, 5, 49);
INSERT INTO Reviews VALUES ('91', 'ID9', 'M24', 4, 4, 12, 2005, 6, 28, 30);
INSERT INTO Reviews VALUES ('92', 'ID10', 'M25', 5, 4, 12, 2005, 6, 25, 10);
INSERT INTO Reviews VALUES ('93', 'ID10', 'M26', 0.5, 4, 12, 2005, 6, 40, 5);
INSERT INTO Reviews VALUES ('94', 'ID10', 'M27', 5, 4, 12, 2005, 6, 19, 2);
INSERT INTO Reviews VALUES ('95', 'ID10', 'M28', 3.5, 4, 12, 2005, 6, 42, 58);
INSERT INTO Reviews VALUES ('96', 'ID10', 'M29', 3.5, 4, 12, 2005, 6, 40, 38);
INSERT INTO Reviews VALUES ('97', 'ID10', 'M30', 4, 4, 12, 2005, 6, 22, 20);
INSERT INTO Reviews VALUES ('98', 'ID10', 'M31', 5, 19, 8, 2007, 19, 2, 15);
INSERT INTO Reviews VALUES ('99', 'ID10', 'M32', 4, 4, 12, 2005, 6, 39, 11);
INSERT INTO Reviews VALUES ('100', 'ID10', 'M33', 5, 19, 8, 2007, 19, 4, 30);
INSERT INTO Reviews VALUES ('101', 'ID10', 'M34', 2.5, 4, 12, 2005, 6, 17, 27);
INSERT INTO Reviews VALUES ('102', 'ID10', 'M35', 4, 4, 12, 2005, 6, 31, 25);
INSERT INTO Reviews VALUES ('103', 'ID10', 'M36', 5, 4, 12, 2005, 6, 25, 58);
INSERT INTO Reviews VALUES ('104', 'ID10', 'M37', 3, 4, 12, 2005, 6, 43, 4);
INSERT INTO Reviews VALUES ('105', 'ID10', 'M38', 3.5, 4, 12, 2005, 6, 31, 50);
INSERT INTO Reviews VALUES ('106', 'ID10', 'M39', 3.5, 4, 12, 2005, 6, 27, 4);
INSERT INTO Reviews VALUES ('107', 'ID10', 'M40', 2, 9, 7, 2006, 9, 5, 47);
INSERT INTO Reviews VALUES ('108', 'ID10', 'M12', 5, 4, 12, 2005, 6, 26, 53);
INSERT INTO Reviews VALUES ('109', 'ID10', 'M13', 5, 4, 12, 2005, 6, 23, 40);
INSERT INTO Reviews VALUES ('110', 'ID10', 'M15', 3.5, 4, 12, 2005, 6, 41, 53);
INSERT INTO Reviews VALUES ('111', 'ID10', 'M16', 5, 4, 12, 2005, 6, 25, 15);
INSERT INTO Reviews VALUES ('112', 'ID10', 'M17', 5, 4, 12, 2005, 6, 19, 18);
INSERT INTO Reviews VALUES ('113', 'ID10', 'M18', 1, 9, 7, 2006, 9, 5, 41);
INSERT INTO Reviews VALUES ('114', 'ID10', 'M19', 5, 4, 12, 2005, 6, 29, 8);
INSERT INTO Reviews VALUES ('115', 'ID10', 'M20', 5, 19, 8, 2007, 19, 6, 20);
INSERT INTO Reviews VALUES ('116', 'ID11', 'M21', 5, 9, 7, 2006, 9, 9, 38);
INSERT INTO Reviews VALUES ('117', 'ID11', 'M22', 5, 4, 12, 2005, 6, 24, 34);
INSERT INTO Reviews VALUES ('118', 'ID11', 'M23', 4, 4, 12, 2005, 6, 22, 2);
INSERT INTO Reviews VALUES ('119', 'ID11', 'M24', 5, 9, 7, 2006, 9, 5, 34);
INSERT INTO Reviews VALUES ('120', 'ID11', 'M25', 4, 4, 12, 2005, 6, 16, 25);
INSERT INTO Reviews VALUES ('121', 'ID12', 'M40', 1, 4, 12, 2005, 6, 20, 21);

--INSERT GENRES DATA
INSERT INTO Genres VALUES  ('M1', 'Action');
INSERT INTO Genres VALUES  ('M2', 'Action,Comedy');
INSERT INTO Genres VALUES  ('M3', 'Comedy, Drama');
INSERT INTO Genres VALUES  ('M4', 'Action');
INSERT INTO Genres VALUES  ('M5', 'Comedy,Action');
INSERT INTO Genres VALUES  ('M6', 'Action');
INSERT INTO Genres VALUES  ('M7', 'Action');
INSERT INTO Genres VALUES  ('M8', 'comedy');
INSERT INTO Genres VALUES  ('M9', 'comedy');
INSERT INTO Genres VALUES  ('M10', 'Drama');
INSERT INTO Genres VALUES  ('M11', 'Action');
INSERT INTO Genres VALUES  ('M12', 'Action, Drama');
INSERT INTO Genres VALUES  ('M13', 'Action, Drama');
INSERT INTO Genres VALUES  ('M15', 'Action, Drama');
INSERT INTO Genres VALUES  ('M16', 'Action, Comedy');
INSERT INTO Genres VALUES  ('M17', 'Drama');
INSERT INTO Genres VALUES  ('M18', 'Action');
INSERT INTO Genres VALUES  ('M19', 'Action');
INSERT INTO Genres VALUES  ('M20', 'Action');
INSERT INTO Genres VALUES  ('M21', 'Action');
INSERT INTO Genres VALUES  ('M22', 'Comedy');
INSERT INTO Genres VALUES  ('M23', 'Action');
INSERT INTO Genres VALUES  ('M24', 'Action');
INSERT INTO Genres VALUES  ('M25', 'Action');
INSERT INTO Genres VALUES  ('M26', 'Drama,Action');
INSERT INTO Genres VALUES  ('M27', 'Comedy,Drama');
INSERT INTO Genres VALUES  ('M28', 'Drama');
INSERT INTO Genres VALUES  ('M29', 'Action');
INSERT INTO Genres VALUES  ('M30', 'Comedy');
INSERT INTO Genres VALUES  ('M31', 'Drama');
INSERT INTO Genres VALUES  ('M32', 'Comedy');
INSERT INTO Genres VALUES  ('M33', 'Drama');
INSERT INTO Genres VALUES  ('M34', 'Action');
INSERT INTO Genres VALUES  ('M35', 'Comedy');
INSERT INTO Genres VALUES  ('M36', 'Comedy');
INSERT INTO Genres VALUES  ('M37', 'Comedy');
INSERT INTO Genres VALUES  ('M38', 'Drama, Comedy');
INSERT INTO Genres VALUES  ('M39', 'Drama,Comedy');
INSERT INTO Genres VALUES  ('M40', 'Drama');













































