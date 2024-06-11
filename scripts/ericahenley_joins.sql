-- 1. Give the name, release year, and worldwide gross of the lowest grossing movie.

-- SELECT specs.film_title, specs.release_year, MIN(worldwide_gross) AS lowest_gross
-- FROM specs
-- INNER JOIN revenue
-- ON specs.movie_id = revenue.movie_id
-- GROUP BY specs.film_title, specs.release_year, revenue.worldwide_gross
-- ORDER BY lowest_gross

-- Semi-Tough, 1977, 37187139


-- 2. What year has the highest average imdb rating?

-- SELECT release_year, MAX(imdb_rating) AS highest_imdb
-- FROM specs
-- INNER JOIN rating
-- ON specs.movie_id = rating.movie_id
-- GROUP BY specs.release_year, rating.imdb_rating
-- ORDER BY highest_imdb desc
-- LIMIT 1;

-- 2008, 9.0

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

-- Toy Story 4

-- 4. Write a query that returns, for each distributor in the distributors table, the distributor name and the number of movies associated with that distributor in the movies 
-- table. Your result set should include all of the distributors, whether or not they have any movies in the movies table.

-- SELECT distributor_id
-- FROM distributors
-- UNION ALL specs
-- ON domestic_distributor_id

-- 5. Write a query that returns the five distributors with the highest average movie budget.



-- 6. How many movies in the dataset are distributed by a company which is not headquartered in California? Which of these movies has the highest imdb rating?




-- 7. Which have a higher average rating, movies which are over two hours long or movies which are under two hours?




