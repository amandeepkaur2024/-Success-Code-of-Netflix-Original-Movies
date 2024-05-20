--Q1 What is the average IMDB score for each genre?
SELECT ISNULL(LEFT(genre, CHARINDEX('/', genre + '/') - 1), genre) AS primary_genre,
       ROUND(AVG(IMDB_Score),1) AS Avg_IMDB_Score
FROM dbo.NetflixOriginals
GROUP BY ISNULL(LEFT(genre, CHARINDEX('/', genre + '/') - 1), genre)
ORDER BY Avg_IMDB_Score DESC;

--Q2 Which genre has the highest average runtime?
SELECT TOP 1 ISNULL(LEFT(	genre, CHARINDEX('/', genre +'/') -1), genre) AS primary_genre, 
       AVG(Runtime) AS Average_Runtime
FROM dbo.NetflixOriginals
GROUP BY ISNULL(LEFT(	genre, CHARINDEX('/', genre +'/') -1), genre)
ORDER BY Average_Runtime DESC;

--Q3 Are longer movies rated higher on IMDB?
SELECT Runtime, AVG(IMDB_Score) AS Average_Runtime
FROM dbo.NetflixOriginals
GROUP BY Runtime
ORDER BY Average_Runtime DESC;

--Q4 What is the distribution of movies across different languages?
SELECT Language, COUNT(*) AS Movie_Count
FROM dbo.NetflixOriginals
GROUP BY Language
ORDER BY Movie_Count DESC;

--Q5 What is the trend in the number of releases over the years?
SELECT TOP 1 YEAR(Premiere) AS Years, Count(Premiere) AS Num_Of_Release
FROM dbo.NetflixOriginals
GROUP BY YEAR(Premiere)
ORDER BY Num_Of_Release DESC;

--Q6 Which year had the highest average IMDB score?
SELECT TOP 1 YEAR(Premiere) AS Years, ROUND(AVG(IMDB_Score),1) AS Average_IMDB_Score
FROM dbo.NetflixOriginals
GROUP BY YEAR(Premiere)
ORDER BY Average_IMDB_Score DESC;

--Q7 Are movies in certain languages rated higher on average?
SELECT TOP 5 ISNULL(LEFT(Language, CHARINDEX('/', Language + '/')-1), Language) AS primary_language, 
       ROUND(AVG(IMDB_Score),1) AS Average_IMDB_Score
FROM dbo.NetflixOriginals
GROUP BY ISNULL(LEFT(Language, CHARINDEX('/', Language + '/')-1), Language)
ORDER BY Average_IMDB_Score DESC;

--Q8 What is the distribution of IMDB scores?
SELECT CONCAT(FLOOR(IMDB_Score - 0.5), '-', FLOOR(IMDB_Score + 0.5)) AS Score_range,
       COUNT(*) AS Movie_Count
FROM dbo.NetflixOriginals
GROUP BY CONCAT(FLOOR(IMDB_Score - 0.5), '-', FLOOR(IMDB_Score + 0.5));

--Q9 What is the most common genre on Netflix?
SELECT TOP 1 ISNULL(LEFT(genre, CHARINDEX('/', genre + '/') - 1), genre) AS primary_genre, COUNT(*) AS Movie_Count
FROM dbo.NetflixOriginals
GROUP BY ISNULL(LEFT(genre, CHARINDEX('/', genre + '/') - 1), genre)
ORDER BY Movie_Count DESC;

--Q10 What is the average runtime of movies released in different months?
SELECT MONTH(Premiere) AS months, AVG(Runtime) AS Average_Runtime
FROM dbo.NetflixOriginals
GROUP BY MONTH(Premiere);