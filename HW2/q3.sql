--COMPLETED
--List all the  directors who directed a Drama movie in a leap year. 
--(You need to check that  the genre  is Drama and year is divisible by 4.) 
--Return  director name, the movie title, and the year.

SELECT DISTINCT 		P.lname AS Last_Name, P.fname AS First_Name, M.title AS Title, M.year AS Year
	FROM 				Person P, Movie M, Genres G 
	WHERE 				G.genre like '%Drama%'
						AND M.MID = G.MID
						AND M.PID = P.PID
						AND MOD(M.year, 4) = 0;
