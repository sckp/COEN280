--COMPLETED
--For every pair of male and female actors that  appear together  in at least two films, 
--find the total number  of movies in which they  appear together.  
--Sort the  answers in decreasing order of the total number  of movies.

SELECT		P1.lname AS Female_Last_Name, P1.fname AS Female_First_Name, P2.lname AS Male_Last_Name, P2.fname AS Male_First_Name, COUNT(*)
FROM		Person P1, Person P2, Roles R1, Roles R2
WHERE		P1.gender = 'F'
			AND P2.gender = 'M'
			AND P1.PID = R1.PID
			AND P2.PID = R2.PID
			AND R1.MID = R2.MID
GROUP BY	P1.lname, P1.fname, P2.lname, P2.fname
HAVING 		COUNT(*)>=2
ORDER BY 	COUNT(*) DESC;
