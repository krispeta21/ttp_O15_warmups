--Which are the 10 longest R rated movies?

SELECT 
film_id, length
FROM 
film 
ORDER BY
length DESC
LIMIT 10;


-- What are the NEXT 10 longest R rated movies?
-- hint: google "how to get next 10 records in sql"


SELECT 
film_id, length
FROM 
film 
ORDER BY
length DESC
OFFSET 
10 ROWS
FETCH NEXT 10 ROWS ONLY;




--How many films are as long as the longest film?
-- RETURN an exact number

SELECT COUNT(film_id)
FROM film
WHERE length = 184;


--Which are the 10 longest R rated movies, SORTED IN ALPHABETICAL ORDER?
-- hint: might need a subquery


WITH r_film AS (SELECT 
                film_id, title, length
                FROM
                film
                WHERE
                rating = 'R'
                ORDER BY
                length DESC
                LIMIT 10)
SELECT
title, length 
FROM
r_film
ORDER BY
title;

--Which are the 10 kids films with the longest description?
-- G, PG, PG-13
--hint: google "SQL count length of string"

SELECT 
title, description, rating, char_length(description) AS description_length
FROM
film
WHERE 
rating = 'G'
or 
rating = 'PG'
or 
rating = 'PG-13'
Order by description_length DESC
LIMIT
10;


-- How many unique release_years are there in the dvd rental database?
-- Return an exact number

SELECT COUNT(Distinct(release_year)) from film;
