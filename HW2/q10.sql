--COMPLETED
--The Damon  number  of an actor is the length  of the shortest path  between the  actor and Matt  Damon  in the  "co-acting" graph. 
--That is, Matt  Damon  has Damon  number  0; 
--all actors who acted in the same film  as MD  have Damon  number  1; 
--all actors who acted in the same film  as some  actor with Damon  number  1 have Damon  number  2, etc. 
--Return all actors whose Damon  number  is 2.



SELECT DISTINCT		P1.lname AS Last_Name, P1.fname AS First_Name
FROM				Person P1, Person P2, Roles R1, Roles R2
WHERE				P2.PID IN (		SELECT		R.PID
									FROM 		Roles R, Person MD, Roles MRD
									WHERE		MD.lname = 'Damon'
												AND MRD.PID = MD.PID
												AND R.MID = MRD.MID
												AND R.PID != MRD.PID
								)
					AND P1.PID = R1.PID
					AND P2.PID = R2.PID
					AND R1.MID = R2.MID
					AND P1.PID NOT IN (		SELECT		R.PID
											FROM 		Roles R, Person MD, Roles MRD
											WHERE		MD.lname = 'Damon'
														AND MRD.PID = MD.PID
														AND R.MID = MRD.MID
														AND R.PID != MRD.PID
									)
					AND P1.lname != 'Damon'
;
