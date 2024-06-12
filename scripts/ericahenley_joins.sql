-- 1. Give the name, release year, and worldwide gross of the lowest grossing movie.

-- SELECT specs.film_title, specs.release_year, MIN(worldwide_gross) AS lowest_gross
-- FROM specs
-- INNER JOIN revenue
-- ON specs.movie_id = revenue.movie_id
-- GROUP BY specs.film_title, specs.release_year, revenue.worldwide_gross
-- ORDER BY lowest_gross

-- Semi-Tough, 1977, 37187139


-- 2. What year has the highest average imdb rating?

-- SELECT release_year, AVG(imdb_rating) AS highest_imdb
-- FROM specs
-- INNER JOIN rating
-- ON specs.movie_id = rating.movie_id
-- GROUP BY specs.release_year
-- ORDER BY highest_imdb desc
-- LIMIT 1;

-- 1991, 7.45

-- 3. What is the highest grossing G-rated movie? Which company distributed it?

-- SELECT specs.film_title, specs.mpaa_rating, MAX(revenue.worldwide_gross) AS highest_gross, distributors.company_name
-- FROM specs
-- LEFT JOIN distributors
-- ON specs.domestic_distributor_id = distributor_id
-- LEFT JOIN revenue
-- USING (movie_id)
-- WHERE specs.mpaa_rating = 'G'
-- GROUP BY specs.film_title, specs.mpaa_rating, revenue.worldwide_gross, distributors.company_name
-- ORDER BY highest_gross desc

-- Toy Story 4, Walt Disney, worldwide gross = 1073394593

-- 4. Write a query that returns, for each distributor in the distributors table, the distributor name and the number of movies associated with that distributor in the movies 
-- table. Your result set should include all of the distributors, whether or not they have any movies in the movies table.

-- SELECT DISTINCT(company_name), COUNT(film_title) AS count_film_title
-- FROM distributors
-- LEFT JOIN specs
-- ON distributors.distributor_id = specs.domestic_distributor_id
-- GROUP BY company_name
-- ORDER BY count_film_title DESC;

-- 5. Write a query that returns the five distributors with the highest average movie budget.

-- SELECT distributors.company_name, CAST(AVG(revenue.film_budget) AS MONEY) AS avg_budget
-- FROM specs
-- INNER JOIN distributors
-- ON distributors.distributor_id = specs.domestic_distributor_id
-- INNER JOIN revenue
-- USING(movie_id)
-- GROUP BY distributors.company_name
-- ORDER BY avg_budget DESC
-- LIMIT 5

-- 6. How many movies in the dataset are distributed by a company which is not headquartered in California? Which of these movies has the highest imdb rating?

-- SELECT specs.film_title, rating.imdb_rating
-- FROM specs
-- INNER JOIN distributors
-- ON distributors.distributor_id = specs.domestic_distributor_id
-- INNER JOIN rating
-- USING(movie_id)
-- WHERE distributors.headquarters NOT ILIKE '%CA'
-- ORDER BY imdb_rating DESC;

-- 2, Dirty Dancing (7.0), My Big Fat Greek Wedding (6.5)


-- 7. Which have a higher average rating, movies which are over two hours long or movies which are under two hours?

-- SELECT specs.length_in_min, AVG(rating.imdb_rating) AS avg_rating
-- FROM specs
-- INNER JOIN rating
-- ON specs.movie_id = rating.movie_id
-- WHERE length_in_min > 120
-- GROUP BY specs.length_in_min, rating.imdb_rating
-- ORDER BY avg_rating DESC
-- LIMIT 1;

-- highest rating was 9

-- SELECT specs.length_in_min, AVG(rating.imdb_rating) AS avg_rating
-- FROM specs
-- INNER JOIN rating
-- ON specs.movie_id = rating.movie_id
-- WHERE length_in_min < 120
-- GROUP BY specs.length_in_min, rating.imdb_rating
-- ORDER BY avg_rating DESC
-- LIMIT 1;

-- highest rating was 8.6

-- Movies over two hours wins
-- can also UNION

-- SELECT 'movies over 2 hours' AS movie_length, AVG(rating.imdb_rating) AS avg_rating
-- FROM rating 
-- JOIN specs 
-- USING(movie_id)
-- WHERE specs.length_in_min >= 120

-- UNION 

-- SELECT 'movies under 2 hours' AS movie_length, AVG(rating.imdb_rating) AS avg_rating
-- FROM rating 
-- JOIN specs 
-- USING(movie_id)
-- WHERE specs.length_in_min < 120
-- ;