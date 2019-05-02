--COMPLETED
--List all directors who directed 5 movies or more, in descending  order of the number of movies they  directed. 
--Return  the director's name  and the number  of movies he/she directed.

SELECT 		P.lname AS Last_Name, P.fname AS First_Name, COUNT(*)
FROM 		Person P, MOVIE M
WHERE 		P.PID = M.PID
GROUP BY 	P.PID, P.lname, P.fname
HAVING 		COUNT(*)>=5
ORDER BY 	COUNT(*) DESC;

