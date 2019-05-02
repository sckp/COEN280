NAME:		Sarah Pagnani

DESCRIPTION:	This repository contains the files needed to create a RDBMS model of
		a database based off of IMDB and the files needed to perform ten
		queries on the database as defined by the Assignment Two. 

FILES:		createdb.sql
		dropdb.sql
		q1.sql
		q2.sql
		q3.sql
		q4.sql
		q5.sql
		q6.sql
		q7.sql
		q8.sql
		q9.sql
		q10.sql
		readme.txt

DATABASE:	IMDB RDBMS Model

TABLES:		TABLE Votes;
		TABLE Comments;
		TABLE Reviews;
		TABLE Genres;
		TABLE Roles;
		TABLE Scene;
		TABLE Nominated_Movie;
		TABLE Movie;
		TABLE Guest;
		TABLE Episode;
		TABLE TV_Series;
		TABLE Minor;
		TABLE Adult;
		TABLE Profile_Photo;
		TABLE Personal_Photo;
		TABLE Pro_Comp;
		TABLE Person;
		TABLE Nomination;
		TABLE IMDB_User;

EXECUTION RESULT:
Q1:
LAST_NAME	     FIRST_NAME
-------------------- --------------------
Isaac		     Oscar
Neeson	     	     Liam
McGregor	     Ewan
Christensen	     Hayden
Portman 	     Natalie
Ridley		     Daisy
Boyega		     John


Q2:
LAST_NAME	     FIRST_NAME 	    COUNT(*)
-------------------- -------------------- ----------
Spielberg	     Steven			  11
Besson		     Luc			  10
de forma	     Brian			   9


Q3:
LAST_NAME	     FIRST_NAME 	TITLE 				YEAR
--------------------------------------------------------------------------------
Jenkins 	     Barry		Moonlight	 		2016
de forma	     Brian		Lights Out			2016
Besson		     Luc	     	My big fat greek wedding.  	2000
Besson		     Luc		The Big Blue			1988
Spielberg	     Steven		Lincoln		 		2012
de forma	     Brian   		Get To Know Your Rabbit	 	1972

Q4:
LAST_NAME	     FIRST_NAME 	  FILMS_WITH_SPIELBERG
-------------------- -------------------- --------------------
Ford		     Harrison				     3
Hanks		     Tom				     3
Bell		     Jamie				     1
Damon.               Matt				     1
Blanchett	     Cate				     1
Connery 	     Sean				     1
Watson	     	     Emily				     1
Cruise		     Tom				     1
Morton	    	     Samantha				     1
Capshaw 	     Kate				     1
Serkis		     Andy				     1
DiCaprio	     Leonardo				     1
Neeson	     	     Liam				     1
Fiennes 	     Ralph				     1
Jones		     Catherine				     1
Day-Lewis	     Daniel				     1
Irvine		     Jeremy				     1

Q5:
LNAME		     FNAME
-------------------- --------------------
Hanks		     Tom

Q6:
TITLE 								RATING_SPAN
-------------------- ---------------------------------------- --------------------
Angels and Daemons							4.5
Moonlight								4.5
Lincoln									4
Mr. and Mrs Smith							3.5
Schindlers List								3.5
Arthur and the Invisibles						3
Indiana Jones and the Kingdom of the Crystal Skull			3
Scarface								3
Her									2.5
Mission: Impossible							2.5
Star Wars: Episode II - Attack of the Clones				2.5
Star Wars: Episode III - Revenge of the Sith				2.5
Star Wars: The Force Awakens						2.5
Arthur and the Revenge of Maltazard					2
Barely Lethal					 			2
Catch me if you can							2
Indiana Jones and the Last Crusade					2
Saving Private Ryan							2
Scent of a women							2
Star Wars: Episode I - The Phantom Menace				2
The Da Vinci Code							2
The God Father part II							2
Arthur 3: The War of the Two Worlds					1.5
Indiana Jones and the Temple of Doom					1.5
Lights OuT								1.5
The Terminal								1.5
The adventures of Tintin						1.5
Arthur and the Invisibles: The Making of the Years Greatest Adventure  	1
Minority Report								1
The Island								1
The Man with one red shoe						1
Wise Guys								1
Lucy									.5
My big fat greek wedding						.5
The Polar Express							.5
War Horse								.5
Get To Know Your Rabbit							0
The Big Blue								0
The Black Dahlia							0

Q7:
FEMALE_LAST_NAME     FEMALE_FIRST_NAME	  MALE_LAST_NAME    MALE_FIRST_NAME      COUNT(*)
-------------------- -------------------- ------------------------------------- ----------
Portman 	     Natalie		  McGregor		Ewan		 3
Alba		     Jessica		  Hanks			Tom	         2
Johanson	     Scarlett		  Freeman		Morgan		 2
Farrow		     Mia		  Highmore		Freddie 	 2
Portman 	     Natalie		  Christensen		Hayden		 2

Q8:
LAST_NAME	     FIRST_NAME
-------------------- --------------------
Highmore	     Freddie


Q9:
AVERAGE_RATING
--------------
    .260526316

Q10:
LAST_NAME	     FIRST_NAME
-------------------- --------------------
Jones		     Catherine
Alba		     Jessica
Lawrence	     Jennifer
Johanson	     Scarlett
Jolie		     Angelina
Parish		     Alex
DiCaprio	     Leonardo
