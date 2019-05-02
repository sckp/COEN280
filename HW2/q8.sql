--COMPLETED
--Assuming  that  actors are unemployed  between two consecutive movies, 
--list all actors that  were never been unemployed  for more than  2 years.

--COMPLETED
--Assuming  that  actors are unemployed  between two consecutive movies, 
--list all actors that were never unemployed  for more than  2 years.

SELECT DISTINCT 	P.lname AS Last_Name, P.fname AS First_Name
FROM				Person P, Roles R
WHERE				NOT EXISTS ( 	SELECT 	R1.PID
									FROM 	Roles R1, Roles R2, Movie M1, Movie M2	
									WHERE	R1.PID = P.PID
											AND R2.PID = R1.PID
											AND	R1.MID = M1.MID
											AND R2.MID = M2.MID
											AND M1.year - 2 > M2.year
											AND	NOT EXISTS (	SELECT	*
													FROM 	Movie M3, Roles R3
													WHERE	R3.PID = P.PID
															AND R3.MID = M3.MID
															AND M3.year > M2.year
															AND M1.year > M3.year
												)
								)
					AND R.PID = P.PID
GROUP BY			P.PID, P.lname, P.fname
HAVING 				COUNT(*) >=2;
					
