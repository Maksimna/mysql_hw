-- 1
Select sum(amount)
from hardware;
-- 2
select * from hardware 
where amount = 0;
-- 3
select avg(price) 
from hardware  
where title like '%Монитор%';
-- 4
select * 
from hardware 
where title like '%Клавиатура%'
order by price asc;
-- 5
select tag, count(*)
from hardware
group by tag order by tag desc;
-- 6
select title, tag from hardware
where tag  like '%discount%';
-- 7
select title, price 
from hardware 
where tag = 'new' 
order by price desc limit 1;
-- 8
INSERT INTO `hardware` (`title`, `price`, `amount`, `tag`) 
VALUES
  ('Ноутбук Lenovo 2BXKQ7E9XD', '54500', '1', 'new');
-- 9
DELETE FROM hardware WHERE hardware.title = 'Очки PS VR 2';