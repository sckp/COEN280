--COMPLETED
--Find all the actors who acted in films by at least 4 distinct directors 
--(i.e. actors who worked with at least 4 distinct directors).

SELECT DISTINCT		P.lname, P.fname
FROM 				Person P, Roles R, Movie M
WHERE				P.attributes = 'Actor'
					AND P.PId = R.PID
					AND R.MID = M.MID
GROUP BY 			P.lname, P.fname
HAVING				COUNT(DISTINCT M.PID) >= 4;
