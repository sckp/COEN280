--COMPLETED
--Find the list of actors/actresses that have collaborated with Steven Spielberg the most.

SELECT			P.lname AS Last_Name, P.fname AS First_Name, COUNT(*) AS Films_With_Spielberg
FROM			Person P, Movie M, Roles R, Person P2
WHERE			P2.lname = 'Spielberg'
				AND M.PID = P2.PID
				AND R.MID = M.MID
				AND R.PID = P.PID
GROUP BY		P.PID, P.lname, P.fname
ORDER BY		COUNT(*) DESC;

