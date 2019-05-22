--CREATE TABLES

--MOVIE TABLE
CREATE TABLE MOVIE (
	movieID			NUMBER			NOT NULL,
	CONSTRAINT moviePK PRIMARY KEY (movieID)
);

--USER TABLE
CREATE TABLE USER (
	userID			NUMBER			NOT NULL,
	CONSTRAINT userPK PRIMARY KEY (userID)
);

--ACTOR TABLE
CREATE TABLE ACTORS(
	movieID			NUMBER			NOT NULL,
	actorID			VARCHAR(50)		NOT NULL,
	actorName		VARCHAR(50),
	ranking			NUMBER,
	CONSTRAINT actorPK PRIMARY KEY (actorID),
	CONSTRAINT actorMovieFK FOREIGN KEY (movieID) REFERENCES MOVIE(movieID) ON DELETE CASCADE
);

--COUNTRY TABLE
CREATE TABLE COUNTRY(
	movieID			NUMBER			NOT NULL,
	place			VARCHAR(50),
	COSNTRAINT countryPK PRIMARY KEY (movieID),
	CONSTRAINT countryMovieFK FOREIGN KEY (movieID) REFERENCES MOVIE(movieID) ON DELETE CASCADE
);

--DIRECTOR TABLE
CREATE TABLE DIRECTOR(
	movieID			NUMBER			NOT NULL,
	directorID		VARCHAR(50)		NOT NULL,
	directorName	VARCHAR(50),
	CONSTRAINT directorPK PRIMARY KEY (directorID),
	CONSTRAINT directorMoviefk FOREIGN KEY (movieID) REFERENCES MOVIE(movieID) ON DELETE CASCADE
);

--GENRES TABLE
CREATE TABLE GENRES(
	movieID			VARCHAR(5)			NOT NULL,
	genre 			VARCHAR(50),
	COSNTRAINT genresPK PRIMARY KEY (movieID),
	CONSTRAINT genresMovieFK FOREIGN KEY (movieID) REFERENCES MOVIE(movieID) ON DELETE CASCADE
);

--LOCATION TABLE
CREATE TABLE LOCATION(
	movieID			NUMBER			NOT NULL,
	location1		VARCHAR(50),
	location2		VARCHAR(50),
	location3		VARCHAR(50),
	location4		VARCHAR(50),
	CONSTRAINT locationPK PRIMARY KEY (movieID),
	CONSTRAINT locationMovieFK FOREIGN KEY (movieID) REFERENCES MOVIE(movieID) ON DELETE CASCADE	
);

--TAGS TABLE
CREATE TABLE TAGS(
	movieID			NUMBER			NOT NULL,
	tagID			NUMBER			NOT NULL,
	tagWeight		NUMBER,
	CONSTRAINT tagsPK PRIMARY KEY (tagID),
	CONSTRAINT tagsFK FOREIGN KEY (movieID) REFERENCES MOVIE(movieID) ON DELETE CASCADE
);

--RATED TIMESTAMP TABLE
CREATE TABLE RATED_TIMESTAMP(
	userID			NUMBER			NOT NULL,
	movieID			NUMBER			NOT NULL,
	rating			DECIMAL(2,1),
	rTimestamp      NUMBER,
	CONSTRAINT ratedTPK PRIMARY KEY (userID, movieID),
	CONSTRAINT ratedTMovieFK FOREIGN KEY (movieID) REFERENCES MOVIE(movieID) ON DELETE CASCADE,
	CONSTRAINT rateTUserFK FOREIGN KEY (userID) REFERENCES USER(userID) ON DELETE CASCADE
);

--RATED TABLE
CREATE TABLE RATED(
	userID			NUMBER			NOT NULL,
	movieID			NUMBER			NOT NULL,
	rating			DECIMAL(2,1),
	date_day		NUMBER,
	date_month		NUMBER,
	date_year		NUMBER,
	date_hour		NUMBER,
	date_minute		NUMBER,
	date_second		NUMBER,
	CONSTRAINT ratedPK PRIMARY KEY (userID, movieID),
	CONSTRAINT ratedMovieFK FOREIGN KEY (movieID) REFERENCES MOVIE(movieID) ON DELETE CASCADE,
	CONSTRAINT rateUserFK FOREIGN KEY (userID) REFERENCES USER(userID) ON DELETE CASCADE
);


--TAGGED TIMESTAMP TABLE
CREATE TABLE TAGGED_TIMESTAMP(
	userID			NUMBER			NOT NULL,
	movieID			NUMBER			NOT NULL,
	tagID 			NUMBER			NOT NULL,
	tTimestamp 		NUMBER,
	CONSTRAINT taggedTPK PRIMARY KEY (tagID),
	CONSTRAINT taggedTTagsFK FOREIGN KEY (tagID) REFERENCES TAGS(tagID) ON DELETE CASCADE,
	CONSTRAINT taggedTMovieFK FOREIGN KEY (movieID) REFERENCES MOVIE(movieID) ON DELETE CASCADE,
	CONSTRAINT taggedTUserFK FOREIGN KEY (userID) REFERENCES USER(userID) ON DELETE CASCADE
);

--TAGGED TABLE
CREATE TABLE TAGGED(
	userID			NUMBER			NOT NULL,
	movieID			NUMBER			NOT NULL,
	tagID 			NUMBER			NOT NULL,
	date_day		NUMBER,
	date_month		NUMBER,
	date_year		NUMBER,
	date_hour		NUMBER,
	date_minute		NUMBER,
	date_second		NUMBER,
	CONSTRAINT taggedPK PRIMARY KEY (tagID),
	CONSTRAINT taggedTagsFK FOREIGN KEY (tagID) REFERENCES TAGS(tagID) ON DELETE CASCADE,
	CONSTRAINT taggedMovieFK FOREIGN KEY (movieID) REFERENCES MOVIE(movieID) ON DELETE CASCADE,
	CONSTRAINT taggedUserFK FOREIGN KEY (userID) REFERENCES USER(userID) ON DELETE CASCADE
);


--CREATE INDEXES


