-- question 1 --
SELECT * FROM movies;

-- question 2 --
SELECT id, title FROM movies LIMIT 10;

-- question 3 --
SELECT title FROM movies 
WHERE id="485";

-- question 4 --
SELECT id FROM movies 
WHERE title="Made in America (1993)";

-- question 5 --
SELECT title FROM movies
ORDER BY title ASC LIMIT 10;

-- question 6 --
SELECT title FROM movies
WHERE title LIKE "%2002%";

-- question 7 --
SELECT title FROM movies
WHERE title LIKE "%Godfather, The%";

-- question 8 --
SELECT title FROM movies
WHERE genres LIKE "Comedy";

-- question 9 --
SELECT title FROM movies
WHERE genres="Comedy" 
AND title LIKE "%2000%";

-- question 10 --
SELECT title FROM movies
WHERE title LIKE "%(2001)%" 
OR "%(2002)%";

-- question 11 --
SELECT title FROM movies
WHERE title LIKE "%super%" 
AND title LIKE "%2001%" OR "%2002%";

--- JOINS ---

-- question 1 --
SELECT ratings.rating, movies.title
FROM ratings
INNER JOIN movies ON ratings.movie_id=movies.id
WHERE movies.title LIKE "%Godfather, The%";

-- question 2 --
SELECT ratings.rating, ratings.timestamp,  movies.title
FROM ratings
INNER JOIN movies ON ratings.movie_id=movies.id
WHERE movies.title LIKE "%Godfather, The%"
ORDER BY ratings.timestamp;

-- question 3 --
SELECT links.imdb_id,  movies.title
FROM links
INNER JOIN movies ON links.imdb_id=movies.id
WHERE movies.title LIKE "%2005%" AND movies.genres LIKE "%comedy%"

-- questions 4 --
SELECT movies.title, ratings.rating
FROM ratings
INNER JOIN movies ON ratings.movie_id=movies.id
WHERE rating IS NULL;

-- AGGREGATE --

-- question 1--
SELECT AVG(rating)
FROM ratings
WHERE movie_id="858";

-- question 2 --
SELECT COUNT(rating)
FROM ratings
WHERE movie_id="858";

-- question 3 --
SELECT SUM(title)
FROM movies
WHERE genres="Horror";

-- question 4 --
SELECT AVG(rating)
FROM ratings
WHERE user_id="1";

-- question 5 --
SELECT ratings.user_id, COUNT(rating) AS count
FROM ratings
GROUP BY user_id
ORDER BY count DESC LIMIT 1;

-- question 6 --
SELECT ratings.user_id, AVG(rating) AS count
FROM ratings
GROUP BY user_id
ORDER BY count DESC LIMIT 1;

-- question 7 --
SELECT user_id, AVG(rating), COUNT(rating)
FROM ratings
GROUP BY user_id
HAVING COUNT(rating) > 50
ORDER BY AVG(rating) DESC LIMIT 1;




