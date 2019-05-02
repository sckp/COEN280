--COMPLETED
--For each movie, return the title and the “rating span”, that is, the difference between highest  and lowest ratings given  to that  movie. 
--Sort by rating  span from  highest  to lowest, then  by movie title.

SELECT 			M.title, MAX(R.rating) - MIN(R.rating) AS Rating_Span
FROM 			Movie M, Reviews R
WHERE			M.MID = R.MID
GROUP BY		M.title
ORDER BY		Rating_Span DESC, M.title;
