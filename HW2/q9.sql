--Find the difference between the average rating  of movies released before 2005 and the average rating  of movies released after 2005. 
--(Make sure to calculate the  average rating for each movie, then  the  average of those averages for movies before 2005 and movies after. 
--Don't just calculate the  overall average rating  before and after 2005.)

SELECT		DISTINCT AVG(Before_Rating.average)-AVG(After_Rating.average) AS Average_Rating
FROM		(	SELECT		AVG(R.rating) AS average
				FROM		Reviews R, Movie M
				WHERE 		M.year < 2005
							AND M.MID = R.MID
				GROUP BY	R.MID
			) Before_Rating, 
			(	SELECT		AVG(R.rating) AS average
				FROM		Reviews R, Movie M
				WHERE 		M.year > 2005
							AND M.MID = R.MID
				GROUP BY	R.MID
			) After_Rating;
