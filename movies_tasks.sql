-- 1
SELECT COUNT(*) AS Quantity
FROM movies
INNER JOIN companies ON companies.id = movies.company_id 
WHERE companies.title = 'Universal Pictures'
;

-- 2
SELECT COUNT(*) AS ФренсисMovies
FROM movies
JOIN directors ON directors.id = movies.director_id
WHERE directors.full_name = 'Фрэнсис Форд Коппола'
;


-- 3
SELECT COUNT(*) AS FilmName
FROM movies
WHERE year >= YEAR(CURDATE()) - 20
;

-- 4
SELECT DISTINCT COUNT(*) AS AllGenresStive
FROM movies
JOIN genres ON genres.id = movies.genre_id
JOIN directors ON directors.id = movies.director_id
WHERE directors.full_name = 'Стивен Спилберг'
;

-- 5
select
movies.title AS movie,
genres.title AS genre,
directors.full_name AS director,
movies.budget
from movies
JOIN directors ON movies.director_id = directors.id
JOIN genres ON movies.genre_id = genres.id
order by budget desc
limit 5
;

-- 6
select
directors.full_name,
count(movies.id)
from movies
join directors on movies.director_id = directors.id
GROUP BY directors.id
ORDER BY COUNT(movies.id) DESC
LIMIT 1
;

-- 7
select
movies.title,
genres.title AS Genre,
companies.title AS MovCompany
from movies
join genres on genres.id = movies.genre_id
join companies on companies.id = movies.company_id
WHERE companies.id = (SELECT company_id FROM movies
GROUP BY company_id
ORDER BY SUM(budget) DESC
LIMIT 1)
ORDER BY movies.year ASC;
;

-- 8
SELECT AVG(movies.budget)
FROM movies
JOIN companies ON companies.id = movies.company_id
WHERE companies.title = 'Warner Bros.'
;

-- 9
select COUNT(*) AS QuantityMovies , AVG(movies.budget) AS Budget
from movies
JOIN genres on genres.id = movies.genre_id
group by genre_id
;

-- 10
DELETE FROM movies
WHERE movies.title = 'Дикие истории'
AND genre_id = (SELECT id FROM genres WHERE title = 'комедия');
;