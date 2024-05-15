--Q1 What is the average IMDB score for each genre?
SELECT 
    primary_genre, 
    AVG(IMDB_Score) AS Avg_IMDB_Score
FROM (
    SELECT 
        CASE 
            WHEN CHARINDEX('/', Genre) > 0 THEN SUBSTRING(Genre, 1, CHARINDEX('/', Genre) - 1)
            ELSE Genre 
        END AS primary_genre, 
        IMDB_Score
    FROM 
        dbo.NetflixOriginals
) AS subquery
GROUP BY primary_genre;

--Q2 Which genre has the highest average runtime?
SELECT TOP 1 primary_genre, AVG(Runtime) AS Avg_Runtime
FROM (
    SELECT 
        CASE 
            WHEN CHARINDEX('/', Genre) > 0 THEN SUBSTRING(Genre, 1, CHARINDEX('/', Genre) - 1)
            ELSE Genre 
        END AS primary_genre, 
        Runtime
    FROM 
        dbo.NetflixOriginals
) AS subquery
GROUP BY primary_genre
ORDER BY Avg_Runtime DESC;

--Q3 Are longer movies rated higher on IMDB?
SELECT Runtime, IMDB_Score
FROM dbo.NetflixOriginals
WHERE Runtime > = 94
ORDER BY Runtime DESC;

--Q4 What is the distribution of movies across different languages?
SELECT COUNT(*) AS MOVIE_COUNT, Language
FROM dbo.NetflixOriginals
GROUP BY Language
ORDER BY  MOVIE_COUNT DESC;


--Q5 What is the trend in the number of releases over the years?
SELECT COUNT(*) AS Num_Of_Releases, YEAR(Premiere) as Years
FROM dbo.NetflixOriginals
GROUP BY YEAR(Premiere)



--Q6 Which year had the highest average IMDB score?
SELECT TOP 1 YEAR(Premiere) AS Years, AVG(IMDB_Score) as Avg_IMDB_Score
FROM dbo.NetflixOriginals
GROUP BY YEAR(Premiere)
ORDER BY  Avg_IMDB_Score DESC;

--Q7 Are movies in certain languages rated higher on average?
SELECT primary_language, AVG(IMDB_Score) AS AVG_IMDB_Score
FROM (SELECT 
            CASE 
            WHEN CHARINDEX('/', Language) > 0 THEN SUBSTRING(Language, 1, CHARINDEX('/', Language) - 1)
            ELSE Language 
        END AS primary_language, IMDB_Score
		FROM dbo.NetflixOriginals
) AS subquery
GROUP BY primary_language
ORDER BY AVG_IMDB_Score DESC;

--Q8 What is the distribution of IMDB scores?
SELECT 
    CASE 
        WHEN IMDB_Score >= 0 AND IMDB_Score < 2 THEN '0-1.9'
        WHEN IMDB_Score >= 2 AND IMDB_Score < 4 THEN '2-3.9'
        WHEN IMDB_Score >= 4 AND IMDB_Score < 6 THEN '4-5.9'
        WHEN IMDB_Score >= 6 AND IMDB_Score < 8 THEN '6-7.9'
        WHEN IMDB_Score >= 8 THEN '8-10'
    END AS IMDb_Score_Range,
    COUNT(*) AS Movie_Count
FROM 
    dbo.NetflixOriginals
GROUP BY 
    CASE 
        WHEN IMDB_Score >= 0 AND IMDB_Score < 2 THEN '0-1.9'
        WHEN IMDB_Score >= 2 AND IMDB_Score < 4 THEN '2-3.9'
        WHEN IMDB_Score >= 4 AND IMDB_Score < 6 THEN '4-5.9'
        WHEN IMDB_Score >= 6 AND IMDB_Score < 8 THEN '6-7.9'
        WHEN IMDB_Score >= 8 THEN '8-10'
    END
ORDER BY IMDb_Score_Range;

--Q9 What is the most common genre on Netflix?
SELECT TOP 1 primary_genre
FROM (SELECT 
            CASE 
            WHEN CHARINDEX('/', Genre) > 0 THEN SUBSTRING(Genre, 1, CHARINDEX('/', Genre) - 1)
            ELSE Genre 
        END AS primary_genre 
		FROM dbo.NetflixOriginals
) AS subquery
GROUP BY primary_genre;


--Q10 What is the average runtime of movies released in different months?
SELECT MONTH(Premiere) AS Month, AVG(Runtime) AS Avg_Runtime
FROM dbo.NetflixOriginals
GROUP BY MONTH(Premiere);
