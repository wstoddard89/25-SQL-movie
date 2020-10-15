-- Normal Mode --

-- Select all columns and rows from the movies table --
SELECT * FROM movies;

-- Select only the title and id of the first 10 rows --
SELECT id, title FROM movies LIMIT 10;

-- Find the movie with the id of 485 --
SELECT title FROM movies 
WHERE id="485";

-- Find the id (only that column) of the movie Made in America (1993) --
SELECT id FROM movies 
WHERE title="Made in America (1993)";

-- Find the first 10 sorted alphabetically --
SELECT title FROM movies
ORDER BY title ASC LIMIT 10;

-- Find all movies from 2002 --
SELECT title FROM movies
WHERE title LIKE "%2002%";

-- Find out what year the Godfather came out --
SELECT title FROM movies
WHERE title LIKE "%Godfather, The%";

-- Without using joins find all the comedies --
SELECT title FROM movies
WHERE genres LIKE "Comedy";

-- Find all comedies in the year 2000 --
SELECT title FROM movies
WHERE genres="Comedy" 
AND title LIKE "%2000%";

-- Find any movies that are about death and are a comedy --
SELECT title FROM movies
WHERE title LIKE "%(2001)%" 
OR "%(2002)%";

-- Find any movies from either 2001 or 2002 with a title containing super --
SELECT title FROM movies
WHERE title LIKE "%super%" 
AND title LIKE "%2001%" OR "%2002%";


--- JOINS ---

-- Find all the ratings for the movie Godfather, show just the title and the rating --
SELECT ratings.rating, movies.title
FROM ratings
INNER JOIN movies ON ratings.movie_id=movies.id
WHERE movies.title LIKE "%Godfather, The%";

-- Order the previous objective by newest to oldest --
SELECT ratings.rating, ratings.timestamp,  movies.title
FROM ratings
INNER JOIN movies ON ratings.movie_id=movies.id
WHERE movies.title LIKE "%Godfather, The%"
ORDER BY ratings.timestamp;

-- Find the comedies from 2005 and get the title and imdbid from the links table --
SELECT links.imdb_id,  movies.title
FROM links
INNER JOIN movies ON links.imdb_id=movies.id
WHERE movies.title LIKE "%2005%" AND movies.genres LIKE "%comedy%"

-- Find all movies that have no ratings --
SELECT movies.title, ratings.rating
FROM ratings
INNER JOIN movies ON ratings.movie_id=movies.id
WHERE rating IS NULL;


-- AGGREGATE --

-- Get the average rating for a movie--
SELECT AVG(rating)
FROM ratings
WHERE movie_id="858";

-- Get the total ratings for a movie --
SELECT COUNT(rating)
FROM ratings
WHERE movie_id="858";

-- Get the total movies for a genre --
SELECT SUM(title)
FROM movies
WHERE genres="Horror";

-- Get the average rating for a user --
SELECT AVG(rating)
FROM ratings
WHERE user_id="1";

-- Find the user with the most ratings --
SELECT ratings.user_id, COUNT(rating) AS count
FROM ratings
GROUP BY user_id
ORDER BY count DESC LIMIT 1;

-- Find the user with the highest average rating --
SELECT ratings.user_id, AVG(rating) AS count
FROM ratings
GROUP BY user_id
ORDER BY count DESC LIMIT 1;

-- Find the user with the highest average rating with more than 50 reviews --
SELECT user_id, AVG(rating), COUNT(rating)
FROM ratings
GROUP BY user_id
HAVING COUNT(rating) > 50
ORDER BY AVG(rating) DESC LIMIT 1;

-- Find the movies with an average rating over 4 --
SELECT AVG(rating), ratings.movie_id
FROM ratings
GROUP BY movie_id
HAVING AVG(rating) > 4
ORDER BY movie_id;



