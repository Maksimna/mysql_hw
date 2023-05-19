-- 1
SELECT
authors.name
FROM books
join authors_books on books.id = authors_books.books_id
join authors on authors.id = authors_books.authors_id
GROUP BY authors.id
ORDER BY COUNT(books.id) DESC
LIMIT 1;

-- 2
SELECT books.title, books.year 
FROM books 
WHERE year IS NOT NULL 
ORDER BY books.year asc
LIMIT 5;

-- 3 
SELECT count(*) as 'На полке в кабинете'
from books 
join shelves on books.shelves_id = shelves.id
where shelves.title = 'Полка в кабинете'
;

-- 4
SELECT 
books.title as 'Книга',
books.year as 'Год',
authors.name as 'Автор'
from books
join authors_books on books.id = authors_books.books_id
join authors on authors.id = authors_books.authors_id
join shelves on shelves.id = books.shelves_id
where shelves.title = 'Полка в спальне'
;

-- 5
select 
 books.title as 'Книга',
 books.year as 'Год',
 authors.name as 'Автор'
from books
join authors_books on books.id = authors_books.books_id
join authors on authors.id = authors_books.authors_id
join shelves on shelves.id = books.shelves_id
where authors.name = 'Лев Толстой'
order by books.title
;

-- 6
select
books.title,
authors.name
from books
join authors_books on books.id = authors_books.books_id
join authors on authors.id = authors_books.authors_id
where authors.name like 'а%'
;

-- 7
select 
books.title,
authors.name,
shelves.title
from books
join authors_books on books.id = authors_books.books_id
join authors on authors.id = authors_books.authors_id
join shelves on shelves.id = books.shelves_id
where shelves.title like 'верхняя%' or shelves.title like 'нижняя%'
;

-- 8
update books 
set books.friends_id = 1 
where id =9
;

-- 9
INSERT INTO `books` (`title`, `year`, `shelves_id`)
VALUES
('Краткие ответы на большие вопросы', '2020', 1)
;
insert into authors (name)
values 
('Стивен Хокинг')
;