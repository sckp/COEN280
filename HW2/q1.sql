--COMPLETED
--List the  first and last names  of all the actors and actresses who played in any of Star Warmovies.

SELECT DISTINCT		P.lname AS Last_Name, P.fname AS First_Name
FROM 				Person P, Roles R, Movie M 
WHERE 				M.title LIKE '%Star Wars%' 
					and P.attributes LIKE '%Actor%' 
					and P.PID = R.PID
					and M.MID = R.MID;
